package pmcg.imti.totenkeyboard.keys 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import pmcg.imti.totenkeyboard.objects.FunctionKeyData;
	import pmcg.imti.totenkeyboard.TotenKeyBoard;
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class FunctionKey extends MovieClip implements IFunctionKey
	{
		private var _execute:Function = null;
		private var keyboard:TotenKeyBoard;
		
		public function FunctionKey(functionkeydata:FunctionKeyData = null) 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			this.buttonMode = true;
			this.mouseChildren = false;
			if (functionkeydata != null)
			{
				this.execute = functionkeydata.execute;
				this.x = functionkeydata.positionX;
				this.y = functionkeydata.positionY;
			}
		}
		
		private function init(event:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			keyboard = TotenKeyBoard.getInstance();
			this.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function clickHandler(event:MouseEvent):void 
		{
			if (this.execute != null)
			{
				this.execute();
			}
		}
		/**
		 * Função a ser executada pela tecla
		 */
		public function get execute():Function 
		{
			return _execute;
		}
		
		public function set execute(value:Function):void 
		{
			_execute = value;
		}
		
	}

}