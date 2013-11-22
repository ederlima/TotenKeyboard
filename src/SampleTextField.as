package  
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import pmcg.imti.totenkeyboard.events.StateChangeEvent;
	import pmcg.imti.totenkeyboard.keys.BackSpaceKey;
	import pmcg.imti.totenkeyboard.keys.CharKey;
	import pmcg.imti.totenkeyboard.keys.ClearAllKey;
	import pmcg.imti.totenkeyboard.keys.CloseKey;
	import pmcg.imti.totenkeyboard.keys.FunctionKey;
	import pmcg.imti.totenkeyboard.keys.NewLineKey;
	import pmcg.imti.totenkeyboard.keys.ShiftKey;
	import pmcg.imti.totenkeyboard.keys.SpaceKey;
	import pmcg.imti.totenkeyboard.keys.SymbolsKey;
	import pmcg.imti.totenkeyboard.objects.ControlKeyData;
	import pmcg.imti.totenkeyboard.objects.FunctionKeyData;
	import pmcg.imti.totenkeyboard.objects.KeyBoardState;
	import pmcg.imti.totenkeyboard.objects.KeyData;
	import pmcg.imti.totenkeyboard.objects.StateKeyData;
	import pmcg.imti.totenkeyboard.TotenKeyBoard;
	import pmcg.imti.totenkeyboard.objects.KeyShape;
	import pmcg.imti.totenkeyboard.objects.KeyBoardAction;
	import pmcg.imti.totenkeyboard.objects.KeyBoardMode;
	
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class SampleTextField extends MovieClip 
	{
		private var keyboard:TotenKeyBoard;
		private var xmlloader:URLLoader = new URLLoader();
		private var keyboardinstance:TotenKeyBoard;
		private var _mainStage:Stage;

		public function SampleTextField() 
		{
			//stage.align = StageAlign.TOP_LEFT;
			//stage.scaleMode = StageScaleMode.NO_SCALE;
			keyboard = TotenKeyBoard.getInstance();
			keyboardinstance = TotenKeyBoard.getInstance();
			//define que o teclado vai utilizar um textfield
			keyboard.mode = KeyBoardMode.TEXTFIELD;
			//identifica o textfield
			keyboard.targetTextField = this.textarea;
			//informa o stage (pra trabalhar com o foco sobre o textfield)
			keyboard.stageObject = this.stage;
			xmlloader.addEventListener(Event.COMPLETE, xmlcompletehandler);
			xmlloader.load(new URLRequest("keyboard.xml"));
			
			this.kbholder.dragpoint.addEventListener(MouseEvent.MOUSE_DOWN, initDrag);
			this.kbholder.dragpoint.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			this.kbholder.dragpoint.addEventListener(MouseEvent.ROLL_OUT, endDrag);
			this.kbholder.dragpoint.addEventListener(MouseEvent.ROLL_OVER, endDrag);
		}
		
		private function endDrag(event:MouseEvent):void 
		{
			this.stopDrag();
		}
		
		private function initDrag(event:MouseEvent):void 
		{
			if (mainStage == null)
			{
				mainStage = this.stage;
			}
			this.startDrag(false, new Rectangle(mainStage.x, mainStage.y, mainStage.stageWidth - this.kbholder.width, mainStage.stageHeight - this.kbholder.height));
		}
		
		private function xmlcompletehandler(event:Event):void
		{
			var keys:XML = XML(event.target.data);
			var keylist:XMLList = new XMLList(keys.charkeys.charkey);
			for each(var key:XML in keylist)
			{
				var charkey:CharKey= new CharKey(new KeyData(key.state1, key.state2, key.state3, key.@posx, key.@posy, 50, 50, KeyShape[key.@keyshape],stringToBoolean(key.@hasthirdstate) ));
				keyboard.charKeys.push(charkey);
			}
			var shift:ShiftKey = new ShiftKey(new StateKeyData(KeyBoardState.STATE_2, 0, 120));
			var symbols:SymbolsKey = new SymbolsKey(new StateKeyData(KeyBoardState.STATE_3, 0, 180));
			var space:SpaceKey = new SpaceKey(new ControlKeyData(KeyBoardAction.SPACE, 190, 180));
			var clearall:ClearAllKey = new ClearAllKey(new ControlKeyData(KeyBoardAction.CLEAR, 0, 60)); 
			var backspace:BackSpaceKey = new BackSpaceKey(new ControlKeyData(KeyBoardAction.BACKSPACE, 660, 0)); 
			var newline:NewLineKey = new NewLineKey(new ControlKeyData(KeyBoardAction.NEW_LINE, 670, 60));
			var closebutton:CloseKey = new CloseKey(new FunctionKeyData(function() { trace('close button') }, 670, 180));
			closebutton.name = "closebutton";
			keyboard.addFunctionKey(closebutton);
			keyboard.addStateKey(shift);
			keyboard.addStateKey(symbols);
			keyboard.addControlKey(space);
			keyboard.addControlKey(clearall);
			keyboard.addControlKey(backspace);
			keyboard.addControlKey(newline);
			//
			
			//
			keyboard.stageObject = this.stage;
			keyboard.x = 10;
			keyboard.y = 40;
			kbholder.addChild(keyboard);
		}
		//helpers
		private function stringToBoolean(value:String):Boolean
		{
			var returnValue:Boolean = false;
			if (value == "1" || value == "true")
			{
				returnValue = true;
			}
			else
			{
				returnValue = false;
			}
			
			return returnValue;
		}
		public function get keyboardInstance():TotenKeyBoard
		{
			return keyboardinstance;
		}
		/**
		 * Stage principal
		 */
		public function get mainStage():Stage 
		{
			return _mainStage;
		}
		
		public function set mainStage(value:Stage):void 
		{
			_mainStage = value;
		}
		
	}

}