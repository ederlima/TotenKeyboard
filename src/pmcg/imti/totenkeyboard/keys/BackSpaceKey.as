package pmcg.imti.totenkeyboard.keys 
{
	import flash.events.Event;
	import pmcg.imti.totenkeyboard.objects.ControlKeyData;
	import pmcg.imti.totenkeyboard.objects.KeyBoardAction;
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class BackSpaceKey extends ControlKey 
	{
		
		public function BackSpaceKey(controlKeyData:ControlKeyData = null) 
		{
			if (controlKeyData == null)
			{
				this.action = KeyBoardAction.BACKSPACE;
			}
			if (controlKeyData != null)
			{
				this.action = controlKeyData.action;
				this.x = controlKeyData.positionX;
				this.y = controlKeyData.positionY;
			}
			
		}
		
	}

}