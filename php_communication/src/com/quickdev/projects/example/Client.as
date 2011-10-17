package com.quickdev.projects.example 
{
	import com.quickdev.projects.example.view.iview.AbstractClient;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author emedinaa
	 */
	public class Client extends AbstractClient 
	{
		public var btnPhp:SimpleButton;
		public var _context:ClientContext;
		public var content:MovieClip;
		
		public function Client() 
		{
			super();
			
		}
		override public function app(e:Event = null):void 
		{
			super.app(e);
			_context = new ClientContext(this);
		}
	}

}