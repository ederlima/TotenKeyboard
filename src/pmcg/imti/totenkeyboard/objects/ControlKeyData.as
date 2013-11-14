package pmcg.imti.totenkeyboard.objects 
{
	
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class ControlKeyData 
	{
		private var _action:String;
		private var _positionX:int;
		private var _positionY:int;
		/**
		 * Cria um novo objeto ControlKeyData que define as propriedades da tecla de controle
		 * @param	action Ação da tecla (KeyBoardAction)
		 * @param	positionX Posição X
		 * @param	positionY Posição Y
		 */
		public function ControlKeyData(action:String, positionX:int, positionY:int) 
		{
			this.action = action;
			this.positionX = positionX;
			this.positionY = positionY;
		}
		/**
		 * Ação para a tecla de controle (KeyBoardAction)
		 */
		public function get action():String 
		{
			return _action;
		}
		
		public function set action(value:String):void 
		{
			_action = value;
		}
		/**
		 * Posição X
		 */
		public function get positionX():int 
		{
			return _positionX;
		}
		
		public function set positionX(value:int):void 
		{
			_positionX = value;
		}
		/**
		 * Posição Y
		 */
		public function get positionY():int 
		{
			return _positionY;
		}
		
		public function set positionY(value:int):void 
		{
			_positionY = value;
		}
		
	}

}