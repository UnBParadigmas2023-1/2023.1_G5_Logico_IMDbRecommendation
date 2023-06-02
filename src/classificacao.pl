
menu_rec_classificacao :-
    new(Dialog, dialog('Recomendacao por Classificacao do IMDb')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background, '#ffffdf'),
    send_list(Dialog,
              append,
              
              [ new(Classificacao, slider('Classificacao', 0.0, 10.0, 5.0)),
                button(cancelar, message(Dialog, destroy)),
                button(confirmar,
                       and(message(@prolog,
                                   rec_Classificacao,
                                   Classificacao?selection),
                           message(Dialog, destroy)))
              ]),
    send(Classificacao, colour('#000000')),
    send(Dialog, open_centered).

rec_Classificacao(Classificacao) :-
    new(D, dialog('Filmes Recomendados')),
    send(D, size, size(750, 500)),
    send(D, background,'#ffffdf'),
    findall(S,
            ( 
                filme(Filme,_,_,_,Filtro,_,_,_,_,_,_),Filtro=<Classificacao,
                atomic_list_concat([Filme, Filtro],': ', S)

            ),
            Filmes),
    
    remov_dup(Filmes, FilmesUnicos),
    send(D, append, new(T, text('Filmes Recomendados com classificação até ')), right),
    send(T, append, Classificacao),
	new(F, font(screen, bold, 20)),
	send(T, font(F)),
    send(T,colour('#000000')),
    send(D, append(T)),
    append_text_dialog(FilmesUnicos, D),
    send(D, scrollbars, vertical),
    send(D, open_centered).



