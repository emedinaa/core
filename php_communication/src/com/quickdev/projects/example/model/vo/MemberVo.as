package com.quickdev.projects.example.model.vo 
{
	/**
	 * ...
	 * @author emedinaa
	 */
	public class MemberVo 
	{
		private var _name:String;
		private var _twitter:String;
		private var _web:String;
		
		public function MemberVo($name:String,$twitter:String,$web:String) 
		{
			_name = $name;
			_twitter = $twitter;
			_web = $web;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		public function get twitter():String 
		{
			return _twitter;
		}
		
		public function set twitter(value:String):void 
		{
			_twitter = value;
		}
		
		public function get web():String 
		{
			return _web;
		}
		
		public function set web(value:String):void 
		{
			_web = value;
		}
		
	}

}