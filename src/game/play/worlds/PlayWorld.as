package game.play.worlds 
{
	import flash.geom.Point;
	import game.levels.Cell;
	import game.levels.constructors.Constructor;
	import game.levels.constructors.MirrorBothConstructor;
	import game.levels.Level;
	import game.play.entities.enemies.wanderer.Wanderer;
	import game.play.entities.player.Player;
	import game.play.entities.stairs.Stairs;
	import game.play.GoldMultiplier;
	import game.play.PlayerCam;
	import game.play.playthrough.Playthrough;
	import game.play.reification.LevelReifier;
	import game.play.paths.PathFinder;
	import game.play.Spawner;
	import game.play.ui.HUD;
	import game.start.StartScreen;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	import util.cameras.Camera;
	import util.Timer;
	import util.UpdateList;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayWorld extends World 
	{
		private var _level:Level,
					_updateables:UpdateList,
					_reifier:LevelReifier,
					_playerCam:Camera,
					_spawner:Spawner,
					_stairsSpawned:Boolean	= false;
		
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
			
			_reifier = new LevelReifier(playthrough);
			for each (var entity:Entity in _reifier.reify(_level)) {
				
				add(entity);
			}
			
			player = new Player(Level.PIXEL_CENTER.x, Level.PIXEL_CENTER.y);
			add(player);
							
			pathFinder = new PathFinder(this, _level);
			
			_spawner = new Spawner(this);
			
			multiplier = new GoldMultiplier();
			
			add(new HUD(this));
			
			_updateables = new UpdateList(
				_spawner,
				multiplier
			);
			resetCamera();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (!_stairsSpawned && _spawner.isFinished && (typeCount("enemy") == 0) && (typeCount("inactive-enemy") == 0)) {
				
				add(new Stairs(function():void {
							
							FP.world = new Store(playthrough);
				}));
				
				_stairsSpawned = true;
			}
			
			_updateables.update();
			
			if (Input.pressed("restart")) FP.world = new StartScreen;
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
		
		public function playerWasKilled():void {
			
			playthrough.lives -= 1;
			
			if (playthrough.lives > 0) {
				
				restart();
			}
			
			else {
				
				FP.world = new StartScreen;
			}
		}
		
		private function restart():void {
			
			var	entitiesToRemove:Vector.<Entity> = new Vector.<Entity>;
			for each (var typeToRemove:String in ["player", "enemy", "inactive-enemy", "gold", "shot"]) {
				
				getType(typeToRemove, entitiesToRemove);
			}
			
			removeList(entitiesToRemove);
			
			player = new Player(Level.PIXEL_CENTER.x, Level.PIXEL_CENTER.y);
			add(player);
			
			resetCamera();
			
			multiplier.kill();
		}
		
		private function resetCamera():void {
			
			_updateables.remove(_playerCam);
			_playerCam = new PlayerCam(this, player);
			_updateables.add(_playerCam);
		}
	}

}