package util.cameras 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class BoundedCamera extends CameraDecorator 
	{
		private var	_minX:Number,
					_minY:Number,
					_maxX:Number,
					_maxY:Number;
		
		public function BoundedCamera(minX:Number, minY:Number, maxX:Number, maxY:Number, base:Camera) 
		{
			super(base);
			
			_minX = minX;
			_minY = minY;
			_maxX = maxX;
			_maxY = maxY;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (x < _minX)			x = _minX;
			if (y < _minY)			y = _minY;
			if (x + width > _maxX)	x = _maxX - width;
			if (y + height > _maxY)	y = _maxY - height;
		}
	}

}