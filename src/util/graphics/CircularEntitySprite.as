package util.graphics 
{
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author beyamor
	 */
	public class CircularEntitySprite extends ProgrammaticGraphic 
	{
		
		public function CircularEntitySprite(entity:Entity, opts:Object) 
		{
			_graphics.beginFill(opts.color || 0xFF0000, opts.alpha? opts.alpha : opts.color? 1 : 0);
			if (opts.outline) _graphics.lineStyle(opts.thickness || 1, opts.outline);
			_graphics.drawCircle(entity.halfWidth, entity.halfHeight, entity.halfWidth);
			center(entity.width, entity.height);
		}
		
	}

}