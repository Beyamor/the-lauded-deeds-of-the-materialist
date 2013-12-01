package game.play 
{
	import game.levels.constructors.Constructor;
	import game.levels.constructors.MirrorBothConstructor;
	import game.levels.Level;
	import game.play.entities.player.Player;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	import util.cameras.BoundedCamera;
	import util.cameras.Camera;
	import util.cameras.EntityCamera;
	import util.cameras.WorldCamera;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayWorld extends World 
	{
		private var _camera:Camera;
		
		public function PlayWorld() 
		{
			super();
		}
		
		override public function begin():void 
		{
			super.begin();
			
			var player:Entity = new Player(100, 100);
			add(player);
			
			var constructor:Constructor	= new MirrorBothConstructor(),
				level:Level				= constructor.construct(),
				reifier:LevelReifier	= new LevelReifier();
				
			for each (var entity:Entity in reifier.reify(level)) {
				
				add(entity);
			}
			
			_camera = new BoundedCamera(0, 0, Level.PIXEL_WIDTH, Level.PIXEL_HEIGHT,
						new EntityCamera(player,
							new WorldCamera(this)));
		}
		
		override public function update():void 
		{
			super.update();
			_camera.update();
			
			if (Input.pressed("restart")) FP.world = new PlayWorld();
		}
	}

}