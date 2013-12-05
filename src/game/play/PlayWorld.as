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
	import game.play.ui.HUD;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	import util.cameras.BoundedCamera;
	import util.cameras.Camera;
	import util.cameras.EntityCamera;
	import util.cameras.WorldCamera;
	import util.UpdateList;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayWorld extends World 
	{
		private var _level:Level,
					_updateables:UpdateList;
		
		public var	player:Player,
					pathFinder:PathFinder,
					multiplier:GoldMultiplier,
					playthrough:Playthrough;
		
		public function PlayWorld(playthrough:Playthrough) 
		{
			super();
			
			this.playthrough = playthrough;
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
			
			var playerCam:Camera = new BoundedCamera(0, 0, Level.PIXEL_WIDTH, Level.PIXEL_HEIGHT,
								new EntityCamera(player,
									new WorldCamera(this)));
							
			pathFinder = new PathFinder(this, _level);
			
			var spawner:Spawner = new Spawner(this);
			
			multiplier = new GoldMultiplier();
			
			add(new HUD(this));
			
			_updateables = new UpdateList(
				playerCam,
				spawner,
				multiplier
			);
		}
		
		override public function update():void 
		{
			super.update();
			_updateables.update();
			
			if (Input.pressed("restart")) FP.world = new PlayWorld(new Playthrough);
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