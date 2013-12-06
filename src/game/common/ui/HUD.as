package game.common.ui 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class HUD extends Entity 
	{
		public static const	ZERO:Point = new Point(0, 0);
		
		public function HUD(... elements) 
		{
			var	graphicList:Graphiclist = new Graphiclist();
			for each (var element:Graphic in elements) graphicList.add(element);
			
			super(0, 0, graphicList);
		
			graphic.active = true;
			level = -100;
		}
		
		override public function render():void 
		{
			graphic.render(renderTarget? renderTarget : FP.buffer, ZERO, ZERO);
		}
	}

}