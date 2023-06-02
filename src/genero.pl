:- [src/database/data].
:- (dynamic filme/11, genero/1).

menu_rec_genero :-
    new(Dialog, dialog('Recomendacao por Genero')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background,'#ffffdf'),
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
    send(D, size, size(750, 500)),
    send(D, background,'#ffffdf'),
    findall(Filme,
            ( filme(Filme,_,_,Genero,_,_,_,_,_,_,_)
              
            ),
            Filmes),
    remov_dup(Filmes, FilmesSemRep),
    send(D, append, new(T, text('Filmes Recomendados do genero ')), right),
    send(T, append,Genero),
	new(F, font(screen, bold, 20)),
	send(T, font(F)),
    send(T,colour('#000000')),
    send(D, append(T)),
    append_text_dialog(FilmesSemRep, D),
    send(D, scrollbars, vertical),
    send(D, open_centered).
