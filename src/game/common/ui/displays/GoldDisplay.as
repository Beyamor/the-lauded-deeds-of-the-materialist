package game.common.ui.displays 
{
	import flash.geom.Point;
	import flash.display.BitmapData;
	import game.common.playthrough.Playthrough;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GoldDisplay extends Graphic 
	{
		private var	_playthrough:Playthrough,
					_cachedGold:int,
					_display:Text;
		
		public function GoldDisplay(playthrough:Playthrough) 
		{
			_playthrough	= playthrough;
			_cachedGold		= _playthrough.gold;
			active			= true;
			
			recreateDisplay();
		}
		
		private function recreateDisplay():void {
			
			_display = new Text("Gold: " + _playthrough.gold, 10, 25);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (_cachedGold != _playthrough.gold) {
				
				_cachedGold = _playthrough.gold;
				recreateDisplay();
			}
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			_display.render(target, point, camera);
		}
	}

}