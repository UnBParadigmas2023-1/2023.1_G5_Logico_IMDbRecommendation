:- use_module(library(pce)).


append_text_dialog([], D).
append_text_dialog([A|B], D) :-
    send(D, append, text(A)),
    append_text_dialog(B, D).

mostrar_img(T, Img) :- 
      new(Figura, figure),
      new(Bitmap, bitmap(resource(Img),@on)),
      send(Bitmap, name, 1),
      send(Figura, display, Bitmap),
      send(Figura, status, 1),
      send(T, display,Figura,point(600,500)).