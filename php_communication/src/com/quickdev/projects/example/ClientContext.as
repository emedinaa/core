package com.quickdev.projects.example 
{
	import com.quickdev.projects.example.control.delegate.DelegateURLLoader;
	import com.quickdev.projects.example.control.delegate.ResultEvent;
	import com.quickdev.projects.example.model.vo.MemberVo;
	import com.quickdev.projects.example.utils.Const;
	import com.quickdev.projects.example.utils.Util;
	import com.quickdev.projects.example.view.ItemMember;
	import com.quickdev.projects.example.view.iview.AbstractClient;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author emedinaa
	 */
	public class ClientContext 
	{
		private var _view:Client;
		private var _dl:DelegateURLLoader;
		private var _const:Const;
		private var _data:Array;
		
		public function ClientContext($view:AbstractClient) 
		{
			_view = $view as Client;
			initializeView();
		}
		
		private function initializeView():void 
		{
			_const = new Const();
			
			_view.btnPhp.addEventListener(MouseEvent.CLICK, CLICK_handler);
		}
		
		private function CLICK_handler(e:MouseEvent):void 
		{
			trace("click");
			Util.disableButton(_view.btnPhp,false);
			getInfo();
		}
		
		private function getInfo():void 
		{
			var _url:String = _const.getMembers();
			
			_dl = new DelegateURLLoader(_url, "", []);
			_dl.addEventListener( ResultEvent.COMPLETE, COMPLETE_handler);
			_dl.connect();
		}
		
		private function COMPLETE_handler(e:ResultEvent):void 
		{
			trace("data ", e.data);
			_data = e.data as Array;
			trace("data array ", _data.length);
			clearContent();
			for (var i:int = 0; i < _data.length; i++) 
			{
				var vo:MemberVo = new MemberVo(_data[i]['nombre'], _data[i]['twitter'], _data[i]['web']);
				var itm:ItemMember = new ItemMember();
				itm.x = 0;
				itm.y = 20*i;
				itm.data = vo;
				_view.content.addChild(itm);
				itm.open();
			}
				Util.disableButton(_view.btnPhp,true);
		}
		private function clearContent():void
		{
			while (_view.content.numChildren > 0)
			{
				if (_view.content.getChildAt(0) is ItemMember)
				{
					ItemMember(_view.content.getChildAt(0)).destroy();
				}
				_view.content.removeChildAt(0);
			}
		}
		
	}

}