/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
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