menu_rec_duracao :-
    new(Dialog, dialog('Recomendacao por Duracao (em minutos)')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background, '#87CEEB'),
    send_list(Dialog,
              append,
              
              [ new(Duracao, slider('Duracao em minutos', 50, 350, 120)),
                button(cancelar, message(Dialog, destroy)),
                button(confirmar,
                       and(message(@prolog,
                                   rec_duracao,
                                   Duracao?selection),
                           message(Dialog, destroy)))
              ]),
    send(Duracao, colour('#000000')),
    send(Dialog, open_centered).

rec_duracao(Duracao) :-
    new(D, dialog('Filmes Recomendados')),
    findall(Filme,
            ( filme(_,_,Filme,_,_,Duracao,_)
            ),
            Filmes),
    append_text_dialog(Filmes, D),
    send(D, open).