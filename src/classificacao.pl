:- use_module(library(pce)).
:- [src/database/data].
:- (dynamic filme/11).


menu_rec_classificacao :-
    new(Dialog, dialog('Recomendacao por Classificacao do IMDb')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background, '#87CEEB'),
    send_list(Dialog,
              append,
              
              [ new(Classificacao, slider('Classificacao', 0.0, 10.0, 5.0)),
                button(cancelar, message(Dialog, destroy)),
                button(confirmar,
                       and(message(@prolog,
                                   rec_Classificacao,
                                   Classificacao?selection),
                           message(Dialog, destroy)))
              ]),
    send(Classificacao, colour('#000000')),
    send(Dialog, open_centered).

rec_Classificacao(Classificacao) :-
    new(D, dialog('Filmes Recomendados')),
    findall(Filme,
            ( 
                filme(Filme,_,_,_,Filtro,_,_,_,_,_,_)
            ),
            Filmes),
    append_text_dialog(Filmes, D),
    send(D, open).