package game.play.ui.huds 
{
	import game.play.playthrough.Playthrough;
	import game.play.ui.displays.GoldDisplay;
	import game.play.ui.displays.LifeDisplay;
	/**
	 * ...
	 * @author beyamor
	 */
	public class StoreHUD extends HUD 
	{
		
		public function StoreHUD(playthrough:Playthrough) 
		{
			super(
				new LifeDisplay(playthrough),
				new GoldDisplay(playthrough)
			);
		}
		
	}

}