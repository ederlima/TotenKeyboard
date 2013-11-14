package pmcg.imti.totenkeyboard.keys 
{
	import flash.events.Event;
	import pmcg.imti.totenkeyboard.objects.ControlKeyData;
	import pmcg.imti.totenkeyboard.objects.KeyBoardAction;
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class SpaceKey extends ControlKey 
	{
		
		public function SpaceKey(controlKeyData:ControlKeyData = null) 
		{
			if (controlKeyData == null)
			{
				this.action = KeyBoardAction.SPACE;
			}
			if (controlKeyData != null)
			{
				this.action = controlKeyData.action;
				this.x = controlKeyData.positionX;
				this.y = controlKeyData.positionY;
			}
			
		}
		
		private function init(event:Event):void 
		{

		}
		
	}

}