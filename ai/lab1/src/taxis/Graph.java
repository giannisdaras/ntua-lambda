package taxis;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;

class Point {
	public double x, y;

	@Override
	public boolean equals(Object other) {
		if (other == this)
			return true;
		if (!(other instanceof Node))
			return false;
		Node casted_other = (Node) other;
		return (this.x == casted_other.x && this.y == casted_other.y);
	}

	public Node findNearestNode(ArrayList<Node> nodes) {
		double minDist, dist;
		Node min;
		min = nodes.get(0);
		minDist = Distance.computeDistance(this, min);
		for (int j = 1; j < nodes.size(); j++) {
			dist = Distance.computeDistance(this, nodes.get(j));
			if (dist < minDist) {
				minDist = dist;
				min = nodes.get(j);
			}
		}
		return min;
	}
}

class Node extends Point {
	public long key;
	public int numberOfNeighbors = 0;
	public double distanceFromStart;
	public double fscore;
	public ArrayList<Long> addresses = new ArrayList<Long>();

	Node(double x, double y, long key) {
		this.x = x;
		this.y = y;
		this.key = key;
		this.distanceFromStart = Double.POSITIVE_INFINITY;
		this.fscore = Double.POSITIVE_INFINITY;
	}
}

class Taxi extends Point {
	public long id;
	public Node nearestNode;

	Taxi(double x, double y, long id, ArrayList<Node> nodes) {
		this.x = x;
		this.y = y;
		this.id = id;
		this.nearestNode = this.findNearestNode(nodes);
	}
}

class aStar {
	public aStarResult aStarSearch(Graph g1, Node startNode) {
		/*
		 * A* from start to end node. The idea is to take the smaller node from the
		 * frontier and go to the neighbor with the smallest f score. At the meantime,
		 * update all the neighbors scores.
		 */
		/* parentsMap takes a node key and returns a list of fathers for this node */
		double lambda = 0.5;
		ArrayList<Long> endKeys = new ArrayList<Long>();
		HashMap<Long, Long> taxiKeysMap = new HashMap<Long, Long>();
		HashMap<Long, HashSet<Node>> parentsMap = new HashMap<Long, HashSet<Node>>();
		HashSet<Node> visited = new HashSet<Node>();
		Comparator<Node> comp = new Comparator<Node>() {
			public int compare(Node point1, Node point2) {
				if (point1.fscore == point2.fscore)
					return 0;
				return (point1.fscore) < (point2.fscore) ? -1 : 1;
			}
		};
		TreeSet<Node> frontier = new TreeSet<Node>(comp);
		startNode.distanceFromStart = 0;
		double minimumDistance = Double.POSITIVE_INFINITY;
		for (Taxi taxi : g1.allTaxis) {
			endKeys.add(taxi.nearestNode.key);
			taxiKeysMap.put(taxi.nearestNode.key, taxi.id);
			double distance = Distance.computeDistance(startNode, taxi.nearestNode);
			if (distance < minimumDistance) {
				minimumDistance = distance;
			}
		}
//	    System.out.println(endKeys.toString());
//	    System.out.println(taxiKeysMap.toString());
		startNode.fscore = minimumDistance;
		frontier.clear();
		visited.clear();
		parentsMap.clear();
		frontier.add(startNode);
		Node current = null;
		double tolerance = 0;
		while (!frontier.isEmpty()) {
			current = frontier.pollFirst();
			if (!visited.contains(current)) {
				visited.add(current);
				if (endKeys.contains(current.key)) {
					System.out.println(taxiKeysMap.get(current.key));
					System.out.println("Found");
					return new aStarResult(current, current.distanceFromStart, parentsMap);
				}
				ArrayList<Connection> neighbors = g1.adj.get(current.key);
				for (int j = 0; j < neighbors.size(); j++) {
					Node neighbor = neighbors.get(j).node;
					if (!visited.contains(neighbor)) {
						minimumDistance = Double.POSITIVE_INFINITY;
						for (Taxi taxi : g1.allTaxis) {
							double distance = Distance.computeDistance(neighbor, taxi.nearestNode);
							if (distance < minimumDistance) {
								minimumDistance = distance;
							}
						}
						double predictedDistance = lambda * minimumDistance;
						double totalDistance = current.distanceFromStart + neighbors.get(j).cost + predictedDistance;
						if (totalDistance < neighbor.fscore) {
							if (totalDistance + tolerance < neighbor.fscore) {
								HashSet<Node> parents = new HashSet<Node>();
								parents.add(current);
								parentsMap.put(neighbor.key, parents);
							} else {
								HashSet<Node> parents = parentsMap.get(neighbor.key);
								parents.add(current);
								parentsMap.put(neighbor.key, parents);
							}
							neighbor.fscore = totalDistance;
							neighbor.distanceFromStart = current.distanceFromStart + neighbors.get(j).cost;
							frontier.add(neighbor);
						} else {
							/* maybe in the tolerance region ? */
							if (totalDistance < neighbor.fscore + tolerance) {
								HashSet<Node> parents = parentsMap.get(neighbor.key);
								parents.add(current);
								parentsMap.put(neighbor.key, parents);
							}
						}
					}
				}
			}
		}
		if (frontier.isEmpty()) {
			System.out.println("Not found");
		}
		return null;
	}
}

class aStarResult {
	public Node taxi;
	public double score;
	public HashMap<Long, HashSet<Node>> routes;

	aStarResult(Node taxi, double score, HashMap<Long, HashSet<Node>> parentsMap) {
		this.taxi = taxi;
		this.score = score;
		this.routes = new HashMap<Long, HashSet<Node>>();
		for (Map.Entry<Long, HashSet<Node>> entry : parentsMap.entrySet()) {
			Long key = entry.getKey();
			HashSet<Node> path = new HashSet<Node>(entry.getValue());
			this.routes.put(key, path);
		}
	}
}

public class Graph {
	public static final String clientPATH = "data/client.csv";
	public static final String nodesPATH = "data/nodes.csv";
	public static final String taxisPATH = "data/taxis.csv";
	public static KmlExport kml = new KmlExport();
	public HashMap<Long, ArrayList<Connection>> adj = new HashMap<Long, ArrayList<Connection>>();
	public static HashMap<List<Double>, Node> hashNodes = new HashMap<List<Double>, Node>();
	/* nodes are the discrete nodes of the graph */
	public ArrayList<Node> nodes;
	/* all noNodes are the nodes of the graph as read from the csv file */
	public ArrayList<Node> allNodes = new ArrayList<Node>();
	public ArrayList<Taxi> allTaxis = new ArrayList<Taxi>();
	private static aStar search = new aStar();

	public void createGraph() throws IOException {
		FileReader fd = new FileReader(nodesPATH);
		CSVParser parser = CSVParser.parse(fd, CSVFormat.RFC4180);
		for (CSVRecord line : parser) {
			long key = line.getRecordNumber();
			double x = Double.parseDouble(line.get(0));
			double y = Double.parseDouble(line.get(1));
			long address = Long.parseLong(line.get(2));
			List<Double> keyList = new ArrayList<Double>();
			keyList.add(x);
			keyList.add(y);
			Node n = hashNodes.get(keyList);
			if (n == null) {
				n = new Node(x, y, key);
				n.addresses.add(address);
				hashNodes.put(keyList, n);
			} else {
				if (n.addresses.contains(address) == false)
					n.addresses.add(address);
			}
			allNodes.add(n);
		}
		fd.close();
		nodes = new ArrayList<Node>(hashNodes.values());
		for (int i = 0; i < allNodes.size() - 1; i++) {
			Node node = allNodes.get(i);
			Node nextNode = allNodes.get(i + 1);
			ArrayList<Connection> nextNodeConnectionList = adj.get(nextNode.key);
			ArrayList<Connection> connectionList = adj.get(node.key);

			if (connectionList == null) {
				connectionList = new ArrayList<Connection>();
			}
			if (nextNodeConnectionList == null) {
				nextNodeConnectionList = new ArrayList<Connection>();
			}
			Boolean flag = false;
			for (long address1 : node.addresses) {
				for (long address2 : nextNode.addresses) {
					if (address1 == address2)
						flag = true;
				}
			}
			if (flag) {
				node.numberOfNeighbors++;
				nextNode.numberOfNeighbors++;
				Connection connection_src = new Connection(node, nextNode);
				Connection connection_dst = new Connection(nextNode, node);
				connectionList.add(connection_src);
				nextNodeConnectionList.add(connection_dst);
			}
			adj.put(node.key, connectionList);
			adj.put(nextNode.key, nextNodeConnectionList);
		}
		System.out.println("Graph created successfully");

	}

	public void createTaxis() throws IOException {
		FileReader fd = new FileReader(taxisPATH);
		CSVParser parser = CSVParser.parse(fd, CSVFormat.RFC4180);
		for (CSVRecord line : parser) {
			double x = Double.parseDouble(line.get(0));
			double y = Double.parseDouble(line.get(1));
			long address = Long.parseLong(line.get(2));
			allTaxis.add(new Taxi(x, y, address, nodes));
		}
	}


	public void run() throws IOException {
		Reader fd = new FileReader(clientPATH);
		CSVParser parser = CSVParser.parse(fd, CSVFormat.RFC4180);
		double x = 0.0;
		double y = 0.0;
		for (CSVRecord line : parser) {
			x = Double.parseDouble(line.get(0));
			y = Double.parseDouble(line.get(1));
		}
		Node clientNode = new Node(x, y, -1);
		Node revisedClientNode = clientNode.findNearestNode(nodes);
		aStarResult result = search.aStarSearch(this, revisedClientNode);
		kml.kmlCreate(result, revisedClientNode, result.taxi, "solution.kml");
		kml.visualizeTaxis(this);
		kml.visualizeClient(revisedClientNode);

	}
}

class Connection {
	public Node node;
	public double cost;

	Connection(Node src, Node dst) {
		this.node = dst;
		this.cost = Distance.computeDistance(src, dst);
	}
}
