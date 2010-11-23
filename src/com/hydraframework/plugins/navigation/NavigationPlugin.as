/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the MIT License (http://www.opensource.org/licenses/mit-license.php)
 */
package com.hydraframework.plugins.navigation {

	import com.hydraframework.core.mvc.patterns.plugin.Plugin;
	import com.hydraframework.plugins.navigation.controller.*;
	import com.hydraframework.plugins.navigation.model.NavigationProxy;

	public class NavigationPlugin extends Plugin {

		public static var NAME:String        = "NavigationPlugin";
		public static var SET_SITEMAP:String = "plugins.navigation.setSitemap";
		public static var NAVIGATE:String    = "plugins.navigation.navigate";

		public function NavigationPlugin() {
			super(NAME);
		}

		override public function preinitialize():void {
			super.preinitialize();
			/*
			   Proxies
			 */
			this.facade.registerProxy(NavigationProxy.getInstance());
			/*
			   Commands
			 */
			this.facade.registerCommand(NavigationPlugin.NAVIGATE, NavigateCommand);
			this.facade.registerCommand(NavigationPlugin.SET_SITEMAP, SetSitemapCommand);
		}
	}
}