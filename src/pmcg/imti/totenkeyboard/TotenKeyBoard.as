package pmcg.imti.totenkeyboard 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import pmcg.imti.totenkeyboard.events.ControlEvent;
	import pmcg.imti.totenkeyboard.events.KeyEvent;
	import pmcg.imti.totenkeyboard.keys.CharKey;
	import pmcg.imti.totenkeyboard.keys.IControlKey;
	import pmcg.imti.totenkeyboard.keys.IStateKey;
	import pmcg.imti.totenkeyboard.objects.KeyBoardAction;
	import pmcg.imti.totenkeyboard.objects.KeyBoardMode;
	
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class TotenKeyBoard extends MovieClip 
	{
		private static var _allowInstantiation:Boolean = false;
		private static var _instance:TotenKeyBoard = null;
		
		private var _charKeys:Vector.<CharKey> = new Vector.<CharKey>;
		private var _stateKeys:Vector.<IStateKey> = new Vector.<IStateKey>;
		private var _controlKeys:Vector.<IControlKey> = new Vector.<IControlKey>;
		private var _mode:String = KeyBoardMode.TEXTFIELD;
		private var _targetTextField:TextField;

		public function TotenKeyBoard() 
		{
			if (!_allowInstantiation)
			{
				throw new Error("Singleton, utilize getInstance()");
			}
			//TODO: Criar funções para apagar, espaço, outros, e usar estas funções em eventos e argumentos das ctrlkeys
		}
		/**
		 * Objeto TotenKeyBoard
		 * @return 
		 */
		public static function getInstance():TotenKeyBoard
		{
			if (_instance == null)
			{
				_allowInstantiation = true;
				_instance = new TotenKeyBoard();
				_allowInstantiation = false;
				_instance.addEventListener(Event.ADDED_TO_STAGE, initKeyBoard);
			}
			return _instance;
		}
		/**
		 * Adiciona uma tecla alfanumérica ao teclado
		 * @param	key
		 */
		public function addCharKey(key:CharKey):void
		{
			_instance.charKeys.push(key);
		}
		/**
		 * Adiciona uma teca de controle de estados (maiúsculas, minúculas, símbolos)
		 * @param	key
		 */
		public function addStateKey(key:IStateKey):void
		{
			_instance.stateKeys.push(key);
		}
		/**
		 * Adiciona uma tecla de controle (espaço, apagar, etc)
		 * @param	key
		 */
		public function addControlKey(key:IControlKey):void
		{
			_instance.controlKeys.push(key);
		}
		static private function initKeyBoard(event:Event):void 
		{
			_instance.removeEventListener(Event.ADDED_TO_STAGE, initKeyBoard);
			configureKeys();
			_instance.addEventListener(KeyEvent.KEY_PRESS, keyPressHandler);
			_instance.addEventListener(ControlEvent.CONTROL, controlEventHandler);
		}
		
		
		static private function configureKeys():void 
		{
			if (_instance.charKeys.length > 0)
			{
				for each(var charkey:CharKey in _instance.charKeys)
				{
					_instance.addChild(charkey);
				}
				
			}
			if (_instance.stateKeys.length > 0 )
			{
				for each(var statekey:* in _instance.stateKeys)
				{
					_instance.addChild(statekey);
				}
			}
			if (_instance.controlKeys.length > 0)
			{
				for each(var controlkey:* in _instance.controlKeys)
				{
					_instance.addChild(controlkey);
				}
			}
			
		}
		static private function controlEventHandler(event:ControlEvent):void 
		{
			
			switch(event.action)
			{
				case KeyBoardAction.BACKSPACE :
					switch(_instance.mode)
					{
						case KeyBoardMode.TEXTFIELD : 
							_instance.targetTextField.text = _instance.targetTextField.text.substring(0, _instance.targetTextField.text.length - 1);
							break;
						case KeyBoardMode.JAVASCRIPT : 
							
							break;
					}
					break;
				case KeyBoardAction.NEW_LINE : 
					switch(_instance.mode)
					{
						case KeyBoardMode.TEXTFIELD : 
							_instance.targetTextField.appendText("\n");
							break;
						case KeyBoardMode.JAVASCRIPT : 
							
							break;
					}
					break;
				case KeyBoardAction.SPACE : 
					switch(_instance.mode)
					{
						case KeyBoardMode.TEXTFIELD : 
							_instance.targetTextField.appendText(" ");
							break;
						case KeyBoardMode.JAVASCRIPT : 
							
							break;
					}
					break;
				case KeyBoardAction.CLEAR : 
					switch(_instance.mode)
					{
						case KeyBoardMode.TEXTFIELD : 
							_instance.targetTextField.text = "";
							break;
						case KeyBoardMode.JAVASCRIPT : 
							
							break;
					}
					break;
			}//end switch
		}
		
		static private function keyPressHandler(event:KeyEvent):void 
		{
			switch(_instance.mode)
			{
				case KeyBoardMode.TEXTFIELD : 
					_instance.targetTextField.appendText(event.keydata.currentValue);
					
					break;
			}
			_instance.parent.stage.focus = _instance.targetTextField;
			_instance.targetTextField.setSelection(_instance.targetTextField.text.length,_instance.targetTextField.text.length)
		}
		/**
		 * Conjunto de teclas alfanuméricas
		 */
		public function get charKeys():Vector.<CharKey> 
		{
			return _charKeys;
		}
		
		public function set charKeys(value:Vector.<CharKey>):void 
		{
			_charKeys = value;
		}
		/**
		 * Conjunto de teclas de estado
		 */
		public function get stateKeys():Vector.<IStateKey> 
		{
			return _stateKeys;
		}
		
		public function set stateKeys(value:Vector.<IStateKey>):void 
		{
			_stateKeys = value;
		}
		/**
		 * Conjunto de teclas de funções
		 */
		public function get controlKeys():Vector.<IControlKey> 
		{
			return _controlKeys;
		}

		public function set controlKeys(value:Vector.<IControlKey>):void 
		{
			_controlKeys = value;
		}
		/**
		 * Modo de operação, utilizar KeyBoardMode (textfield ou javascript)
		 */
		public function get mode():String 
		{
			return _mode;
		}
		/**
		 * TextField (dinâmico) para receber a interação do teclado 
		 * @see pmcg.imti.totenkeyboard.objects.KeyBoardMode
		 */
		public function set mode(value:String):void 
		{
			_mode = value;
		}
		
		public function get targetTextField():TextField 
		{
			return _targetTextField;
		}
		
		public function set targetTextField(value:TextField):void 
		{
			_targetTextField = value;
		}

		
	}

}