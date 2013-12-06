package game.play.entities.enemies.mother 
{
	import game.play.entities.enemies.Enemy;
	import net.flashpunk.Graphic;
	import util.graphics.CircularEntitySprite;
	import util.Timer;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Mother extends Enemy 
	{
		
		public function Mother(x:Number, y:Number) 
		{
			super(x, y);
			width = height = 56;
			centerOrigin();
			
			graphic = new CircularEntitySprite(this, {
				color: 0x947F50
			});
		}
		
		override protected function onActivation():void 
		{
			super.onActivation();
			
			updateables.add(new Timer( {
				period:	1,
				loops:	true,
				start:	true,
				onEnd:	function():void {
					
					world.add(new Child(x, y));
				}
			}));
		}
	}

}