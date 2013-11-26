package pmcg.imti.totenkeyboard.objects 
{
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class StateKeyData 
	{
		private var _state:String;
		private var _posX:int;
		private var _posY:int;
		
		public function StateKeyData(state:String, posx:int = 0, posy:int = 0)
		{
			this.state = state;
			this.positionX = posx;
			this.positionY = posy;
		}
		
		public function get state():String 
		{
			return _state;
		}
		
		public function set state(value:String):void 
		{
			_state = value;
		}
		
		public function get positionX():int 
		{
			return _posX;
		}
		
		public function set positionX(value:int):void 
		{
			_posX = value;
		}
		
		public function get positionY():int 
		{
			return _posY;
		}
		
		public function set positionY(value:int):void 
		{
			_posY = value;
		}
	}

}