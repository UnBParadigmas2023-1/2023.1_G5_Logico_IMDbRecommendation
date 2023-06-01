:- [src/database/data].
:- (dynamic filme/11, diretor/1).

menu_rec_diretor :-
    new(Dialog, dialog('Recomendacao por Diretores')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background, '#87CEEB'),
    send_list(Dialog,
              append,
              
              [ new(Diretor, menu(diretor, cycle)),
                button(cancelar, message(Dialog, destroy)),
                button(confirmar,
                       and(message(@prolog,
                                   rec_diretor,
                                   Diretor?selection),
                           message(Dialog, destroy)))
              ]),
    forall(diretor(G), send_list(Diretor, append, G)),
    send(Diretor, colour('#000000')),
    send(Dialog, open_centered).


rec_(Diretor) :-
    new(D, dialog('Filmes Recomendados')),
    findall(Filme,
            ( filme(Filme,_,_,_,_,Diretor,_,_,_,_,_)
              
            ),
            Filmes),
    append_text_dialog(Filmes, D),
    send(D, open).
