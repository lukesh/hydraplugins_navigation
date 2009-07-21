/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.hydraframework.plugins.navigation.interfaces {

	public interface ISitemap {
		function getSitemap():Array;
		function getItemByUrl(url:String):ISitemapItem;
	}
}