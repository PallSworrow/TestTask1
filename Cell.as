package  {
	import starling.display.MovieClip;
	import starling.extensions.pixelmask.PixelMaskDisplayObject;
	import starling.display.Quad;
	import starling.display.Sprite;
	import feathers.controls.text.TextFieldTextRenderer;
	import flash.events.MouseEvent;
	import starling.events.*;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import flash.geom.Point;
	import Src.TextBox;

	public class Cell extends PixelMaskDisplayObject{
		public var minH:int=75;
		public var maxH:int;
		public var difH:int;
		public var curH:int=minH;
		
		private var textOffsetY:int=15;
		private var textOffsetX:int=10;
		
		private var maskedObj:Sprite;
		private var maskObj:Sprite;
		var qd:Quad;
		private var condition:int = 0;
		public function Cell(val:String, bg) {
			// constructor code
			super(-1,true);
			
			var txt:TextBox = new TextBox(val, 580);
			txt.x = 10;
			txt.y = 15;
			this.maxH = txt.tf.measureText().y+15;
			this.difH = maxH- minH;
			
			maskObj = new Sprite();
			maskObj.height = maxH;
			
			var q:Quad
			q = new Quad(0.1,maxH, 0xaaaaaa);
			q.alpha = 0;
			maskObj.addChild(q);
			qd = new Quad(600,minH, 0xaaaaaa);
			
			maskObj.addChild(qd);
			
			
			
		
			maskedObj = new Sprite();
			q = new Quad(600,maxH+60, bg);
			
			
			maskedObj.addChild(q);
			
			maskedObj.addChild(txt);
			
			
			addChild(maskedObj);
			this.mask = maskObj;
			
			
			
			
			
			
		}
		public function touch():Boolean
        {
			if(condition == 0)//closed
			{
				TweenLite.to(qd,0.5,{scaleY: maxH/minH});
				condition = 1;
				curH=maxH;
				return true;
			}
			else
			{
				curH=minH;
				TweenLite.to(qd,0.5,{scaleY: 1});
				condition = 0;
				return false;
			}
					 
        }
		override public function get height():Number
   		{
        	//return qd.height;
			return curH; // testStringUpdated
    	}

	}
	
}
