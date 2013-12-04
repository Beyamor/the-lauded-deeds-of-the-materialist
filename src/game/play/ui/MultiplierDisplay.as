package game.play.ui 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import game.play.GoldMultiplier;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MultiplierDisplay extends Graphic 
	{
		private var	_multiplier:GoldMultiplier,
					_cachedValue:int,
					_display:Text;
		
		public function MultiplierDisplay(multiplier:GoldMultiplier) 
		{
			_multiplier		= multiplier;
			_cachedValue	= _multiplier.value;
			active			= true;
			
			recreateDisplay();
		}
		
		private function recreateDisplay():void {
			
			_display = new Text("x" + _multiplier.value, 10, 25);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (_cachedValue != _multiplier.value) {
				
				_cachedValue = _multiplier.value;
				recreateDisplay();
			}
			
			_display.color = _multiplier.isAlive? 0x87B7E8 : 0xFFFFFF;
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			_display.render(target, point, camera);
		}
	}

}