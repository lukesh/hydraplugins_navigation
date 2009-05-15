package com.hydraframework.plugins.navigation.interfaces {

	public interface ISitemapItem {
		function setUrl(value:String):void;
		function getUrl():String;
		function setTitle(value:String):void;
		function getTitle():String;
		function setData(value:Object):void;
		function getData():Object;
		function clone():ISitemapItem;
	}
}