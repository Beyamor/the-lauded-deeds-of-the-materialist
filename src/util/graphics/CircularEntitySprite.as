package util.graphics 
{
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author beyamor
	 */
	public class CircularEntitySprite extends ProgrammaticGraphic 
	{
		private var	_entity:Entity,
					_opts:Object;
		
		public function CircularEntitySprite(entity:Entity, opts:Object) 
		{
			_entity	= entity;
			_opts	= opts;
			
			centerOn(entity);
		}
		
		override protected function draw():void 
		{
			_graphics.beginFill(_opts.color || 0xFF0000, _opts.alpha? _opts.alpha : _opts.color? 1 : 0);
			if (_opts.outline) _graphics.lineStyle(_opts.thickness || 1, _opts.outline);
			_graphics.drawCircle(
				_entity.halfWidth,
				_entity.halfHeight,
				_entity.halfWidth);
		}
	}

}