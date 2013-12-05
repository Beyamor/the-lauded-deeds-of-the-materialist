package util.sequencing.items.effects 
{
	import util.sequencing.items.PropertyTransition;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class FadeOut extends PropertyTransition 
	{
		
		public function FadeOut(thing:Object, duration:Number) 
		{
			super(thing, {
				from:		1,
				to:			0,
				property:	"alpha",
				duration:	duration
			});
		}
		
	}

}