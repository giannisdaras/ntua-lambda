//KML Export class
package taxis;
import java.util.*;
import java.io.*;
import java.awt.Color;

class Colors{
	public static ArrayList<String> colors = new ArrayList<String>(Arrays.asList("#black", "#blue", "#red", "#green", "#cyan", "#yellow"));
	public static Iterator<String> it = colors.iterator();
}
class KmlExport {
	public void kmlCreate (aStarResult result, Node startNode, Node endNode, String fileName) {
		Color color;
	    PrintWriter writer = null;
		try {
				// prints path of winner-taxi with alternative routes
				writer = new PrintWriter(fileName);
				writer.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	            writer.println("<kml xmlns=\"http://earth.google.com/kml/2.1\">");
	            writer.println("<Document>");
	            writer.println("<name>Taxi Routes</name>");
	            
	            /* Green line styling */
	            color = Color.green.darker();
	            writer.println("<Style id=\"green\">");
	            writer.println("<LineStyle>");
	            writer.println("<color>" + Integer.toHexString(color.getRGB()) + "</color>");
	            writer.println("<width>4</width>");
	            writer.println("</LineStyle>");
	            writer.println("</Style>");
	            
	            
	            /* black line styling */
	            color = Color.BLACK.darker();
	            writer.println("<Style id=\"black\">");
	            writer.println("<LineStyle>");
	            writer.println("<color>" + Integer.toHexString(color.getRGB()) + "</color>");
	            writer.println("<width>4</width>");
	            writer.println("</LineStyle>");
	            writer.println("</Style>");
	            
	            
	            /* red line styling */
	            color = Color.RED.darker();
	            writer.println("<Style id=\"red\">");
	            writer.println("<LineStyle>");
	            writer.println("<color>" + Integer.toHexString(color.getRGB()) + "</color>");
	            writer.println("<width>4</width>");
	            writer.println("</LineStyle>");
	            writer.println("</Style>");
	            
	            
	            /* blue line styling */
	            color = Color.BLUE.darker();
	            writer.println("<Style id=\"blue\">");
	            writer.println("<LineStyle>");
	            writer.println("<color>" + Integer.toHexString(color.getRGB()) + "</color>");
	            writer.println("<width>4</width>");
	            writer.println("</LineStyle>");
	            writer.println("</Style>");
	            
	            
	            
	            /* cyan line styling */
	            color = Color.cyan.darker();
	            writer.println("<Style id=\"cyan\">");
	            writer.println("<LineStyle>");
	            writer.println("<color>" + Integer.toHexString(color.getRGB()) + "</color>");
	            writer.println("<width>4</width>");
	            writer.println("</LineStyle>");
	            writer.println("</Style>");
	            
	            
	            /* yellow line styling */
	            color = Color.yellow.darker();
	            writer.println("<Style id=\"yellow\">");
	            writer.println("<LineStyle>");
	            writer.println("<color>" + Integer.toHexString(color.getRGB()) + "</color>");
	            writer.println("<width>4</width>");
	            writer.println("</LineStyle>");
	            writer.println("</Style>");
	            
				

			    writer.println("<Placemark>");
			    writer.println("<name> Line " + "</name>");
			    writer.println("<styleUrl>#green</styleUrl>");
			    writer.println("<LineString>");
			    writer.println("<altitudeMode>relative</altitudeMode>");
			    writer.println("<coordinates>");
			    printAllPaths(result, endNode, startNode, writer);
			    writer.println("</coordinates>");
				writer.println("</LineString>");
				writer.println("</Placemark>"); 
				writer.println("</Document>");
				writer.println("</kml>");
	
	} catch (FileNotFoundException e) {
	            System.out.println("File not found");
	        } finally {
	            if (writer != null)
	                writer.close();
	        }
		
		   
	}

	public void printAllPaths(aStarResult result, Node startNode, Node endNode, PrintWriter writer){ 
	        HashSet<Node> isVisited = new HashSet<Node>(); 
	        ArrayList<Node> pathList = new ArrayList<Node>(); 
	        pathList.add(startNode); 
	        printAllPathsUtil(result, startNode, endNode, isVisited, pathList, writer);
	} 
	    
	void printAllPathsUtil(aStarResult result, Node u, Node d, HashSet<Node> isVisited, ArrayList <Node> localPathList, PrintWriter writer) { 
	        isVisited.add(u);
	        if (u.key == d.key) { 
	        	for (int i=0; i<localPathList.size(); i++){
	        		writer.println(localPathList.get(i).x + "," + localPathList.get(i).y);
	        	}    	 
	            isVisited.remove(u); 
	            return ; 
	        } 
	        ArrayList<Node> parents = new ArrayList<Node>(result.routes.get(u.key));
	        for(int j=0; j< parents.size(); j++) { 
	            if (!isVisited.contains(parents.get(j))) { 
	                localPathList.add(parents.get(j));
	                printAllPathsUtil(result, parents.get(j), d, isVisited, localPathList, writer);
	                /* this needs adjustments */
	                if (j!= parents.size() - 1) { 
	                	writer.println("</coordinates>");
	     				writer.println("</LineString>");
	     				writer.println("</Placemark>"); 
	     				/* next line */
	     				writer.println("<Placemark>");
	    			    writer.println("<name> Line " + "</name>");
	    			    String color = "#green";
	    			    if (Colors.it.hasNext()) {
	    			    	color = Colors.it.next();
	    			    }
	    			    writer.println("<styleUrl>" + color + "</styleUrl>");
	    			    writer.println("<LineStyle>");
	    			    writer.println("<color>" + color + "</color>");
	    			    writer.println("</LineStyle>");
	    			    writer.println("<LineString>");
	    			    writer.println("<altitudeMode>relative</altitudeMode>");
	    			    writer.println("<coordinates>");
	                }
	                localPathList.remove(parents.get(j)); 
	            } 
	        } 
	        isVisited.remove(u); 
	} 
	
	public void visualizeGraph(Graph g) throws FileNotFoundException {
		PrintWriter writer = null;
		Color color = Color.GREEN.darker();
		writer = new PrintWriter("graph.kml");
		/* initialization */
		writer.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        writer.println("<kml xmlns=\"http://earth.google.com/kml/2.1\">");
        writer.println("<Document>");
        writer.println("<name>Graph Points</name>");
        
        /* green line styling */
        writer.println("<Style id=\"green\">");
        writer.println("<LineStyle>");
        writer.println("<color>" + Integer.toHexString(color.getRGB()) + "</color>");
        writer.println("<width>4</width>");
        writer.println("</LineStyle>");
        writer.println("</Style>");
       
        
        /* Add points placemarks */
        for (Node node : g.nodes) {
            writer.println("<Placemark>");
    	    writer.println("<name>Client</name>");
    	    writer.println("<Point>");
    	    writer.println("<coordinates>");
    	    writer.println(node.x + "," + node.y);
    	    writer.println("</coordinates>");
    	    writer.println("</Point>");
    	    writer.println("</Placemark>");
        }
        
//      Finish  
		writer.println("</Document>");
		writer.println("</kml>");
		writer.close();
	}
	
	public void getNeighbors(Graph g, long key) throws FileNotFoundException {
		PrintWriter writer = null;
		Color color = Color.GREEN.darker();
		writer = new PrintWriter("neighbors.kml");
		/* initialization */
		writer.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        writer.println("<kml xmlns=\"http://earth.google.com/kml/2.1\">");
        writer.println("<Document>");
        writer.println("<name>Taxi Routes</name>");
        writer.println("<Style id=\"green\">");
        writer.println("<LineStyle>");
        writer.println("<color>" + Integer.toHexString(color.getRGB()) + "</color>");
        writer.println("<width>4</width>");
        writer.println("</LineStyle>");
        writer.println("</Style>");
        
        for (Connection cn : g.adj.get(key)) {
        	Node node = cn.node;
            writer.println("<Placemark>");
      	    writer.println("<name>Client</name>");
      	    writer.println("<Point>");
      	    writer.println("<coordinates>");
      	    writer.println(node.x + "," + node.y);
      	    writer.println("</coordinates>");
      	    writer.println("</Point>");
      	    writer.println("</Placemark>");
        }
        
//      Finish  
		writer.println("</Document>");
		writer.println("</kml>");
		writer.close();
	}
	
	public void visualizeTaxis(Graph g) throws FileNotFoundException {
		PrintWriter writer = null;
		writer = new PrintWriter("taxis.kml");
		/* standard initialization */
		writer.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        writer.println("<kml xmlns=\"http://earth.google.com/kml/2.1\">");
        writer.println("<Document>");
        /* name */
        writer.println("<name>Taxis Placemarks</name>");
        /* style placemark of taxis */
        writer.println("<Style id=\"pushpin\">");
        writer.println("<IconStyle id=\"mystyle\">");
        writer.println("<Icon>");
        writer.println("<href>http://maps.google.com/mapfiles/kml/pushpin/ylw-pushpin.png</href>");
        writer.println("<scale>1.0</scale>");
        writer.println("</Icon>");
        writer.println("</IconStyle>");
        writer.println("</Style>");
        
        /* Add points placemarks */
        for (Taxi taxi : g.allTaxis) {
            writer.println("<Placemark>");
    	    writer.println("<name>Taxi</name>");
    	    writer.println("<styleUrl>#pushpin</styleUrl>");
    	    writer.println("<Point>");
    	    writer.println("<coordinates>");
    	    writer.println(taxi.x + "," + taxi.y);
    	    writer.println("</coordinates>");
    	    writer.println("</Point>");
    	    writer.println("</Placemark>");
        }
        
//      Finish  
		writer.println("</Document>");
		writer.println("</kml>");
		writer.close();
	}
	
	public void visualizeClient(Node client) throws FileNotFoundException {
		PrintWriter writer = null;
		writer = new PrintWriter("client.kml");
		/* standard initialization */
		writer.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
        writer.println("<kml xmlns=\"http://earth.google.com/kml/2.1\">");
        writer.println("<Document>");
        /* name */
        writer.println("<name>Client Placemark</name>");
        writer.println("<Placemark>");
	    writer.println("<name>Client</name>");
	    writer.println("<Point>");
	    writer.println("<coordinates>");
	    writer.println(client.x + "," + client.y);
	    writer.println("</coordinates>");
	    writer.println("</Point>");
	    writer.println("</Placemark>");
		writer.println("</Document>");
		writer.println("</kml>");
        writer.close();
	}

}

