menu_rec_classificacao :-
    new(Dialog, dialog('Recomendacao por avaliação IMDb ')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background, '#87CEEB'),
    send_list(Dialog,
              append,
              
              [ new(Classificacao, slider('Avaliação IMDb ', 0.0, 10.0, 8.0)),
                button(cancelar, message(Dialog, destroy)),
                button(confirmar,
                       and(message(@prolog,
                                   rec_duracao,
                                   Classificacao?selection),
                           message(Dialog, destroy)))
              ]),
    send(Classificacao, colour('#000000')),
    send(Classificacao, open_centered).

rec_classificacao(Classificacao) :-
    new(D, dialog('Filmes Recomendados')),
    findall(Filme,
            ( filme(_,_,Filme,_,_,Classificacao,_)
            ),
            Filmes),
    append_text_dialog(Filmes, D),
    send(D, open).