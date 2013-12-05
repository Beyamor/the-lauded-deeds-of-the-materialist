package util.effects 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class FadeIn extends Fader 
	{
		
		public function FadeIn(thing:*, opts:Object=null) 
		{
			super(thing, opts);
		}
		
		override protected function fade(elapsed:Number):Number 
		{
			return elapsed;
		}
	}

}