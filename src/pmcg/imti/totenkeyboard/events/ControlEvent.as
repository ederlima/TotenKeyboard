package pmcg.imti.totenkeyboard.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class ControlEvent extends Event 
	{
		/**
		 * Evento disparado pelas teclas de controle
		 */
		public static const CONTROL:String = "controlevent_control";
		private var _action:String;
		
		public function ControlEvent(type:String, action:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			this.action = action;
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new ControlEvent(type, this.action, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ControlEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		/**
		 * Ação do controle (KeyBoardAction)
		 */
		public function get action():String 
		{
			return _action;
		}
		
		public function set action(value:String):void 
		{
			_action = value;
		}
		
	}
	
}