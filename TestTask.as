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
			
			
			var sb:ScrollBox = new ScrollBox(['sdf','sdf','sdf','sdf','sdf','sdf','sdf','sdf','sdf','sdf']);
			addChild(sb);
			
		}
		
		
	}
	
}
