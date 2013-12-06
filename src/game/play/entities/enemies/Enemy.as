package game.play.entities.enemies 
{
	import flash.utils.Timer;
	import game.play.entities.gold.Gold;
	import game.play.entities.PlayEntity;
	import game.play.worlds.PlayWorld;
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
					_isActive:Boolean	= false;
		
		public function Enemy(x:Number, y:Number, graphic:Graphic=null) {
			
			width = height = 32;
			centerOrigin();
			
			_value = Values.lookup(Object(this).constructor);
			
			super(x, y, graphic);
			
			collisionHandlers = {
				wall: Fn.constantly(true)
			}
			
			level	= 60;
			type	= "inactive-enemy";
		}
		
		override public function added():void 
		{
			super.added();
			
			graphic['alpha'] = 0; // whateeeever
			
			updateables.add(new Sequencer(
				new FadeIn(graphic, INACTIVE_WINDOW),
				
				new SequencedCallback(Fn.bind(this, function():void {
					
					type		= "enemy"; // Eh, only become an enemy when activated, saves us some checks
					_isActive	= true;
					onActivation();
				}))
			));
		}
		
		protected function onActivation():void {
			
			// Override in subclass
		}
		
		protected function act():void {
			
			// Override in subclass
		}
		
		override public function update():void 
		{
			super.update();
			
			if (_isActive) act();
		}
		
		public function hit():void {
			
			if (world) {
				
				if (world is PlayWorld)
					(world as PlayWorld).multiplier.tap();
				
				Gold.drop(world, x, y, _value);
				removeFromWorld();
			}
		}
	}
	
}