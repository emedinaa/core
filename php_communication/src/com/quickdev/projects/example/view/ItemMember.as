package com.quickdev.projects.example.view 
{
	import com.quickdev.projects.example.model.vo.MemberVo;
	import com.quickdev.projects.example.view.iview.AbstractClient;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author emedinaa
	 */
	public class ItemMember extends AbstractClient 
	{
		public var txtNombre:TextField;
		public var txtTwitter:TextField;
		public var txtWeb:TextField;
		
		public function ItemMember() 
		{
			super();
			
		}
		override public function app(e:Event = null):void 
		{
			super.app(e);
		}
		override public function open():void 
		{
			super.open();
			txtNombre.text = (MemberVo)(data).name;
			txtTwitter.text = (MemberVo)(data).twitter;
			txtWeb.text = (MemberVo)(data).web;
		}
	}

}