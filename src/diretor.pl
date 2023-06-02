
menu_rec_diretor :-
    new(Dialog, dialog('Recomendacao por Diretores')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background, '#ffffdf'),
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


rec_diretor(Diretor) :-
    new(D, dialog('Filmes Recomendados')),
    send(D, size, size(750, 500)),
    send(D, background,'#ffffdf'),
    findall(Filme,
            ( filme(Filme,_,_,_,_,Diretor,_,_,_,_,_)
              
            ),
            Filmes),
    remov_dup(Filmes, FilmesSemRep),
    send(D, append, new(T, text('Filmes Recomendados do diretor ')), right),
    send(T, append,Diretor),
	new(F, font(screen, bold, 20)),
	send(T, font(F)),
    send(T,colour('#000000')),
    send(D, append(T)),
    append_text_dialog(FilmesSemRep, D),
    send(D, scrollbars, vertical),
    send(D, open_centered).

