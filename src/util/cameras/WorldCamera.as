package util.cameras 
{
	import flash.geom.Point;
	import game.Consts;
	import game.Main;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author beyamor
	 */
	public class WorldCamera implements Camera 
	{
		private var _camera:Point;
		
		public function WorldCamera(world:World) 
		{
			_camera = world.camera;
		}
		
		/* INTERFACE util.cameras.Camera */
		
		public function get x():int 
		{
			return _camera.x;
		}
		
		public function set x(value:int):void 
		{
			_camera.x = value;
		}
		
		public function get y():int 
		{
			return _camera.y;
		}
		
		public function set y(value:int):void 
		{
			_camera.y = value;
		}
		
		public function get width():int 
		{
			return Main.WIDTH;
		}
		
		public function get height():int 
		{
			return Main.HEIGHT;
		}
		
		public function update():void 
		{
			// Do nothing
		}
		
	}

}