menu_rec_diretor :-
    new(Dialog, dialog('Recomendacao por Diretor')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background, '#23617a'),
    send_list(Dialog,
              append,

              [ new(diretor, slider('Diretor:', Frank Darabont, Steven Spielberg, Jonathan Demme)),
                button(cancelar, message(Dialog, destroy)),
                button(confirmar,
                       and(message(@prolog,
                                   rec_diretor,
                                   diretor?selection),
                           message(Dialog, destroy)))
              ]),
    send(diretor, colour('#000000')),
    send(Dialog, open_centered).


rec_diretor(diretor) :-
    new(D, dialog('Filmes Recomendados')),
    findall(Filme,
            ( filme(_,_,Filme,Diretor,_,_,_)
            ),
            Filmes),
    append_text_dialog(Filmes, D),
    send(D, open).
