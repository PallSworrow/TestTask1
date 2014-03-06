package  {
	import feathers.controls.*;
    import feathers.themes.MetalWorksMobileTheme;
 
    import starling.display.Sprite;
	import starling.display.*;
    import starling.events.*;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
    
	public class TestTask extends Sprite{

		protected var listLength:int=0;
		
		public function TestTask() {
			// constructor code
			
			
			var container:ScrollContainer = new ScrollContainer();
			this.addChild( container );
			var xPosition:Number = 0;
			for(var i:int = 0; i < 5; i++)
			{
 				var c:Cell = new Cell('sdf');
    			c.y = xPosition;
    			container.addChild( c );
    			xPosition += c.minH + 10;
			}
			container.width = 600;
			container.height = 400;
			
		}
		
	}
	
}
