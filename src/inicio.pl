:- use_module(library(pce)).
:- [src/menu].
:- [src/util].
:- pce_image_directory('../img').

resource(imagem_principal, image, image('principal.jpg')).

principal :-
   new(Dialog, dialog('Bem vindo')),
   send(Dialog, size, size(1030, 840)),
   mostrar_img(Dialog,imagem_principal),
   send(Dialog, background, '#ffffdf'),
   new(BotaoSair,button('Sair',and(message(Dialog,destroy),message(Dialog,free)))),
   new(BotaoIniciar,button('Iniciar',and(message(@prolog,menu) ,
   and(message(Dialog,destroy),message(Dialog,free)) ))),
   send(Dialog,append(BotaoIniciar)),
   send(Dialog,append(BotaoSair)),
   send(Dialog,open_centered).

