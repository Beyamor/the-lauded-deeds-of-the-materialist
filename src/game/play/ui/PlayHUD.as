package game.play.ui 
{
	import flash.geom.Point;
	import game.common.ui.displays.GoldDisplay;
	import game.common.ui.displays.LifeDisplay;
	import game.common.ui.displays.MultiplierDisplay;
	import game.common.ui.HUD;
	import game.play.PlayWorld;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayHUD extends HUD
	{
		public function PlayHUD(world:PlayWorld) 
		{
			super(
				new LifeDisplay(world.playthrough),
				new GoldDisplay(world.playthrough),
				new MultiplierDisplay(world.multiplier)
			);
		}
	}

}