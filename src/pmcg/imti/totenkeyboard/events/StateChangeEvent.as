package pmcg.imti.totenkeyboard.events 
{
	import flash.events.Event;
	import pmcg.imti.totenkeyboard.objects.KeyBoardState;
	
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class StateChangeEvent extends Event 
	{
		/**
		 * Evento disparado ao trocar o State do teclado
		 */
		public static const CHANGE:String = "statechangeevent_change";
		private var _state:String;
		public function StateChangeEvent(type:String, state:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			this.state = state;
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new StateChangeEvent(type, this.state, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("StateChangeEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		/**
		 * Novo estado do teclado
		 */
		public function get state():String 
		{
			return _state;
		}
		
		public function set state(value:String):void 
		{
			_state = value;
		}
		
	}
	
}