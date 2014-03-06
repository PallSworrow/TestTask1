package  {
	import starling.display.MovieClip;
	import starling.extensions.pixelmask.PixelMaskDisplayObject;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	import flash.text.TextFormat;
	import feathers.controls.text.TextFieldTextRenderer;
	import flash.events.MouseEvent;
	import starling.events.*;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import flash.geom.Point;

	public class Cell extends PixelMaskDisplayObject{
		public var minH:int=80;
		public var maxH:int;
		public var difH:int;
		
		private var textOffsetY:int=15;
		private var textOffsetX:int=10;
		
		private var maskedObj:Sprite;
		private var maskObj:Sprite;
		var qd:Quad;
		private var condition:int = 0;
		public function Cell(val:String, bg=null) {
			// constructor code
			super(-1,true);
			maskObj = new Sprite();
			maskObj.height = 200;
			
			var q:Quad
			q = new Quad(0.1,200, 0xaaaaaa);
			q.alpha = 0;
			maskObj.addChild(q);
			qd = new Quad(600,80, 0xaaaaaa);
			
			maskObj.addChild(qd);
			
			
			
			maskedObj = new Sprite();
			var tx:TextFieldTextRenderer = new TextFieldTextRenderer();
			tx.width = 580;
			tx.x = 10;
			tx.y = 15;
			tx.wordWrap = true;
			tx.text = val;
			tx.height = 200;
			
			//tx.validate();
			trace(tx.height);
			
			q = new Quad(600,200, 0xaaaaaa);
			
			maskedObj.addChild(q);
			maskedObj.addChild(tx);
			
			
			addChild(maskedObj);
			this.mask = maskObj;
			
			
			this.addEventListener(TouchEvent.TOUCH, onTouch);
			
			
			
		}
		private function onTouch(e:TouchEvent):void
        {
            var touch:Touch = e.getTouch(stage);
            if(touch)
            {
                if(touch.phase == TouchPhase.BEGAN)
                {
                             
					if(maskObj.hitTest( touch.getLocation(this)))
					  
					{
					
					
					if(condition == 0)//closed
					{
						TweenLite.to(qd,1,{scaleY: 20/8});
						condition = 1;
					}
					else
					{
						TweenLite.to(qd,1,{scaleY: 1});
						condition = 0;
					}}
                }
 
                
            }
 
        }

	}
	
}
