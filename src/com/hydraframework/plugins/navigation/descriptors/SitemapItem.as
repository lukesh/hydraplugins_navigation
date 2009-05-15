package com.hydraframework.plugins.navigation.descriptors {
	import com.hydraframework.plugins.navigation.interfaces.ISitemapItem;

	public class SitemapItem implements ISitemapItem {
		public var url:String;
		public var title:String;
		public var data:Object;

		public function setUrl(value:String):void {
			this.url = value;
		}

		public function getUrl():String {
			return this.url;
		}

		public function setTitle(value:String):void {
			this.title = value;
		}
		
		public function getTitle():String {
			return this.title;
		}
		
		public function setData(value:Object):void {
			this.data = value;
		}

		public function getData():Object {
			return this.data;
		}

		public function SitemapItem(url:String, title:String, data:Object) {
			this.url = url;
			this.title = title;
			this.data = data;
		}

		public function clone():ISitemapItem {
			return new SitemapItem(this.url, this.title, this.data);
		}
	}
}