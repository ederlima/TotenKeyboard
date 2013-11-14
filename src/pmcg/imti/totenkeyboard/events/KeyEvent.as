package pmcg.imti.totenkeyboard.events 
{
	import flash.events.Event;
	import pmcg.imti.totenkeyboard.objects.KeyData;
	
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class KeyEvent extends Event 
	{
		public static const KEY_PRESS:String = "keyboardevent_key_press";
		
		private var _keydata:KeyData;
		
		public function KeyEvent(type:String, keydata:KeyData, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			this.keydata = keydata;
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new KeyEvent(type, this.keydata, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("KeyEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		/**
		 * Dados da tecla pressionada
		 */
		public function get keydata():KeyData 
		{
			return _keydata;
		}
		
		public function set keydata(value:KeyData):void 
		{
			_keydata = value;
		}
		
	}
	
}