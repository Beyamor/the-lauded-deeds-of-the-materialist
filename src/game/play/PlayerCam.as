package game.play 
{
	import game.levels.Level;
	import game.play.entities.player.Player;
	import net.flashpunk.World;
	import util.cameras.BoundedCamera;
	import util.cameras.CameraDecorator;
	import util.cameras.EntityCamera;
	import util.cameras.WorldCamera;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayerCam extends CameraDecorator 
	{
		
		public function PlayerCam(world:World, player:Player) 
		{
			super(new BoundedCamera(0, 0, Level.PIXEL_WIDTH, Level.PIXEL_HEIGHT,
					new EntityCamera(player,
						new WorldCamera(world))));
		}
		
	}

}