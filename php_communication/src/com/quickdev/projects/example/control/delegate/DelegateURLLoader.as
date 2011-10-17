package com.quickdev.projects.example.control.delegate
{
	import com.adobe.serialization.json.JSON;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	/**
	 * ...
	 * @author @autor Eduardo José Medina Alfaro
	@web   www.emedinaa.com
	@email emedinaa@gmail.com
	Flash/Flex/Air Developer
	 */ 
	public class DelegateURLLoader extends EventDispatcher
	{
		public static const GET:String="get";
		public static const POST:String = "post";
		
		public static const LOGIN:String = "login";
		public static const REGISTRATION:String = "registration";
		public static const RECOMMEND:String = "recommend";
		public static const CODE:String = "code";
		public static const SAVE_SCORE:String = "save_score";
		
		public var url:String;
		public var methodAPI:String;
		public var methodHTTP:String;
		public var parameter:Array;
		public var nameLoad:String;
		private var DOM:String;
		public var data:Object;
		
		private var urlL:URLLoader;
		private var _contentType:String=null;
		private var _customData:*=null;
		
		//public function AdminDelegate(_DOM:String,_methodAPI:String,_methodHTTP:String,_nameLoad:String,_parameter:Array) 
		public function DelegateURLLoader(_DOM:String,_methodAPI:String,_parameter:Array,_methodHTTP:String="post") 
		{
			this.methodAPI = _methodAPI;
			this.methodHTTP = _methodHTTP;
			this.parameter = _parameter;
			//this.nameLoad = _nameLoad;
			DOM = _DOM;
			//connect();
		}
		
		public function setContentType($type:String):void
		{
			_contentType = $type;
		}
		public function setCustomData($data:*):void
		{
			_customData = $data;
		}
		//request.contentType = 'application/octet-stream';
		
		public function connect():void
		{
			var urlR:URLRequest = new URLRequest();
			//urlR.url = Config.DOM + methodAPI;
			urlR.url = DOM + methodAPI;
			if (_contentType) { urlR.contentType = _contentType };
			if (_customData) { urlR.data = _customData };
			//trace("Delegate url --------------s>> ",urlR.url);
			
			if (methodHTTP =='get')
			{
				urlR.method = URLRequestMethod.GET;
			}else
			{
				urlR.method = URLRequestMethod.POST;
			}

			var urlV:URLVariables = new URLVariables();

			if (parameter)
			{
				for (var i:int = 0; i <parameter.length ; i++) 
				{
					urlV[parameter[i].name] = parameter[i].valor;
					//trace("delegate >>>>>>>>>",parameter[i].name,parameter[i].valor);
				}
				urlR.data = urlV;
			}
			
			urlL = new URLLoader();		
			urlL.addEventListener(Event.COMPLETE, COMPLETE_Handler);
			urlL.addEventListener(IOErrorEvent.IO_ERROR, IO_Error_handler);
			urlL.addEventListener(HTTPStatusEvent.HTTP_STATUS, HTTP_STATUS_handler);
			urlL.load(urlR);
		}
		
		private function HTTP_STATUS_handler(e:HTTPStatusEvent):void 
		{
			 trace("httpStatusHandler: " + e);
            trace("status: " + e.status);
		}
	//	COMPLETE_APIFile_handler
		private function COMPLETE_Handler(e:Event):void 
		{
			urlL.removeEventListener(HTTPStatusEvent.HTTP_STATUS, HTTP_STATUS_handler);
			urlL.removeEventListener(Event.COMPLETE, COMPLETE_Handler);
			urlL.removeEventListener(IOErrorEvent.IO_ERROR, IO_Error_handler);
			
			var evt:ResultEvent = new ResultEvent(ResultEvent.COMPLETE);
			evt.typeEvt = ResultEvent.RESULT;	
			evt.info = this.data;
			
			trace("data sin json --------------",urlL.data);
			evt.data = JSON.decode(urlL.data);
			this.dispatchEvent(evt);
			urlL = null;
		}
		
		private function IO_Error_handler(e:IOErrorEvent):void 
		{
			//error 
			trace("AdminDelegate error ",e.toString());
			urlL.removeEventListener(IOErrorEvent.IO_ERROR, IO_Error_handler);
			var evt:ResultEvent = new ResultEvent(ResultEvent.COMPLETE);
			evt.typeEvt = ResultEvent.FAULT;
			this.dispatchEvent(evt);
		}
		/**
		 * Detiene cualquier tipo de descarga en proceso
		 */
		public function stop():void
		{
			if(urlL){urlL.close()};
			urlL = null;
		}
		
	}

}