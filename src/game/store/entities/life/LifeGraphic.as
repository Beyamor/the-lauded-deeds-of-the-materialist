package game.store.entities.life 
{
	import flash.geom.Point;
	import flash.display.BitmapData;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class LifeGraphic extends Graphic 
	{
		[Embed (source="/images/fullsize-life.png" )]
		public static const SPRITE_SOURCE:Class;
		
		private var	_graphics:Graphiclist;
		
		public function LifeGraphic(life:Life) 
		{
			var	sprite:Image = new Image(SPRITE_SOURCE);
			sprite.centerOO();
			
			var price:Text = new Text(life.price.toString());
			price.color = (life.canBeAfforded? 0xFFFFFF : 0xFF0000);
			price.centerOO();
			
			_graphics = new Graphiclist(
				sprite,
				price
			);
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			_graphics.render(target, point, camera);
		}
	}

}