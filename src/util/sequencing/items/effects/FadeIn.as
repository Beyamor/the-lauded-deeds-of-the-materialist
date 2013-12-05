package util.sequencing.items.effects
{
	import util.sequencing.items.PropertyTransition;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class FadeIn extends PropertyTransition 
	{
		
		public function FadeIn(thing:Object, duration:Number) 
		{
			super(thing, {
				from:		0,
				to:			1,
				property:	"alpha",
				duration:	duration
			});
		}
		
	}

}