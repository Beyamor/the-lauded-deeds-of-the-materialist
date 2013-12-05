package util.effects 
{
	import util.Fn;
	import util.Timer;
	import util.Updateable;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class FadeOut extends Fader
	{
		public function FadeOut(thing:*, opts:Object=null) 
		{
			super(thing, opts);
		}
		
		override protected function fade(elapsed:Number):Number 
		{
			return (1 - elapsed);
		}
	}

}