package game.play.entities.player 
{
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayerSprite extends Graphic 
	{
		private var _buffer:Shape	= new Shape,
					_matrix:Matrix	= FP.matrix;
		
		public function PlayerSprite() 
		{
			var graphics:Graphics = _buffer.graphics;
			
			graphics.beginFill(0, 0);
			graphics.lineStyle(3, 0x404040);
			graphics.drawCircle(24, 24, 20);
			graphics.endFill();
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