package game.play.paths 
{
	import flash.geom.Point;
	import game.levels.Cell;
	import game.levels.Level;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PathFinder 
	{
		private var	_nodes:Vector.<Vector.<Node>>,
					_nodeList:Vector.<Node>;
		
		public function PathFinder(world:World, level:Level) 
		{
			_nodeList = new Vector.<Node>;
			_nodes = new Vector.<Vector.<Node>>;
			
			for (var x:int = 0; x < Node.MAX_LEVEL_X; ++x) {
				_nodes.push(new Vector.<Node>);
				for (var y:int = 0; y < Node.MAX_LEVEL_Y; ++y) {
					
					var	cellX:int	= x / Node.PER_CELL,
						cellY:int	= y / Node.PER_CELL;
						
					if (level.cells[cellX][cellY].type == Cell.EMPTY) {
						
						var node:Node = new Node(world, _nodes, x, y);
						_nodes[x][y] = node;
						_nodeList.push(node);
					}
					
					else {
						
						_nodes[x][y] = null;
					}
				}
			}
			
			for each (node in _nodeList) node.setNeighbours();
		}
		
		public function find(from:*, to:*, collisionTypes:Array = null):Vector.<Point> {
			
			if (collisionTypes == null) collisionTypes = [];
			
			for each (var node:Node in _nodeList) {
				
				node.initialize(to, collisionTypes);
			}
			
			var	open:Vector.<Node>	= new Vector.<Node>,
				closed:Vector.<Node>	= new Vector.<Node>,
				fromX:int				= Math.floor(from.x / Node.WIDTH),
				fromY:int				= Math.floor(from.y / Node.HEIGHT),
				toX:int					= Math.floor(to.x / Node.WIDTH),
				toY:int					= Math.floor(to.y / Node.HEIGHT),
				fromNode:Node		= _nodes[fromX][fromY],
				toNode:Node			= _nodes[toX][toY],
				path:Vector.<Point>;
				
			// If within same Node, just return direct path
			if (fromNode == toNode) {
				
				path = new Vector.<Point>;
				path.push(new Point(from.x, from.y));
				path.push(new Point(to.x, to.y));
				return path;
			}
			
			fromNode.g = 0;
			open.push(fromNode);
			while (true) {
				
				if (open.length == 0) return null; // no path
				
				var	minF:Number		= Infinity,
					nextNode:Node	= null;
					
				for each (var openNode:Node in open) {
					
					var	f:Number = openNode.h + openNode.g;
					
					if (f < minF) {
						
						minF		= f;
						nextNode	= openNode;
					}
				}
				
				if (nextNode == toNode) {
					
					break;
				}
				
				open.splice(open.indexOf(nextNode), 1);
				closed.push(nextNode);
				
				for each (var neighbourNode:Node in nextNode.neighbours) {
					
					if (open.indexOf(neighbourNode) != -1) {
						
						if (nextNode.gFor(neighbourNode) < neighbourNode.g)
							neighbourNode.parent	= nextNode;
							neighbourNode.g			= nextNode.gFor(neighbourNode);
						continue;
					}
					
					else if (closed.indexOf(neighbourNode) != -1) {
						
						continue;
					}
					
					else {
						
						neighbourNode.parent	= nextNode;
						neighbourNode.g			= nextNode.gFor(neighbourNode);
						open.push(neighbourNode);
					}
				}
			}
			
			var dx:Number, dy:Number, d1:Number, d2:Number;
			path = new Vector.<Point>;
			var	pathNode:Node = toNode;
			while (pathNode) {
				
				if (pathNode == toNode) {
					
					path.unshift(new Point(to.x, to.y));
				}
				else if (pathNode == fromNode) {
					
					path.unshift(new Point(from.x, from.y));
				}
				else {
				
					path.unshift(pathNode.center);
				}
				
				pathNode = pathNode.parent;
			}
			
			return path;
		}
	}

}