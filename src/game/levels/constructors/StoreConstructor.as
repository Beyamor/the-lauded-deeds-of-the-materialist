package game.levels.constructors 
{
	import game.levels.Level;
	/**
	 * ...
	 * @author beyamor
	 */
	public class StoreConstructor implements Constructor 
	{
		
		public function StoreConstructor() 
		{
			
		}
		
		/* INTERFACE game.levels.constructors.Constructor */
		
		public function construct():Level 
		{
			return new Level;
		}
		
	}

}