package  {
	import feathers.controls.*;
    import feathers.themes.MetalWorksMobileTheme;
 
    import starling.display.Sprite;
	import starling.display.*;
    import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
    
	public class TestTask extends Sprite{

		protected var listLength:int=0;
		private var textFile:XML;
		public function TestTask() {
			// constructor code
			readFile();
			
			
			
		}
		private function readFile():void
		{
			var loader:URLLoader = new URLLoader(new URLRequest("assets/text.xml"));
			loader.addEventListener(Event.COMPLETE, xmlLoaded);
		}
		private function xmlLoaded(e:Event):void 
		{
			textFile = new XML(e.target.data);
			
			
			var textArray:Array = new Array();

			textFile.news.
			(
              textArray.push(toString())
			); 
			
			var sb:ScrollBox = new ScrollBox(textArray);
			addChild(sb);
        }
	}
	
}
