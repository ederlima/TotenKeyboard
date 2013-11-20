package pmcg.imti.totenkeyboard.keys 
{
	import pmcg.imti.totenkeyboard.objects.FunctionKeyData;
	/**
	 * ...
	 * @author Eder Lima - IMTI
	 */
	public class CloseKey extends FunctionKey 
	{
		
		public function CloseKey(functionkeydata:FunctionKeyData = null) 
		{
			if (functionkeydata != null)
			{
				this.x = functionkeydata.positionX;
				this.y = functionkeydata.positionY;
				this.execute = functionkeydata.execute;
			}
		}
		
	}

}