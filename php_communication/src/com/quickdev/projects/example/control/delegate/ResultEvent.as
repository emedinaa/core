package com.quickdev.projects.example.control.delegate
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author  Eduardo José Medina Alfaro
	 * @web		www.emedinaa.com
	 * @email	emedinaa@gmail.com
	 * Flash/Flex/Air Developer
	 */
	public class ResultEvent extends Event 
	{
		public static const COMPLETE:String = "complete";
		
		public static var RESULT:int = 1;
		public static var FAULT:int = 0;
		public var vo:ResultVo;
		public var typeEvt:int;
		public var data:Object;
		public var info:Object;
		public var mc:*;
		public var mcTL:*;
		
		public function ResultEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new ResultEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ResultEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}