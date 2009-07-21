/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.hydraframework.plugins.navigation.model {
	import com.hydraframework.plugins.navigation.interfaces.ISitemapItem;

	public class AbstractSitemap {
		public function AbstractSitemap() {
		}

		public function getSitemap():Array {
			throw new Error("HydraFramework NavigationPlugin Error: Sitemap must extend AbstractSitemap, and override public function getSitemap() to return an Array of ISitemapItem.");
			return null;
		}

		public function getItemByUrl(url:String):ISitemapItem {
			var sitemap:Array = getSitemap();
			var filter:Function = function(element:*, index:int, arr:Array):Boolean {
				return element.url.toLowerCase() == url.toLowerCase();
			}
			var matches:Array = sitemap.filter(filter);
			var item:ISitemapItem;

			if (matches.length > 0) {
				item = matches[0] as ISitemapItem;
			}
			return item ? item : null;
		}
	}
}