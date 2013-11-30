package game
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Main extends Engine 
	{
		public static const	WIDTH:int	= 800,
							HEIGHT:int	= 600;
		
		public function Main():void 
		{
			super(WIDTH, HEIGHT);
		}
		
		override public function init():void 
		{
			super.init();
			
			var world:World = new World();
			FP.world = world;
			world.addGraphic(new Text("hello world"));
		}
		
	}
	
}