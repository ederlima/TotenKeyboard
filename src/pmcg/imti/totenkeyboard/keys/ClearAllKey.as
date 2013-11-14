package pmcg.imti.totenkeyboard.keys 
{
	import flash.events.Event;
	import pmcg.imti.totenkeyboard.objects.ControlKeyData;
	import pmcg.imti.totenkeyboard.objects.KeyBoardAction;
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class ClearAllKey extends ControlKey 
	{
		
		public function ClearAllKey(controlKeyData:ControlKeyData = null) 
		{
			if (controlKeyData == null)
			{
				this.action = KeyBoardAction.CLEAR;
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