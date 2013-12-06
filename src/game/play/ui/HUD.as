package game.play.ui 
{
	import flash.geom.Point;
	import game.play.entities.player.Player;
	import game.play.worlds.PlayWorld;
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
		
		public function HUD(world:PlayWorld) 
		{
			super(0, 0, new Graphiclist(
				new LifeDisplay(world.playthrough),
				new GoldDisplay(world.playthrough),
				new MultiplierDisplay(world.multiplier)
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