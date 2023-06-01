menu_rec_genero :-
    new(Dialog, dialog('Recomendacao por Genero')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background, '#87CEEB'),
    send_list(Dialog,
              append,
              
              [ new(genero, menu(genero, cycle)),
                button(cancelar, message(Dialog, destroy)),
                button(confirmar,
                       and(message(@prolog,
                                   rec_genero,
                                   genero?selection),
                           message(Dialog, destroy)))
              ]),
    forall(genre(G), send_list(genero, append, G)),
    send(genero, colour('#000000')),
    send(Dialog, open_centered).


rec_genero(genero) :-
    new(D, dialog('Filmes Recomendados')),
    findall(Filme,
            ( filme(_,_,Filme,_,_,_,genero)
            ),
            Filmes),
    append_text_dialog(Filmes, D),
    send(D, open).