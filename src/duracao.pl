


menu_rec_duracao :-
    new(Dialog, dialog('Recomendacao por Duracao (em minutos)')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background, '#ffffdf'),
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
    new(D, dialog('Recomendacao por Duracao (em minutos)')),
    send(D, size, size(500, 500)),
    send(D, background, '#ffffdf'),
    
    findall(Filme,
            (
               filme(Filme,_,Cases,_,_,_,_,_,_,_,_),Cases=<Duracao
               
            ),
            Filmes),
    remov_dup(Filmes, FilmesSemRep),
    send(D, append, new(T, text('Filmes com duração de até '))),
    send(T, append,Duracao),
    send(D, append(T)),
    send(D, append, new(T2, text('minutos')), right),
    new(F, font(screen, bold, 20)),
    send(T, font, F),
    send(T2, font, F),
    append_text_dialog(FilmesSemRep, D),
    send(D, scrollbars, vertical),
    send(D, open_centered).



