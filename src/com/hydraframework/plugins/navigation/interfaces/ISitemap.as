package com.hydraframework.plugins.navigation.interfaces {

	public interface ISitemap {
		function getSitemap():Array;
		function getItemByUrl(url:String):ISitemapItem;
	}
}