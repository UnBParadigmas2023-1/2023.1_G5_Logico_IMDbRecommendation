:- [src/database/data].
:- (dynamic filme/11, genero/1).

menu_rec_genero :-
    new(Dialog, dialog('Recomendacao por Genero')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background, '#87CEEB'),
    send_list(Dialog,
              append,
              
              [ new(Genero, menu(genero, cycle)),
                button(cancelar, message(Dialog, destroy)),
                button(confirmar,
                       and(message(@prolog,
                                   rec_genero,
                                   Genero?selection),
                           message(Dialog, destroy)))
              ]),
    forall(genero(G), send_list(Genero, append, G)),
    send(Genero, colour('#000000')),
    send(Dialog, open_centered).


rec_genero(Genero) :-
    new(D, dialog('Filmes Recomendados')),
    findall(Filme,
            ( filme(Filme,_,_,Genero,_,_,_,_,_,_,_)
              
            ),
            Filmes),
    append_text_dialog(Filmes, D),
    send(D, open).

