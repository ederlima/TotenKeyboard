package pmcg.imti.totenkeyboard.keys 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import pmcg.imti.totenkeyboard.TotenKeyBoard;
	import pmcg.imti.totenkeyboard.objects.KeyBoardState;
	import pmcg.imti.totenkeyboard.events.StateChangeEvent;
	import pmcg.imti.totenkeyboard.objects.KeyBoardState;
	import pmcg.imti.totenkeyboard.objects.StateKeyData
	
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class StateKey extends MovieClip implements IStateKey
	{
		private var _keyboard:TotenKeyBoard;
		private var _state:String;
		/**
		 * 
		 * @param	state String KeyState (Informe um dos estados (1,2,3))
		 */
		public function StateKey(keydata:StateKeyData = null) 
		{
			if (keydata == null)
			{
				this.state = KeyBoardState.STATE_1;
			}
			else
			{
				this.state = keydata.state;
				this.x = keydata.positionX;
				this.y = keydata.positionY;
			}
			this.addEventListener(Event.ADDED_TO_STAGE, initKey);
		}
		
		private function initKey(event:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, initKey);
			this.gotoAndStop(1);
			if (this.state == null)
			{
				this.state = KeyBoardState.STATE_1;
			}
			_keyboard = TotenKeyBoard.getInstance();
			_keyboard.addEventListener(StateChangeEvent.CHANGE, changeListenerHandler);
			this.mouseChildren = false;
			this.addEventListener(MouseEvent.CLICK, changeDispatcherHandler);
		}
		/**
		 * Responde ao clique sobre a tecla
		 * @param	event
		 */
		public function changeDispatcherHandler(event:MouseEvent):void 
		{
			if (this.state != null)
			{
				_keyboard.dispatchEvent(new StateChangeEvent(StateChangeEvent.CHANGE, this.state));
			}
			else
			{
				trace('Não foi acrescentado um valor padrão à tecla.');
			}
		}
		/**
		 * Responde ao evento disparado pelo teclado e ao estado atual
		 * @param	event
		 */
		public function changeListenerHandler(event:StateChangeEvent):void 
		{
			switch(event.state)
			{
				case KeyBoardState.STATE_1 : 
					this.gotoAndStop(1);
					break;
				case KeyBoardState.STATE_2 : 
					this.gotoAndStop(2);
					break;
				case KeyBoardState.STATE_3 : 
					this.gotoAndStop(3);
					break;
			}
		}
		/**
		 * Estado do teclado
		 */
		public function get state():String 
		{
			return _state;
		}
		
		public function set state(value:String):void 
		{
			_state = value;
		}
		/**
		 * Instância do teclado
		 */
		public function get keyboard():TotenKeyBoard 
		{
			return _keyboard;
		}
		/**
		 * Instância do teclado
		 */
		public function set keyboard(value:TotenKeyBoard):void 
		{
			_keyboard = value;
		}
		
	}

}