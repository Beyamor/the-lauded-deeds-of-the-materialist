package game.play.entities.shot 
{
	import util.ProgrammaticGraphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class ShotSprite extends ProgrammaticGraphic 
	{
		
		public function ShotSprite() 
		{
			_graphics.beginFill(0, 0);
			_graphics.lineStyle(3, 0x202060);
			_graphics.drawCircle(Shot.WIDTH / 2, Shot.HEIGHT / 2, Shot.WIDTH / 2);
			_graphics.endFill();
		}
		
	}

}