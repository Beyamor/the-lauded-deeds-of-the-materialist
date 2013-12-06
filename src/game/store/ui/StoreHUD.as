package game.store.ui 
{
	import game.common.playthrough.Playthrough;
	import game.common.ui.displays.GoldDisplay;
	import game.common.ui.displays.LifeDisplay;
	import game.common.ui.HUD;
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