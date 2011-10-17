package com.quickdev.projects.example.view.iview 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author emedinaa
	 */
	public interface IClient 
	{
		function set data($data:*):void;
		function get data():*;
		
		function app(e:Event=null):void;
		function events():void;
		function open():void;
		function destroy():void;
	}
	
}