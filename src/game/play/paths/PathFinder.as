package game.play.paths 
{
	import flash.geom.Point;
	import game.levels.Cell;
	import game.levels.Level;
	import game.play.PlayWorld;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PathFinder 
	{
		private var	_nodes:Vector.<Vector.<Node>>,
					_nodeList:Vector.<Node>,
					_world:PlayWorld,
					_level:Level;
		
		public function PathFinder(world:PlayWorld, level:Level) 
		{
			_world		= world;
			_level		= level;
			_nodeList	= new Vector.<Node>;
			_nodes		= new Vector.<Vector.<Node>>;
			
			for (var x:int = 0; x < Node.MAX_LEVEL_X; ++x) {
				_nodes.push(new Vector.<Node>);
				for (var y:int = 0; y < Node.MAX_LEVEL_Y; ++y) {
					
					var	cellX:int	= x / Node.PER_CELL,
						cellY:int	= y / Node.PER_CELL;
						
					if (level.cells[cellX][cellY].isEmpty) {
						
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
				
			// Create the path from the nodes
			var	pathNode:Node = toNode,
				pathAlongNodes:Vector.<PathPoint> = new Vector.<PathPoint>;
				
			pathAlongNodes.unshift(new PathPoint(to.x, to.y));
			while (pathNode) {
				
				pathAlongNodes.unshift(PathPoint.from(pathNode.center));				
				pathNode = pathNode.parent;
			}
			pathAlongNodes.unshift(new PathPoint(from.x, from.y));
			
			// To preserve good corner tracing, don't allow corners to be merged
			var pointIndex:int,
				previousPoint:PathPoint,
				currentPoint:PathPoint,
				nextPoint:PathPoint;
			
			for (pointIndex = 2; pointIndex < pathAlongNodes.length - 2; ++pointIndex) {
				
				previousPoint	= pathAlongNodes[pointIndex - 1];
				currentPoint	= pathAlongNodes[pointIndex];
				nextPoint		= pathAlongNodes[pointIndex + 1];
				
				var	prevNodeX:int	= previousPoint.x / Node.WIDTH,
					prevNodeY:int	= previousPoint.y / Node.HEIGHT,
					currNodeX:int	= currentPoint.x / Node.WIDTH,
					currNodeY:int	= currentPoint.y / Node.HEIGHT,
					nextNodeX:int	= nextPoint.x / Node.WIDTH,
					nextNodeY:int	= nextPoint.y / Node.HEIGHT,
					
					// from previous to next node
					dx:int			= nextNodeX - prevNodeX,
					dy:int			= nextNodeY - prevNodeY;
					
				if (Math.abs(dx) != 1 || Math.abs(dy) != 1) continue;
				
				// from previous to potential wall
				dx = dx - (currNodeX - prevNodeX);
				dy = dy - (currNodeY - prevNodeY);
				
				if (!_nodes[prevNodeX + dx][prevNodeY + dy]) currentPoint.isMergeable = false;
			}
			
			// Having constructed a path, let's try to simplify it
			path = new Vector.<Point>;				
			path.push(pathAlongNodes[0]);
			
			previousPoint = pathAlongNodes[0];				
			pointIndex = 1;
			while (pointIndex < pathAlongNodes.length - 1) {
				
				currentPoint	= pathAlongNodes[pointIndex];
				nextPoint		= pathAlongNodes[pointIndex + 1];
				
				var	canBeMerged:Boolean = currentPoint.isMergeable;
				
				// Check for no collisions along path
				if (canBeMerged && _world.lineIntersectsWall(previousPoint, nextPoint))
					canBeMerged = false;
					
				if (!canBeMerged) {
					
					path.push(currentPoint);
					previousPoint = currentPoint;
				}
				
				++pointIndex;
			}			
			path.push(pathAlongNodes[pathAlongNodes.length - 1]);
			
			return path;
		}
	}

}
import flash.geom.Point;

class PathPoint extends Point {
	
	public var	isMergeable:Boolean = true;
	
	public function PathPoint(x:Number, y:Number) {
		
		super(x, y);
	}
	
	public static function from(point:Point):PathPoint {
		
		return new PathPoint(point.x, point.y);
	}
}