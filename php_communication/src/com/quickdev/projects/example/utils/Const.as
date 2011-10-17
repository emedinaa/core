package com.quickdev.projects.example.utils 
{
	/**
	 * ...
	 * @author emedinaa
	 */
	public class Const 
	{
		private const DOM:String = "http://localhost/";
		
		public function Const() 
		{
			
		}
		public  function getDOM():String
		{
			return DOM;
		}
		public function getMembers():String
		{
			return DOM + "example/members.php";
		}
	}

}