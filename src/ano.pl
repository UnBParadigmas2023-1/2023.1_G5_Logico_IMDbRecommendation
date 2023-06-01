:- use_module(library(pce)).
:- [src/database/data].
:- [src/util].
:- (dynamic movie/11).




menu_rec_ano :-
    new(Dialog, dialog('Recomendacao por Ano')),
    send(Dialog, size, size(620, 500)),
    send(Dialog, background,'#ffffdf'),
    send_list(Dialog, append, 
                  [ 
                    new(Ano, text_item('Digite o ano:')),
                    new(Cancel,button(cancelar, message(Dialog, destroy))),
                    new(Conf,button(confirmar, and(message(@prolog,
                                              rec_ano,
                                              Ano?selection),
                                      message(Dialog, destroy))))
                  ]),
    send(Dialog, display,Ano,point(110,10)),
    send(Ano, colour('#000000')),
    send(Dialog, default_button, confirmar),
    send(Dialog, display,Conf,point(180,50)),
    send(Dialog,display,Cancel,point(280,50)),
    send(Dialog, open_centered).



rec_ano(Ano) :-
    new(D, dialog('Filmes Recomendados')),
    send(D, size, size(520, 500)),
    send(D, background,'#ffffdf'),
    text_to_int(Ano, AnoInt),
    findall(Filme,
            ( 
                filme(Filme,AnoInt,_,_,_,_,_,_,_,_,_)
                
            ),
            Filmes),
    send(D, append, new(T, text('Filmes Recomendados do ano ')), right),
    send(T, append,Ano),
	new(F, font(screen, bold, 20)),
	send(T, font(F)),
    send(T,colour('#000000')),
    send(D, append(T)),
    append_text_dialog(Filmes, D),
    send(D, scrollbars, vertical),
    send(D, open_centered).
    
