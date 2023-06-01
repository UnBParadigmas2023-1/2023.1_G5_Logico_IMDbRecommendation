:- use_module(library(pce)).
:- [src/ano].
:- [src/duracao].
:- [src/diretor].
:- [src/arrecadacao].
:- [src/genero].
:- [src/ator].
:- [src/classificacao].



menu:-
    new(Dialog, dialog('IMDb Recommendation')),
    send(Dialog, size, size(500, 500)),
    send(Dialog, background, '#87CEEB'),
    send_list(Dialog,
              append,
              [
                new(S, new(S, menu('Escolha um criterio'))),
                button(cancelar, message(Dialog, destroy)),
                button(confirmar,
                       and(message(@prolog,
                                   menu_escolha,
                                   S?selection
                                   )))
              ]),
    send_list(S,
              append,

              [ 'Ano',
                'Duração',
                'Gênero',
                'Classificação',
                'Diretor',
                'Ator',
                'Arrecadação'
              ]),
    send(S, columns, 3),
    send(S, colour('#000000')),
    send(S, gap, size(15, 15)),
    send(Dialog, default_button, confirmar),
    send(Dialog, open_centered).


menu_escolha(Option) :-
    write(Option),
    (   Option = 'Ano'
    ,  menu_rec_ano
    ;   Option = 'Duração'
    ,  menu_rec_duracao
    ;   Option = 'Gênero'
    ,  menu_rec_ano
    ;   Option = 'Classificação'
    ,  menu_rec_ano
    ;   Option = 'Diretor'
    ,  menu_rec_ano
    ;   Option = 'Ator'
    ,  menu_rec_ator  
    ;   Option = 'Arrecadação'
    ,  menu_rec_ano
    ;   menu
    ).


