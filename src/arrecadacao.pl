menu_rec_arrecadacao :-
    new(Dialog, dialog('Recomendacao por Arrecadacao(em dolares)')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background, '#87CEEB'),
    send_list(Dialog,
              append,
              
              [ new(Arrecadacao, slider('Arrecadacao', 1300, 937000000, 1000000)),
                button(cancelar, message(Dialog, destroy)),
                button(confirmar,
                       and(message(@prolog,
                                   rec_arrecadacao,
                                   Arrecadacao?selection),
                           message(Dialog, destroy)))
              ]),
    send(Arrecadacao, colour('#000000')),
    send(Dialog, open_centered).


rec_arrecadacao(Arrecadacao) :-
    new(D, dialog('Filmes Recomendados')),
    findall(Filme,
            ( filme(_,_,Filme,_,_,_,Arrecadacao)
            ),
            Filmes),
    append_text_dialog(Filmes, D),
    send(D, open).