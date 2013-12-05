package util.sequencing 
{
	import util.Updateable;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public interface SequenceItem extends Updateable
	{
		function get isFinished():Boolean;
	}
	
}