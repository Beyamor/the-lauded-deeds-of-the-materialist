package game.play.paths 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import game.levels.Cell;
	import game.levels.Level;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Node 
	{
		public static var	PER_CELL:int			= 2,
							WIDTH:int				= Cell.WIDTH / PER_CELL,
							HEIGHT:int				= Cell.HEIGHT / PER_CELL,
							MAX_LEVEL_X:int			= Level.WIDTH * PER_CELL,
							MAX_LEVEL_Y:int			= Level.HEIGHT * PER_CELL,
							COLLISION_WEIGHT:Number	= 10000;
							
		private var	_nodes:Vector.<Vector.<Node>>,
					_x:int,
					_y:int,
					_world:World,
					_rect:Rectangle,
					_h:Number,
					_hCalculated:Boolean,
					_target:*;
					
		public var	weight:Number,
					center:Point,
					parent:Node,
					neighbours:Vector.<Node>;
		
		public function Node(world:World, nodes:Vector.<Vector.<Node>>, x:int, y:int) 
		{
			_world	= world;
			_nodes	= nodes;
			_x		= x;
			_y		= y;
			
			_rect	= new Rectangle(_x * WIDTH, _y * HEIGHT, WIDTH, HEIGHT);
			center	= new Point((_x + 0.5) * WIDTH, (_y + 0.5) * HEIGHT);
		}
		
		public function initialize(target:*, collisionTypes:Array):void {
				
			_hCalculated	= false;
			parent			= null;
			weight			= WIDTH;
			_target			= target;
			
			for (var collisionType:String in collisionTypes) {
				
				if (_world.collideRect(collisionType, _rect.x, _rect.y, _rect.width, _rect.height)) {
					
					weight += COLLISION_WEIGHT;
					break;
				}
			}
		}
		
		public function setNeighbours():void {
			
			neighbours = new Vector.<Node>;
			
			for each (var dx:int in [ -1, 0, 1]) {
				for each (var dy:int in [ -1, 0, 1]) {
					if (dx == 0 && dy == 0) continue;
				
					var	neighbourX:int	= _x + dx,
						neighbourY:int	= _y + dy;
						
					if (neighbourX < 0) continue;
					if (neighbourY < 0) continue;
					if (neighbourX >= MAX_LEVEL_X) continue;
					if (neighbourY >= MAX_LEVEL_Y) continue;
					if (_nodes[neighbourX][neighbourY] == null) continue;
					
					if (dx != 0 && dy != 0) {
						
						if (_nodes[_x + dx][_y] == null) continue;
						if (_nodes[_x][_y + dy] == null) continue;
					}
					
					neighbours.push(_nodes[neighbourX][neighbourY]);
				}
			}
		}
		
		public function get g():Number {
			
			var	result:Number = weight;
			if (parent) result += parent.g;
			return result;
		}
		
		public function get h():Number {
			
			if (_hCalculated) return _h;
		
			var	dx:Number	= _target.x - center.x,
				dy:Number	= _target.y - center.y;
				
			_h				= Math.sqrt(dx * dx + dy * dy);
			_hCalculated	= true;
			return _h;
		}
	}

}