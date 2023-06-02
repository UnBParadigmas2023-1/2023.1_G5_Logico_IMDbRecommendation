
menu_rec_arrecadacao :-
    new(Dialog, dialog('Recomendacao por Arrecadacao(em dolares)')),
    send(Dialog, size, size(850, 500)),
    send(Dialog, background,'#ffffdf'),
    send_list(Dialog, append, 
                  [ 
                    new(ArrecadacaoLi, text_item('Digite um valor de arrecadação minimo:')),
                    new(ArrecadacaoLs, text_item('Digite um valor de arrecadação maximo:')),
                    new(Cancel,button(cancelar, message(Dialog, destroy))),
                    new(Conf,button(confirmar, and(message(@prolog,
                                              rec_arrecadacao,
                                              ArrecadacaoLi?selection,
                                              ArrecadacaoLs?selection),
                                      message(Dialog, destroy))))
                  ]),
    send(Dialog, display,ArrecadacaoLi,point(110,10)),
    send(ArrecadacaoLi, colour('#000000')),
    send(Dialog, display,ArrecadacaoLs,point(110,50)),
    send(ArrecadacaoLs, colour('#000000')),
    send(Dialog, default_button, confirmar),
    send(Dialog, display,Conf,point(180,90)),
    send(Dialog,display,Cancel,point(280,90)),
    send(Dialog, open_centered).



rec_arrecadacao(ArrecadacaoLi, ArrecadacaoLs) :-
    new(D, dialog('Filmes Recomendados')),
    send(D, size, size(750, 500)),
    send(D, background, '#ffffdf'),
    text_to_int(ArrecadacaoLi, ArrecadacaoLiInt),
    text_to_int(ArrecadacaoLs, ArrecadacaoLsInt),
    findall(Filme,
            ( 
                filme(Filme,_,_,_,_,_,_,_,_,_,Case),Case>=ArrecadacaoLiInt,Case=<ArrecadacaoLsInt
            ),
            Filmes),
    remov_dup(Filmes, FilmesSemRep),
    send(D, append, new(T, text('Filmes com arrecadação no entre '))),
    send(T, append, ArrecadacaoLi),
    send(D, append(T)),
    send(D, append, new(T2, text('e ')),right),
    send(T2, append, ArrecadacaoLs),
    send(D, append(T2)),
    send(D, append, new(T3, text('dolares:')),right),
    new(F, font(screen, bold, 20)),
    send(T, font, F),
    send(T2, font, F),
    send(T3, font, F),
    append_text_dialog(FilmesSemRep, D),
    send(D, scrollbars, vertical),
    send(D, open_centered).

