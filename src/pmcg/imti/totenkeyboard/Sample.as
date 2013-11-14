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
	import pmcg.imti.totenkeyboard.keys.CharKey;
	import pmcg.imti.totenkeyboard.keys.ShiftKey;
	import pmcg.imti.totenkeyboard.keys.SymbolsKey;
	import pmcg.imti.totenkeyboard.objects.KeyBoardState;
	import pmcg.imti.totenkeyboard.objects.KeyData;
	import pmcg.imti.totenkeyboard.objects.StateKeyData;
	import pmcg.imti.totenkeyboard.TotenKeyBoard;
	import pmcg.imti.totenkeyboard.objects.KeyShape;
	
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class Sample extends MovieClip 
	{
		private var kb:TotenKeyBoard;
		private var xmlloader:URLLoader = new URLLoader();
		
		private var shift:ShiftKey = new ShiftKey(new StateKeyData(KeyBoardState.STATE_2, 0, 140));
		private var symbols:SymbolsKey = new SymbolsKey(new StateKeyData(KeyBoardState.STATE_3, 0, 210));
		public function Sample() 
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			kb = TotenKeyBoard.getInstance();
			xmlloader.addEventListener(Event.COMPLETE, xmlcompletehandler);
			xmlloader.load(new URLRequest("keyboard.xml"));
			
			this.b1.addEventListener(MouseEvent.CLICK, clickHandlerButton);
			this.b2.addEventListener(MouseEvent.CLICK, clickHandlerButton);
			this.b3.addEventListener(MouseEvent.CLICK, clickHandlerButton);
		}
		private function xmlcompletehandler(event:Event):void
		{
			var keys:XML = XML(event.target.data);
			var keylist:XMLList = new XMLList(keys.charkeys.charkey);
			for each(var key:XML in keylist)
			{
				var charkey:CharKey= new CharKey(new KeyData(key.state1, key.state2, key.state3, key.@posx, key.@posy, 60, 60, KeyShape[key.@keyshape],stringToBoolean(key.@hasthirdstate) ));
				kb.charKeys.push(charkey);
			}
			kb.addStateKey(shift);
			kb.addStateKey(symbols);
			addChild(kb);
		}
		private function clickHandlerButton(event:MouseEvent):void 
		{
			switch(event.target.name)
			{
				case 'b1' : 
					kb.dispatchEvent(new StateChangeEvent(StateChangeEvent.CHANGE, KeyBoardState.STATE_1));
					break;
				case 'b2' : 
				kb.dispatchEvent(new StateChangeEvent(StateChangeEvent.CHANGE, KeyBoardState.STATE_2));
					break;
				case 'b3' : 
				kb.dispatchEvent(new StateChangeEvent(StateChangeEvent.CHANGE, KeyBoardState.STATE_3));
					break;
			}
		}
		
		
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
		
	}

}