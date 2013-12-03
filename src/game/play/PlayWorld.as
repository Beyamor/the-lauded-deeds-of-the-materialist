package game.play 
{
	import flash.geom.Point;
	import game.levels.Cell;
	import game.levels.constructors.Constructor;
	import game.levels.constructors.MirrorBothConstructor;
	import game.levels.Level;
	import game.play.entities.enemies.wanderer.Wanderer;
	import game.play.entities.player.Player;
	import game.play.paths.PathFinder;
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
		private var _camera:Camera,
					_spawner:Spawner,
					_level:Level;
		
		public var	player:Player,
					pathFinder:PathFinder;
		
		public function PlayWorld() 
		{
			super();
		}
		
		override public function begin():void 
		{
			super.begin();
			
			var constructor:Constructor = new MirrorBothConstructor();
			_level = constructor.construct();
			
			var reifier:LevelReifier = new LevelReifier();
			for each (var entity:Entity in reifier.reify(_level)) {
				
				add(entity);
			}
			player = reifier.player;
			
			_camera = new BoundedCamera(0, 0, Level.PIXEL_WIDTH, Level.PIXEL_HEIGHT,
						new EntityCamera(player,
							new WorldCamera(this)));
							
			pathFinder = new PathFinder(this, _level);
			
			_spawner = new Spawner(this);
		}
		
		override public function update():void 
		{
			super.update();
			_camera.update();
			_spawner.update();
			
			if (Input.pressed("restart")) FP.world = new PlayWorld();
		}
		
		public function lineIntersectsWall(start:Point, end:Point):Boolean {
			
			var	dx:Number		= end.x - start.x,
				dy:Number		= end.y - start.y,
				length:Number	= Math.sqrt(dx * dx + dy * dy),
				steps:int		= Math.floor(length);
				
			if (length == 0) return false;
			
			dx /= length;
			dy /= length;
			
			for (var step:int = 0; step < steps; ++step) {
				
				var	x:int	= Math.floor((start.x + step * dx) / Cell.WIDTH),
					y:int	= Math.floor((start.y + step * dy) / Cell.HEIGHT);
					
				if (_level.cells[x][y].isWall) return true;
			}
			
			return false;
		}
	}

}