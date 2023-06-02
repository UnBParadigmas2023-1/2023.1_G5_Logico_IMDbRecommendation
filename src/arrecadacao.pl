
menu_rec_arrecadacao :-
    new(Dialog, dialog('Recomendacao por Arrecadacao(em dolares)')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background,'#ffffdf'),
    send_list(Dialog, append, 
                  [ 
                    new(Arrecadacao, text_item('Digite um valor de arrecadação:')),
                    new(Cancel,button(cancelar, message(Dialog, destroy))),
                    new(Conf,button(confirmar, and(message(@prolog,
                                              rec_arrecadacao,
                                              Arrecadacao?selection),
                                      message(Dialog, destroy))))
                  ]),
    send(Dialog, display,Arrecadacao,point(110,10)),
    send(Arrecadacao, colour('#000000')),
    send(Dialog, default_button, confirmar),
    send(Dialog, display,Conf,point(180,50)),
    send(Dialog,display,Cancel,point(280,50)),
    send(Dialog, open_centered).



rec_arrecadacao(Arrecadacao) :-
    new(D, dialog('Filmes Recomendados')),
    send(D, size, size(750, 500)),
    send(D, background, '#ffffdf'),
    text_to_int(Arrecadacao, ArrecadacaoInt),
    findall(Filme,
            ( 
                filme(Filme,_,_,_,_,_,_,_,_,_,Case),Case=<ArrecadacaoInt
            ),
            Filmes),
    remov_dup(Filmes, FilmesSemRep),
    send(D, append, new(T, text('Filmes com arrecadação de até '))),
    send(T, append,Arrecadacao),
    send(D, append(T)),
    send(D, append, new(T2, text('dolares')),right),
    new(F, font(screen, bold, 20)),
    send(T, font, F),
    send(T2, font, F),
    append_text_dialog(FilmesSemRep, D),
    send(D, scrollbars, vertical),
    send(D, open_centered).

