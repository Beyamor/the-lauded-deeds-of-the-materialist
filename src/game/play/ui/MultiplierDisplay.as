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
					_cachedValue:Number,
					_display:Text;
		
		public function MultiplierDisplay(multiplier:GoldMultiplier) 
		{
			_multiplier		= multiplier;
			_cachedValue	= _multiplier.value;
			active			= true;
			
			recreateDisplay();
		}
		
		private function recreateDisplay():void {
			
			var	displayString:String	= "x" + (Math.round(_multiplier.value * 100) / 100),
				fontSize:int			= Math.floor(_multiplier.value) * 2 + 14,
				prevSize:int			= Text.size;
			
			Text.size		= fontSize;
			_display		= new Text(displayString, 10, 25);
			Text.size		= prevSize;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (_cachedValue != _multiplier.value) {
				
				_cachedValue = _multiplier.value;
				recreateDisplay();
			}
			
			if (_multiplier.isAlive)		_display.color	= 0x87B7E8;
			else if (_multiplier.isDying)	_display.color	= 0xDE240B;
			else							_display.color	= 0xFFFFFF;
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			_display.render(target, point, camera);
		}
	}

}