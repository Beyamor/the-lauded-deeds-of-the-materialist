package game.play.ui.huds 
{
	import flash.geom.Point;
	import game.play.entities.player.Player;
	import game.play.ui.displays.GoldDisplay;
	import game.play.ui.displays.LifeDisplay;
	import game.play.ui.displays.MultiplierDisplay;
	import game.play.worlds.PlayWorld;
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