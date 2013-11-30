package util 
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class ProgrammaticGraphic extends Graphic 
	{
		private var _buffer:Shape	= new Shape,
					_matrix:Matrix	= FP.matrix;
					
		protected var	_graphics:Graphics;
		
		
		public function ProgrammaticGraphic() 
		{
			_graphics = _buffer.graphics;
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			_point.x	= point.x - camera.x;
			_point.y	= point.y - camera.y;
			
			_matrix.b = _matrix.c = 0;			
			_matrix.tx	= _point.x;
			_matrix.ty	= _point.y;
			
			target.draw(_buffer, _matrix);
		}
	}

}