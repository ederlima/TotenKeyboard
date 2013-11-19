package pmcg.imti.totenkeyboard 
{
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import pmcg.imti.totenkeyboard.events.StateChangeEvent;
	import pmcg.imti.totenkeyboard.keys.BackSpaceKey;
	import pmcg.imti.totenkeyboard.keys.CharKey;
	import pmcg.imti.totenkeyboard.keys.ClearAllKey;
	import pmcg.imti.totenkeyboard.keys.NewLineKey;
	import pmcg.imti.totenkeyboard.keys.ShiftKey;
	import pmcg.imti.totenkeyboard.keys.SpaceKey;
	import pmcg.imti.totenkeyboard.keys.SymbolsKey;
	import pmcg.imti.totenkeyboard.objects.ControlKeyData;
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
	public class Sample extends MovieClip 
	{
		private var keyboard:TotenKeyBoard;
		private var xmlloader:URLLoader = new URLLoader();
		private var keyboardinstance:TotenKeyBoard;

		public function Sample() 
		{
			//stage.align = StageAlign.TOP_LEFT;
			//stage.scaleMode = StageScaleMode.NO_SCALE;
			keyboard = TotenKeyBoard.getInstance();
			keyboardinstance = TotenKeyBoard.getInstance();
			keyboard.mode = KeyBoardMode.JAVASCRIPT;
			xmlloader.addEventListener(Event.COMPLETE, xmlcompletehandler);
			xmlloader.load(new URLRequest("keyboard.xml"));
		}
		
		private function xmlcompletehandler(event:Event):void
		{
			var keys:XML = XML(event.target.data);
			var keylist:XMLList = new XMLList(keys.charkeys.charkey);
			for each(var key:XML in keylist)
			{
				var charkey:CharKey= new CharKey(new KeyData(key.state1, key.state2, key.state3, key.@posx, key.@posy, 60, 60, KeyShape[key.@keyshape],stringToBoolean(key.@hasthirdstate) ));
				keyboard.charKeys.push(charkey);
			}
			var shift:ShiftKey = new ShiftKey(new StateKeyData(KeyBoardState.STATE_2, 0, 140));
			var symbols:SymbolsKey = new SymbolsKey(new StateKeyData(KeyBoardState.STATE_3, 0, 210));
			var space:SpaceKey = new SpaceKey(new ControlKeyData(KeyBoardAction.SPACE, 200, 210));
			var clearall:ClearAllKey = new ClearAllKey(new ControlKeyData(KeyBoardAction.CLEAR, 0, 70)); 
			var backspace:BackSpaceKey = new BackSpaceKey(new ControlKeyData(KeyBoardAction.BACKSPACE, 770, 0)); 760, 70
			var newline:NewLineKey = new NewLineKey(new ControlKeyData(KeyBoardAction.NEW_LINE, 760, 70));
			keyboard.addStateKey(shift);
			keyboard.addStateKey(symbols);
			keyboard.addControlKey(space);
			keyboard.addControlKey(clearall);
			keyboard.addControlKey(backspace);
			keyboard.addControlKey(newline);
			//
			
			//
			keyboard.stageObject = this.stage;
			addChild(keyboard);
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
		
	}

}