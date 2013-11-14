package pmcg.imti.totenkeyboard.keys 
{
	import flash.events.Event;
	import pmcg.imti.totenkeyboard.objects.ControlKeyData;
	import pmcg.imti.totenkeyboard.objects.KeyBoardAction;
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class NewLineKey extends ControlKey 
	{
		
		public function NewLineKey(controlKeyData:ControlKeyData = null) 
		{
			if (controlKeyData == null)
			{
				this.action = KeyBoardAction.NEW_LINE;
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