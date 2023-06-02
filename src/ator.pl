:- use_module(library(pce)).
:- [src/database/data].
:- [src/util].
:- (dynamic movie/11, ator/1).

menu_rec_ator :-
    new(Dialog, dialog('Recomendacao por Ator')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background,'#ffffdf'),
    send_list(Dialog, append, 
                  [ 
                    new(Ator, menu(ator,cycle)),
                    new(Cancel,button(cancelar, message(Dialog, destroy))),
                    new(Conf,button(confirmar, and(message(@prolog,
                                              rec_ator,
                                              Ator?selection),
                                      message(Dialog, destroy))))
                  ]),
    forall(ator(A), send_list(Ator, append, A)),
    send(Dialog, display,Ator,point(120,10)),
    send(Ator, colour('#000000')),
    send(Dialog, default_button, confirmar),
    send(Dialog, display,Conf,point(180,50)),
    send(Dialog,display,Cancel,point(280,50)),
    send(Dialog, open_centered).



rec_ator(Ator) :-
    new(D, dialog('Filmes Recomendados')),
    send(D, size, size(750, 500)),
    send(D, background,'#ffffdf'),
    findall(Filme,
            ( 
                filme(Filme,_,_,_,_,_,Ator,_,_,_,_);
                filme(Filme,_,_,_,_,_,_,Ator,_,_,_);
                filme(Filme,_,_,_,_,_,_,_,Ator,_,_);
                filme(Filme,_,_,_,_,_,_,_,_,Ator,_)
            ),
            Filmes),
    remov_dup(Filmes, FilmesSemRep),
    send(D, append, new(T, text('Filmes Recomendados do ator ')), right),
    send(T, append,Ator),
	new(F, font(screen, bold, 20)),
	send(T, font(F)),
    send(T,colour('#000000')),
    send(D, append(T)),
    append_text_dialog(FilmesSemRep, D),
    send(D, scrollbars, vertical),
    send(D, open_centered).


