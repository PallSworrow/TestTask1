package  {
	import starling.display.Sprite;
	import feathers.controls.*;
    import feathers.themes.MetalWorksMobileTheme;
 
	import starling.display.*;
    import starling.events.Touch;
	import starling.events.TouchPhase;
	import starling.events.TouchEvent;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.geom.Point;
	
	public class ScrollBox extends Sprite{
		
		private var items:Vector.<Cell> = new Vector.<Cell>();
		private var container:ScrollContainer = new ScrollContainer();
		private var moveMaker:Shape = new Shape();
		public function ScrollBox(input:Array) {
			// constructor code
			
			
			
			this.addChild( container );
			var xPosition:Number = 0;
			var l:int = input.length;
			var c:Cell;
			for(var i:int = 0; i < l ; i++)
			{
 				if(i%2 == 0) c  = new Cell(input[i], 0xaaaaff);
				else c  = new Cell(input[i], 0xffaaaa);
				
				leng += c.minH;
    			c.y = xPosition;
    			container.addChild( c );
    			xPosition += c.minH;
				items.push(c);
			}
			container.width = 600;
			container.height = 400;
			this.addEventListener(TouchEvent.TOUCH, onTouch);
			moveMaker.addEventListener(Event.ENTER_FRAME,movement);
		}
		private var pressed:Boolean=false;
		private var touchStep:int;
		private function onTouch(e:TouchEvent):void
        {
			 var touch:Touch = e.getTouch(stage);
			 
			 if(touch)
            {
                if(touch.phase == TouchPhase.BEGAN)
                {
					pressed = true;
				}
				if(touch.phase == TouchPhase.MOVED)
                {
					
					touchStep = Math.abs(touch.globalX - touch.previousGlobalX)+Math.abs(touch.globalY - touch.previousGlobalY)
					if(touchStep > 20)pressed = false;
					trace(touchStep);
				}
				if(touch.phase == TouchPhase.ENDED && pressed)
                {
					Click(touch);
					
				}
			}
		}
		private function Click(touch:Touch):void
		{
			var touched:int = 0;//0 - nothing to move, 1- move up, 2- move down;
			 var targPos:int=0;
			for(var i:String in items)
			{
				TweenLite.to(items[i],0.5,{y:targPos});
					
				if(touch.isTouching(items[i]))
				{
					if(items[i].touch()) 
					{
						touched = 2;
						setTarget(items[i].y,items[i].difH);
								
						leng+=items[i].difH;
								
					}
					else
					{
						touched = 1;
						leng-=items[i].difH;
						//targetOffset = container.verticalScrollPosition - items[i].difH
					}
					container.readjustLayout();
				}
					targPos += items[i].height;
			}
		}
		private var targetOffset:int=-1;
		private var step:int=20;
		private var leng:int=0;
		private function setTarget(targ:int, dif:int):void
		{
			if(targ > container.maxVerticalScrollPosition+dif) targetOffset = container.maxVerticalScrollPosition+dif;
			else targetOffset = targ;
				
		}
		private function movement(e:Event):void
		{
			
			if(targetOffset >= 0)
			{
				
				if(container.verticalScrollPosition + step > container.maxVerticalScrollPosition) container.verticalScrollPosition =container.maxVerticalScrollPosition; 
				else
				{
					if(targetOffset - container.verticalScrollPosition > step)
					{
						container.verticalScrollPosition += step;
					}	
					else if(container.verticalScrollPosition - targetOffset > step)
					{
						container.verticalScrollPosition -= step;
					
					}
					else
					{
						container.verticalScrollPosition = targetOffset;
						targetOffset=-1;
					}
				}
				
			}
			container.readjustLayout();
		}
	}
	
}
