/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the MIT License (http://www.opensource.org/licenses/mit-license.php)
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