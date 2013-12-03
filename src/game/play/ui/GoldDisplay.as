package game.play.ui 
{
	import flash.geom.Point;
	import flash.display.BitmapData;
	import game.play.entities.player.Player;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GoldDisplay extends Graphic 
	{
		private var	_player:Player,
					_cachedGold:int,
					_display:Text;
		
		public function GoldDisplay(player:Player) 
		{
			_player		= player;
			_cachedGold	= _player.gold;
			active		= true;
			
			recreateDisplay();
		}
		
		private function recreateDisplay():void {
			
			_display = new Text("Gold: " + _player.gold, 10, 1);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (_cachedGold != _player.gold) {
				
				_cachedGold = _player.gold;
				recreateDisplay();
			}
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			_display.render(target, point, camera);
		}
	}

}