package com.quickdev.projects.example.control.delegate 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author @autor Eduardo José Medina Alfaro
	@web   www.emedinaa.com
	@email emedinaa@gmail.com
	Flash/Flex/Air Developer
	 */
	public class ProgressLEvent extends Event 
	{
		public static const LOADED:String = "loaded";
		private var __bytesLoaded:Number;
		
		public function ProgressLEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new ProgressLEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ProgressLoaderEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
		public function get bytesLoaded():Number { return __bytesLoaded; }
		
		public function set bytesLoaded(value:Number):void 
		{
			__bytesLoaded = value;
		}
		
	}
	
}