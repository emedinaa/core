package com.quickdev.projects.example.utils 
{
	import flash.display.SimpleButton;
	/**
	 * ...
	 * @author emedinaa
	 */
	public class Util 
	{
		
		public function Util() 
		{
			
		}
		public static function disableButton($btn:SimpleButton,$enabled:Boolean=false):void
		{
			if ($btn == null) return;
			$btn.enabled = $enabled;
		}
		
	}

}