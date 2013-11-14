package pmcg.imti.totenkeyboard.keys 
{
	import flash.events.MouseEvent;
	import pmcg.imti.totenkeyboard.events.StateChangeEvent;
	import pmcg.imti.totenkeyboard.objects.KeyBoardState;
	import pmcg.imti.totenkeyboard.objects.StateKeyData;
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class ShiftKey extends StateKey 
	{
		public function ShiftKey(statekeydata:StateKeyData = null)
		{
			if (statekeydata == null)
			{
				this.state = KeyBoardState.STATE_1;
			}
			else
			{
				this.state = statekeydata.state;
				this.x = statekeydata.positionX;
				this.y = statekeydata.positionY;
			}
		}
		public override function changeListenerHandler(event:StateChangeEvent):void 
		{
			switch(event.state)
			{
				case KeyBoardState.STATE_1 : 
					this.gotoAndStop(1);
					this.state = KeyBoardState.STATE_2;
					break;
				case KeyBoardState.STATE_2 : 
					this.gotoAndStop(2);
					this.state = KeyBoardState.STATE_1;
					break;
				case KeyBoardState.STATE_3 : 
					this.gotoAndStop(1);
					this.state = KeyBoardState.STATE_2;
			}
		}
		public override function changeDispatcherHandler(event:MouseEvent):void 
		{
			if (this.state != null)
			{
				this.keyboard.dispatchEvent(new StateChangeEvent(StateChangeEvent.CHANGE, this.state));
			}
			else
			{
				trace('Não foi acrescentado um valor padrão à tecla.');
			}
		}
	}

}