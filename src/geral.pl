:- [src/database/data].
:- (dynamic filme/11, genero/1).

menu_rec_geral :-
    new(Dialog, dialog('Recomendacao Geral')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background,'#ffffdf'),
    send_list(Dialog, append, 
                  [ 
                    new(Ano, text_item('Digite o ano:')),
                    new(Genero, menu(genero, cycle)),
                    new(Classificacao, slider('Classificacao', 0.0, 10.0, 5.0)),
                    new(Cancel,button(cancelar, message(Dialog, destroy))),
                    new(Conf,button(confirmar, and(message(@prolog,
                                              rec_geral,
                                              Ano?selection,
                                              Genero?selection,
                                              Classificacao?selection
                                              ),
                                      message(Dialog, destroy))))
                  ]),
    
    forall(genero(G), send_list(Genero, append, G)),
    send(Ano, colour('#000000')),
    send(Genero, colour('#000000')),
    send(Classificacao, colour('#000000')),
    send(Dialog, default_button, confirmar),
    send(Dialog, open_centered).



rec_geral(Ano,Genero, Classificacao) :-
    new(D, dialog('Filmes Recomendados')),
    send(D, size, size(900, 500)),
    send(D, background,'#ffffdf'),
    text_to_int(Ano, AnoInt),
    findall(Filme,
            ( 
                filme(Filme,AnoInt,_,Genero,Filtro,_,_,_,_,_,_),Filtro>=Classificacao
                
            ),
            Filmes),
    remov_dup(Filmes, FilmesSemRep),
    send(D, append, new(T, text('Filmes do ano ')),right),
    send(T, append, Ano),
    send(D, append(T)),
    send(D, append, new(T2, text('do genero ')),right),
    send(T2, append, Genero),
    send(D, append(T2)),
    send(D, append, new(T3, text('e com classificação igual ou superior a ')),right),
    send(T3, append, Classificacao),
    send(D, append(T3)),
    new(F, font(screen, bold, 20)),
    send(T, font, F),
    send(T2, font, F),
    send(T3, font, F),
    append_text_dialog(FilmesSemRep, D),
    send(D, scrollbars, vertical),
    send(D, open_centered).
    







