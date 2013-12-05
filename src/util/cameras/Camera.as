package util.cameras 
{
	import util.Updateable;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public interface Camera extends Updateable
	{
		function get x():int;
		function set x(newX:int):void;
		function get y():int;
		function set y(newY:int):void;
		function get width():int;
		function get height():int;
	}
	
}