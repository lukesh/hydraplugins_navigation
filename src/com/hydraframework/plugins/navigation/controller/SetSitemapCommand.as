/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.hydraframework.plugins.navigation.controller {
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.interfaces.IFacade;
	import com.hydraframework.core.mvc.patterns.command.SimpleCommand;
	import com.hydraframework.plugins.navigation.interfaces.ISitemap;
	import com.hydraframework.plugins.navigation.model.NavigationProxy;

	public class SetSitemapCommand extends SimpleCommand {
		public function get proxy():NavigationProxy {
			return this.facade.retrieveProxy(NavigationProxy.NAME) as NavigationProxy;
		}

		public function SetSitemapCommand(facade:IFacade) {
			super(facade);
		}

		override public function execute(notification:Notification):void {
			if (notification.isRequest()) {
				if (notification.body is ISitemap) {
					this.proxy.sitemap = notification.body as ISitemap;
				} else {
					throw new Error("HydraFramework NavigationPlugin Error: Cannot set sitemap; the sitemap passed to the command is either null or does not implement ISitemap.");
				}
			}
		}
	}
}