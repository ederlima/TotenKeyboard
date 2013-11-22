package pmcg.imti.totenkeyboard.keys 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import pmcg.imti.totenkeyboard.events.ControlEvent;
	import pmcg.imti.totenkeyboard.objects.ControlKeyData;
	import pmcg.imti.totenkeyboard.objects.KeyBoardAction;
	import flash.events.MouseEvent;
	import pmcg.imti.totenkeyboard.TotenKeyBoard;
	
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class ControlKey extends MovieClip implements IControlKey
	{
		private var _action:String;
		private var _keyboard:TotenKeyBoard;
		/**
		 * Cria uma nova tecla de controle
		 * @param	controlKeyData Dados de configuração da tecla
		 */
		public function ControlKey(controlKeyData:ControlKeyData = null) 
		{
			if (controlKeyData == null)
			{
				this.action = KeyBoardAction.SPACE;
			}
			else
			{
				this.action = controlKeyData.action;
				this.x = controlKeyData.positionX;
				this.y = controlKeyData.positionY;
			}
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.mouseChildren = false;
			_keyboard = TotenKeyBoard.getInstance();
			this.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function clickHandler(event:MouseEvent):void 
		{
			_keyboard.dispatchEvent(new ControlEvent(ControlEvent.CONTROL, this.action));
		}
		/**
		 * Ação da tecla 
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