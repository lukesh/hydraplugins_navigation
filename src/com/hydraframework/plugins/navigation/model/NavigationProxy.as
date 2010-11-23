/*
   HydraFramework - Copyright (c) 2009 andCulture, Inc. Some rights reserved.
   Your reuse is governed by the MIT License (http://www.opensource.org/licenses/mit-license.php)
 */
package com.hydraframework.plugins.navigation.model {

	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.events.Phase;
	import com.hydraframework.core.mvc.patterns.proxy.Proxy;
	import com.hydraframework.plugins.navigation.NavigationPlugin;
	import com.hydraframework.plugins.navigation.interfaces.ISitemap;
	import com.hydraframework.plugins.navigation.interfaces.ISitemapItem;

	import flash.events.Event;
	import flash.utils.setTimeout;

	import mx.controls.Alert;
	import mx.events.BrowserChangeEvent;
	import mx.managers.BrowserManager;
	import mx.managers.IBrowserManager;

	public class NavigationProxy extends Proxy {
		public static const NAME:String                = "NavigationProxy";
		private static const _instance:NavigationProxy = new NavigationProxy();

		public static function getInstance():NavigationProxy {
			return _instance;
		}

		public static function get instance():NavigationProxy {
			return _instance;
		}

		private var _sitemap:ISitemap;

		public function set sitemap(sitemap:ISitemap):void {
			this._sitemap = sitemap;
			this.sendNotification(new Notification(NavigationPlugin.SET_SITEMAP, sitemap, Phase.RESPONSE)); //fix - wdeshong - 20101122
		}

		public function get sitemap():ISitemap {
			return this._sitemap;
		}
		public var currentItem:ISitemapItem;
		public var browserManager:IBrowserManager;
		private var parsing:Boolean                    = false;

		public function NavigationProxy() {
			super(NAME);
			bindBrowserManager();
		}

		private function bindBrowserManager():void {
			browserManager = BrowserManager.getInstance();
			browserManager.addEventListener(BrowserChangeEvent.BROWSER_URL_CHANGE, parseURL);
			browserManager.init("", "");
		}

		private function updateTitle():void {
			browserManager.setTitle(currentItem.getTitle());
		}

		private function updateURL():void {
			if (!parsing) {
				setTimeout(actuallyUpdateURL, 100);
			}
		}

		private function actuallyUpdateURL():void {
			browserManager.setFragment(currentItem.getUrl());
		}

		private function parseURL(event:Event):void {
			parsing = true;
			var view:String = browserManager.fragment as String;
			loadContent(view as String);
			parsing = false;
		}

		private function loadContent(url:Object, updateHistory:Boolean = false):void {
			var item:ISitemapItem;

			if (url is ISitemapItem) {
				item = url as ISitemapItem;
			} else {
				if (!this._sitemap) {
					setTimeout(loadContent, 200, url, true);
					return;
				}
				item = this._sitemap.getItemByUrl(url as String);
			}

			if (item && currentItem != item) {
				this.currentItem = item;
				if (updateHistory) {
					this.updateURL();
				}
				this.updateTitle();
				this.sendNotification(new Notification(NavigationPlugin.NAVIGATE, item, Phase.RESPONSE));
			}
		}

		public function navigateTo(url:Object = null):void {
			if (url == null) {
				parseURL(null);
			} else {
				loadContent(url, true);
			}
		}
	}
}