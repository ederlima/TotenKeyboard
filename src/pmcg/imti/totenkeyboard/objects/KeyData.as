package pmcg.imti.totenkeyboard.objects 
{
	
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class KeyData 
	{
		private var _state1:String;
		private var _state2:String;
		private var _state3:String;
		private var _positionX:int;
		private var _positionY:int;
		private var _width:int;
		private var _height:int;
		private var _filters:Array;
		private var _bgcolor:uint;
		private var _textcolor:uint;
		private var _keyshape:String;
		private var _currentValue:String;
		private var _hasThirdState:Boolean = true;
		private var _font:String;
		
		/**
		 * Cria uma nova tecla de caracetere para o teclado
		 * @param	state1 Valor do primeiro estado (geralmente minúsculas)
		 * @param	state2 Valor do segundo estado (geralmente maiúsculas)
		 * @param	state3 Valor do terceiro estado (geralmente símbolos e números)
		 * @param	posX Posição X
		 * @param	posY Posição Y
		 * @param	width Largura
		 * @param	height Altura
		 * @param	keyShape Formato (KeyShape)
		 * @param	hasThirdState Informa se a tecla utiliza o terceiro estado
		 * @param	bgColor Cor de fundo
		 * @param	textColor Cor do texto
		 * @param	filters Filtros (não utilizado)
		 */
		public function KeyData(	
					state1:String = "", 
					state2:String = "", 
					state3:String = "", 
					posX:int = 0, 
					posY:int = 0, 
					width:int = 60, 
					height:int = 60, 
					keyShape:String = "square", 
					hasThirdState:Boolean = true, 
					font:String = "Arial",
					bgColor:uint = 0x2494FF, 
					textColor:uint = 0xFFFFFF, 
					filters:Array = null 
			) 
		{
			this.state1 = state1;
			this.state2 = state2;
			this.state3 = state3;
			this.positionX = posX;
			this.positionY = posY;
			this.width = width;
			this.height = height;
			this.filters = filters;
			this.bgcolor = bgColor;
			this.textcolor = textColor;
			this.keyshape = keyShape;
			this.font = font;
			this.hasThirdState = hasThirdState;
		}
		/**
		 * Primeiro estado (minúsculas) da tecla (ex: 'a')
		 */
		public function get state1():String 
		{
			return _state1;
		}
		
		public function set state1(value:String):void 
		{
			_state1 = value;
		}
		/**
		 * Segundo estado (maísculas) da tecla (ex: 'A')
		 */
		public function get state2():String 
		{
			return _state2;
		}
		
		public function set state2(value:String):void 
		{
			_state2 = value;
		}
		/**
		 * Terceiro estado (símbolos) da tecla (ex: '&amp;')
		 */
		public function get state3():String 
		{
			return _state3;
		}
		
		public function set state3(value:String):void 
		{
			_state3 = value;
		}
		/**
		 * Posição da tecla em X
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
		 * Posição da tecla em Y
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
		 * Largura da tecla
		 */
		public function get width():int 
		{
			return _width;
		}
		
		public function set width(value:int):void 
		{
			_width = value;
		}
		/**
		 * Altura da tecla
		 */
		public function get height():int 
		{
			return _height;
		}
		
		public function set height(value:int):void 
		{
			_height = value;
		}
		/**
		 * Filtros visuais para tecla (adicionados somente ao corpo)
		 */
		public function get filters():Array 
		{
			return _filters;
		}
		
		public function set filters(value:Array):void 
		{
			_filters = value;
		}
		/**
		 * Cor do plano de fundo
		 */
		public function get bgcolor():uint 
		{
			return _bgcolor;
		}
		
		public function set bgcolor(value:uint):void 
		{
			_bgcolor = value;
		}
		/**
		 * Cor da fonte de texto
		 */
		public function get textcolor():uint 
		{
			return _textcolor;
		}
		
		public function set textcolor(value:uint):void 
		{
			_textcolor = value;
		}
		/**
		 * KeyShape String ("square", "disc");
		 */
		public function get keyshape():String 
		{
			return _keyshape;
		}
		
		public function set keyshape(value:String):void 
		{
			_keyshape = value;
		}
		/**
		 * Valor da tecla
		 */
		public function get currentValue():String 
		{
			return _currentValue;
		}
		
		public function set currentValue(value:String):void 
		{
			_currentValue = value;
		}
		/**
		 * Informa se a tecla tem um terceiro estado (usado pra símbolos)
		 */
		public function get hasThirdState():Boolean 
		{
			return _hasThirdState;
		}
		
		public function set hasThirdState(value:Boolean):void 
		{
			_hasThirdState = value;
		}
		/**
		 * Fonte de texto (Lembre-se de incluir a fonte na biblioteca)
		 * Insira o nome exato do objeto/linkage, a fonte é instanciada através do método getDefinitionByName(linkage)
		 */
		public function get font():String 
		{
			return _font;
		}
		
		public function set font(value:String):void 
		{
			_font = value;
		}
		
	}

}