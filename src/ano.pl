

menu_rec_ano :-
    new(Dialog, dialog('Recomendacao por Ano')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background, '#87CEEB'),
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
    findall(Filme,
            ( filme(_,_,Filme,_,Ano,_,_)
            ),
            Filmes),
    append_text_dialog(Filmes, D),
    send(D, open).