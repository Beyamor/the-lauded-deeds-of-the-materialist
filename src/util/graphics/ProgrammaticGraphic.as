package util.graphics 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class ProgrammaticGraphic extends Graphic 
	{
		private var _shape:Shape		= new Shape,
					_matrix:Matrix		= FP.matrix,
					_origin:Point		= new Point,
					_isDirty:Boolean	= true,
					_alphaSet:Boolean	= false,
					_alpha:Number,
					_buffer:Bitmap		= new Bitmap;
					
		protected var	_graphics:Graphics;
		
		
		public function ProgrammaticGraphic() 
		{
			_graphics = _shape.graphics;
		}
		
		public function centerOn(thing:*):void {
			
			_origin.x = thing.width / 2;
			_origin.y = thing.height / 2;
		}
		
		public function redraw():void {
			
			_isDirty = false;
			_graphics.clear();
			draw();
			
			var	bounds:Rectangle	= _shape.getBounds(_shape),
				offset:Matrix		= new Matrix();
				
			offset.translate( -bounds.x, -bounds.y);
			
			_buffer.bitmapData = new BitmapData(bounds.width, bounds.height, true, 0);
			_buffer.bitmapData.draw(_shape, offset);
			
			if (_alphaSet) {
				
				var	area:Rectangle				= _buffer.getRect(_buffer),
					transform:ColorTransform	= new ColorTransform();
					
				transform.alphaMultiplier = _alpha;					
				_buffer.bitmapData.colorTransform(area, transform);
			}
		}
		
		protected function draw():void {
			
			// Override in subclass
		}
		
		public function set alpha(value:Number):void {
			
			if (!_alphaSet || _alpha != value) {
				_isDirty 	= true;
				_alphaSet	= true;
				_alpha		= value;
			}
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			if (_isDirty) redraw();
			
			_point.x	= point.x - camera.x;
			_point.y	= point.y - camera.y;
			
			_matrix.b = _matrix.c = 0;			
			_matrix.tx	= -_origin.x + _point.x + _shape.getBounds(_shape).left;
			_matrix.ty	= -_origin.y + _point.y + _shape.getBounds(_shape).top;
			
			target.draw(_buffer, _matrix);
		}
	}

}