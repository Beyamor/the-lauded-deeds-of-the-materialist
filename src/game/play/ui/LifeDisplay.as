package game.play.ui 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import game.play.playthrough.Playthrough;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class LifeDisplay extends Graphic 
	{
		private var	_playthrough:Playthrough,
					_cachedLives:int,
					_display:Text;
		
		public function LifeDisplay(playthrough:Playthrough) 
		{
			_playthrough	= playthrough;
			_cachedLives	= _playthrough.lives;
			active			= true;
			
			recreateDisplay();
		}
		
		private function recreateDisplay():void {
			
			_display = new Text("Lives: " + _playthrough.lives, 10, 10);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (_cachedLives != _playthrough.lives) {
				
				_cachedLives = _playthrough.lives;
				recreateDisplay();
			}
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			_display.render(target, point, camera);
		}
	}

}