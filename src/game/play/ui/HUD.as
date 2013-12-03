package game.play.ui 
{
	import flash.geom.Point;
	import game.play.entities.player.Player;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class HUD extends Entity 
	{
		public static const	ZERO:Point = new Point(0, 0);
		
		public function HUD(player:Player) 
		{
			super(0, 0, new Graphiclist(
				new GoldDisplay(player)
			));
			
			graphic.active = true;
			level = -100;
		}
		
		override public function render():void 
		{
			graphic.render(renderTarget? renderTarget : FP.buffer, ZERO, ZERO);
		}
	}

}