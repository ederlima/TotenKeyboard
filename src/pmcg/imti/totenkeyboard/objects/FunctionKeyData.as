package pmcg.imti.totenkeyboard.objects 
{
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class FunctionKeyData 
	{
		private var _positionX:int = 0;
		private var _positionY:int = 0;
		private var _execute:Function = null;
		/**
		 * Dados para a tecla de função
		 * @param	execute Função para executar ao pressionar a tecla
		 * @param	positionX Posição X
		 * @param	positionY Posição Y
		 */
		public function FunctionKeyData(execute:Function = null, positionX:int = 0, positionY:int = 0) 
		{
			this.positionX = positionX;
			this.positionY = positionY;
			this.execute = execute;
		}
		/**
		 * Posição X da Tecla
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
		 * Posição Y da Tecla
		 */
		public function get positionY():int 
		{
			return _positionY;
		}
		
		public function set positionY(value:int):void 
		{
			_positionY = value;
		}
		/**
		 * Função da tecla
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