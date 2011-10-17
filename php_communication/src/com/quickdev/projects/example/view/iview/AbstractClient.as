package com.quickdev.projects.example.view.iview 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author emedinaa
	 */
	public class AbstractClient extends Sprite implements IClient
	{
		protected var _data:*;
		
		public function AbstractClient() 
		{
			super();
			if (stage) { app(); } else { this.addEventListener(Event.ADDED_TO_STAGE, app); }
		}
		
		/* INTERFACE com.quickdev.projects.example.view.iview.IClient */
		
		public function app(e:Event = null):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, app)
			trace("app");
		}
		
		/* INTERFACE com.quickdev.projects.example.view.iview.IClient */
		
		public function set data(value:*):void 
		{
			_data = value;
		}
		
		public function get data():* 
		{
			return _data;
		}

		
		public function events():void 
		{
			
		}
		
		public function destroy():void 
		{
			
		}
		
		/* INTERFACE com.quickdev.projects.example.view.iview.IClient */
		
		public function open():void 
		{
			
		}
		

		
		
	}

}