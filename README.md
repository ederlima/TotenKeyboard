TotenKeyboard
=============

AS3 KeyBoard for Flash TextField and Html TextField 


Pacote de Classes para criação de teclado virtual para dispositivos touch.

Capacidade de trabalhar com textfield dentro do próprio arquivo ou integração com javascript.

Exemplos em javascript ainda em construção.

Modo de usar: //how to use

import pmcg.imti.totenkeyboard.*;
import pmcg.imti.totenkeyboard.keys.*;
import pmcg.imti.totenkeyboard.objects.*;

var keyboard:TotenKeyBoard = new TotenKeyBoard();
var a_key:CharKey = new CharKey(new CharKeyData("a", "A", "$"));
keyboard.addKey(a_key); //or 
//keyboard.charKeys.push(a_key);
keyboard.stageObject = this.stage; //or mainStage from yout app/movie - option for focus 
keyboard.targetTextField = yourtextfieldInstance;
addChild(keyboard);
