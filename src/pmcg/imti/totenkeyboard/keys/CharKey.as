package pmcg.imti.totenkeyboard.keys 
{
	import fl.text.TLFTextField;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.formats.TextAlign;
	import flashx.textLayout.formats.TextLayoutFormat;
	import flashx.textLayout.formats.VerticalAlign;
	import pmcg.imti.totenkeyboard.events.KeyEvent;
	import pmcg.imti.totenkeyboard.events.StateChangeEvent;
	import pmcg.imti.totenkeyboard.objects.KeyBoardState;
	import pmcg.imti.totenkeyboard.objects.KeyData;
	import pmcg.imti.totenkeyboard.objects.KeyShape;
	import pmcg.imti.totenkeyboard.TotenKeyBoard;
	import flash.utils.getDefinitionByName;
	

	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class CharKey extends MovieClip 
	{
		//private var front:*;// = new TLFTextField();
		private var front:TLFTextField = new TLFTextField();
		//private var back:*//TLFTextField = new TLFTextField();
		private var back:TLFTextField = new TLFTextField();
		
		private var defaultFormat:TextLayoutFormat = new TextLayoutFormat();
		private var defaultFlow:TextFlow;
		
		//private var myfont:Font = new Segoe();
		private var myfont:Font;
		private var MyFontClass:Class;
		
		private var body:Sprite = new Sprite();
		private var _keydata:KeyData;
		
		private var _currentValue:String = "";
		
		private var _keyboard:TotenKeyBoard = TotenKeyBoard.getInstance();
		
		public function CharKey(keyData:KeyData) 
		{
			this.keydata = keyData;
			_currentValue = keyData.state1;
			keydata.currentValue = keyData.state1;
			body.graphics.beginFill(keyData.bgcolor, 1);
			
			MyFontClass = getDefinitionByName(keydata.font) as Class;
			myfont = new MyFontClass();
						
			switch(keydata.keyshape)
			{
				case KeyShape.SQUARE : 
					body.graphics.drawRect(0, 0, keyData.width, keyData.height);
					break;
				case KeyShape.SQUARE_ROUNDED : 
					body.graphics.drawRoundRect(0, 0, keyData.width, keyData.height, 9, 9);
					break;
				case KeyShape.DISC : 
					body.graphics.drawCircle(keyData.width/2, keyData.height/2, keyData.width/2);
					break;
				default :
					body.graphics.drawRect(0, 0, keyData.width, keyData.height);
			}
			body.graphics.endFill();
			this.addChild(body);
			
			
			
			defaultFormat.textIndent = 0;
			defaultFormat.color = 0xFFFFFF;
			defaultFormat.fontFamily = myfont.fontName;
			defaultFormat.verticalAlign = VerticalAlign.MIDDLE;
			defaultFormat.textAlign = TextAlign.CENTER;
			
			createFront(keyData);
			createBack(keyData);
			
			this.x = keydata.positionX;
			this.y = keydata.positionY;
			this.addEventListener(MouseEvent.CLICK, keyClickHandler);
			_keyboard.addEventListener(StateChangeEvent.CHANGE, StateChangeEventHandler);
			
		}
		
		private function StateChangeEventHandler(event:StateChangeEvent):void 
		{
			switch(event.state)
			{
				case KeyBoardState.STATE_1 :
					if (keydata.hasThirdState)
					{
						front.text = keydata.state1;
						back.text = keydata.state3;
					}
					else
					{
						front.text = keydata.state1;
						back.text = keydata.state2;
					}
					this.keydata.currentValue = keydata[event.state];
					break;
				case KeyBoardState.STATE_2 :
					if (keydata.hasThirdState)
					{
						front.text = keydata.state2;
						back.text = keydata.state3;
					}
					else
					{
						front.text = keydata.state2;
						back.text = keydata.state1;
					}
					this.keydata.currentValue = keydata[event.state];
					break;
				case KeyBoardState.STATE_3 :
					if (keydata.hasThirdState)
					{
						front.text = keydata.state3;
						back.text = keydata.state1;
					}
					else
					{
						front.text = keydata.state1;
						back.text = keydata.state2;
					}
					if (this.keydata.hasThirdState)
					{
						this.keydata.currentValue = keydata[event.state];
					}
					else
					{
						this.keydata.currentValue = keydata[KeyBoardState.STATE_1];
					}
					break;
			}
			
			
		}
		
		private function keyClickHandler(event:MouseEvent):void 
		{
			_keyboard.dispatchEvent(new KeyEvent(KeyEvent.KEY_PRESS, this.keydata)); 
		}
		
		private function createFront(keyData:KeyData):void
		{
			
			front.antiAliasType = AntiAliasType.ADVANCED;
			front.embedFonts = true;
			body.addChild(front); 
			front.width = keyData.width;
			front.height = keyData.height;
			front.selectable = false;
			
			defaultFormat.fontWeight = "normal";
			defaultFormat.fontSize = Math.ceil(keydata.height / 2);

			defaultFlow = front.textFlow;
			defaultFlow.hostFormat = defaultFormat;
			front.text = keyData.state1;
		}
		private function createBack(keyData:KeyData):void
		{
			back.embedFonts = true;
			back.antiAliasType = AntiAliasType.ADVANCED;
			body.addChild(back); 
			back.width = Math.ceil(keydata.width*0.40);
			back.height = Math.ceil(keydata.height*0.40);
			switch(keyData.keyshape)
			{
				case KeyShape.SQUARE : 
					back.x = keyData.width - Math.ceil(keydata.width*0.40);
					break;
				case KeyShape.DISC : 
					back.x = keyData.width - Math.ceil(keydata.width*0.50);
					back.y = 5;
					break;
				default : 
					back.x = keyData.width - Math.ceil(keydata.width*0.40);
			}
			back.selectable = false;
			
			defaultFormat.fontSize = Math.ceil(keydata.height*0.32);
			defaultFormat.fontWeight = "normal";

			defaultFlow = back.textFlow;
			defaultFlow.hostFormat = defaultFormat;
			keydata.hasThirdState ? back.text = keydata.state3 : back.text = keydata.state2;
		}
		
		/**
		 * KeyData dados da tecla
		 */
		public function get keydata():KeyData 
		{
			return _keydata;
		}
		
		public function set keydata(value:KeyData):void 
		{
			_keydata = value;
		}
		/**
		 * Valor da tecla
		 */
		public function get currentValue():String 
		{
			return _currentValue;
		}
	}

}