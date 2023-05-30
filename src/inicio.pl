:- use_module(library(pce)).
:- [src/menu].
:- pce_image_directory('../img').

resource(imagem_principal, image, image('principal.jpg')).

principal :-
   new(Dialog, dialog('Bem vindo')),
   send(Dialog, size, size(1030, 700)),
   mostrar_img(Dialog,imagem_principal),
   send(Dialog, background, '#c8c8c8'),
   new(BotaoSair,button('Sair',and(message(Dialog,destroy),message(Dialog,free)))),
   new(BotaoIniciar,button('Iniciar',and(message(@prolog,menu) ,
   and(message(Dialog,destroy),message(Dialog,free)) ))),
   send(Dialog,append(BotaoIniciar)),
   send(Dialog,append(BotaoSair)),
   send(Dialog,open_centered).


mostrar_img(T, Img) :- 
      new(Figura, figure),
      new(Bitmap, bitmap(resource(Img),@on)),
      send(Bitmap, name, 1),
      send(Figura, display, Bitmap),
      send(Figura, status, 1),
      send(T, display,Figura,point(600,500)).