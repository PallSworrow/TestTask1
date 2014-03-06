package  {
	
	import flash.display.Sprite;
	import starling.core.Starling;
	[SWF(width = "600",height = "400",frameRate = "60",backgroundColor = "#ffffff")]
	public class Main extends Sprite
	{

		private var _starling:Starling;

		public function Main()
		{
			_starling = new Starling(TestTask,stage);
			_starling.start();
		}
	}
	
}
