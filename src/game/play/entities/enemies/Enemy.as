package game.play.entities.enemies 
{
	import flash.utils.Timer;
	import game.common.entities.PlayEntity;
	import game.play.entities.enemies.behaviours.Behaviour;
	import game.play.entities.gold.Gold;
	import game.play.PlayWorld;
	import net.flashpunk.Graphic;
	import util.Fn;
	import util.sequencing.items.effects.FadeIn;
	import util.sequencing.items.ParallelItems;
	import util.sequencing.items.SequencedCallback;
	import util.sequencing.Sequencer;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Enemy extends PlayEntity
	{
		public static const	INACTIVE_WINDOW:Number	= 1;
		
		private var	_value:int,
					_behaviour:Behaviour;
					
		protected var	boostsMultipier:Boolean	= true,
						inactiveWindow:Number	= INACTIVE_WINDOW;
		
		public function Enemy(x:Number, y:Number, initialBehaviour:Behaviour) {
			
			width = height = 32;
			centerOrigin();
			
			_value = Values.lookup(Object(this).constructor);
			
			super(x, y, graphic);
			
			collisionHandlers = {
				wall: Fn.constantly(true)
			}
			
			level	= 60;
			type	= "inactive-enemy";
			
			_behaviour = initialBehaviour;
		}
		
		override public function added():void 
		{
			super.added();
			
			graphic['alpha'] = 0; // whateeeever
			
			updateables.add(new Sequencer(
				new FadeIn(graphic, inactiveWindow),
				
				new SequencedCallback(Fn.bind(this, function():void {
					
					type		= "enemy"; // Eh, only become an enemy when activated, saves us some checks
					_behaviour.start();
					updateables.add(_behaviour);
				}))
			));
		}
		
		public function hit():void {
			
			if (world) {
				
				if (world is PlayWorld)
					(world as PlayWorld).multiplier.tap(boostsMultipier);
				
				Gold.drop(world, x, y, _value);
				removeFromWorld();
			}
		}
	}
	
}