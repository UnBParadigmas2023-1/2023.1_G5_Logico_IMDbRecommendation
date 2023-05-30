:- use_module(library(pce)).
:- [src/database/data].
:- [src/util].
:- (dynamic movie/11).




menu_rec_ano :-
    new(Dialog, dialog('Recomendacao por Ano')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background, '#c8c8c8'),
    send_list(Dialog,
              append,
              
              [ new(Ano, slider('Ano de lançamento', 1920, 2023, 1970)),
                button(cancelar, message(Dialog, destroy)),
                button(confirmar,
                       and(message(@prolog,
                                   rec_ano,
                                   Ano?selection),
                           message(Dialog, destroy)))
              ]),
    send(Ano, colour('#000000')),
    send(Dialog, open_centered).


rec_ano(Ano) :-
    new(D, dialog('Filmes Recomendados')),
    send(D, background, '#c8c8c8'),
    findall(Filme,
            ( 
                filme(Filme,Ano,_,_,_,_,_,_,_,_,_)
                
            ),
            Filmes),
    send(D,append, new(T, text('Filmes Recomendados do ano  '))),
    send(T, append, Ano),
	new(F, font(screen, bold, 20)),
	send(T, font(F)),
    send(T,colour('#000000')),
    send(D, append(T)),
    append_text_dialog(Filmes, D),
    send(D, open_centered).





  