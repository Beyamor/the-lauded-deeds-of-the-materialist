package game.play.entities.enemies 
{
	import flash.utils.Timer;
	import game.play.entities.gold.Gold;
	import game.play.entities.PlayEntity;
	import game.play.PlayWorld;
	import net.flashpunk.Graphic;
	import util.effects.Blinker;
	import util.effects.FadeIn;
	import util.Fn;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Enemy extends PlayEntity
	{
		public static const	INACTIVE_WINDOW:Number	= 1;
		
		private var	_value:int,
					_isActive:Boolean	= false;
		
		public function Enemy(value:int, x:Number, y:Number, graphic:Graphic=null) {
			
			width = height = 32;
			centerOrigin();
			
			_value = value;
			super(x, y, graphic);
			
			collisionHandlers = {
				wall: Fn.constantly(true)
			}
			
			level = 60;
		}
		
		override public function added():void 
		{
			super.added();
			
			graphic['alpha'] = 0; // whateeeever
			
			updateables.add(new FadeIn(graphic, {
				start:		true,
				duration:	INACTIVE_WINDOW,
				onEnd:		Fn.bind(graphic, function():void {

					type		= "enemy"; // Eh, only become an enemy when activated, saves us some checks
					_isActive	= true;
					onActivation();
				})
			}));
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