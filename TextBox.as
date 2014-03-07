package  {
	import starling.display.Sprite;
	 import feathers.controls.text.BitmapFontTextRenderer;
	 import feathers.text.BitmapFontTextFormat;
	import starling.text.BitmapFont;
	 import starling.textures.Texture;
	public class TextBox extends Sprite {
		

        [Embed(source="assets/font/font.fnt", mimeType="application/octet-stream")]
        private var fontFtn:Class;
		[Embed(source="assets/font/font.png")]
        private var fontPng:Class;
		public var tf:BitmapFontTextRenderer = new BitmapFontTextRenderer();
			
		public function TextBox(val:String, w:int) {
			// constructor code
			
            tf.width = w;
            tf.wordWrap = true;
			
            tf.textFormat = setFormat();
			tf.text = val;
			
			addChild(tf);
			tf.validate();
			
			//height = tf.measureText().y;
		}
		
		private function setFormat():BitmapFontTextFormat
		{
			var image:Texture = Texture.fromBitmap(new fontPng(), false);
            var font:BitmapFont = new BitmapFont(image, XML(new fontFtn()));
            return new BitmapFontTextFormat(font);
		}

	}
	
}
