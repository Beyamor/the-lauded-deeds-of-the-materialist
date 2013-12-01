package util.cameras 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class CameraDecorator implements Camera 
	{
		private var _base:Camera;
		
		public function CameraDecorator(base:Camera) 
		{
			_base = base;
		}
		
		/* INTERFACE util.cameras.Camera */
		
		public function get x():int 
		{
			return _base.x;
		}
		
		public function set x(value:int):void 
		{
			_base.x = value;
		}
		
		public function get y():int 
		{
			return _base.y;
		}
		
		public function set y(value:int):void 
		{
			_base.y = value;
		}
		
		public function get width():int 
		{
			return _base.width;
		}
		
		public function get height():int 
		{
			return _base.height;
		}
		
		public function update():void 
		{
			_base.update();
		}
		
	}

}