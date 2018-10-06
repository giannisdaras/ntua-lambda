import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Collections;



public class Pistes{
	public static void main(String[] args){
		Game g=new Game(args[0]);

	}
}


class Game{
	public ArrayList<Player> game= new ArrayList<Player>();
	public Game(String fileName){
		FileProcesser(fileName);
	}
	public void FileProcesser(String fileName){
		String line = null;
		int counter=0;
	    try{    	
	        FileReader fileReader = new FileReader(fileName);
	        BufferedReader bufferedReader = new BufferedReader(fileReader);
	        ArrayList<Integer> freeKeys= new ArrayList<Integer>();
	        ArrayList<Integer> initialIds= new ArrayList<Integer>();
	        int freeStars=0;
	        while((line = bufferedReader.readLine()) != null) {
	        	if (counter!=0){
	        		String[] splitLine= line.split(" ");
	        		ArrayList<Integer> numbers= new ArrayList<Integer>();
	        		for (String i : splitLine){
	        			numbers.add(Integer.parseInt(i));
	        		}
	        		int amountOfKeysNeeded=numbers.get(0);
	        		int amountOfKeysGives=numbers.get(1);
	        		int amountOfStarsGives=numbers.get(2);
	        		if (amountOfKeysNeeded==0) {
	        			for (int i=3; i<3+amountOfKeysGives; i++){
		        			freeKeys.add(numbers.get(i));
		        		}
		        		freeStars+=amountOfStarsGives;
		        		initialIds.add(counter);
	        		}
	        		else{
	        			ArrayList<Integer> keysNeeded= new ArrayList<Integer>();
		        		ArrayList<Integer> keysGives= new ArrayList<Integer>();
		        		for (int i=3; i<3+amountOfKeysNeeded; i++){
		        			keysNeeded.add(numbers.get(i));

		        		}
		        		for (int i=3+amountOfKeysNeeded; i<3+amountOfKeysNeeded+amountOfKeysGives; i++){
		        			keysGives.add(numbers.get(i));
		        		}
		        		game.add(new Player(keysNeeded,keysGives,amountOfStarsGives,counter-1));	
	        		}
	        		
	        	}
	        	counter++;
	        } 
	        bufferedReader.close(); 
	        run(freeKeys,freeStars,initialIds);   
	    }
	    catch(FileNotFoundException ex) {
	        return;                
	    }
	    catch(IOException ex) {
	    	return;               
	    }
	}

	public void run(ArrayList<Integer> initialKeys,int freeStars, ArrayList<Integer> initialIds){
		int maxim=0;
		ArrayList<Path> myQueue=new ArrayList<Path>();
		HashMap<ArrayList<Integer>,Integer> myHashMap= new HashMap<ArrayList<Integer>,Integer>();
		myQueue.add(new Path(game,initialKeys,freeStars,initialIds,myHashMap));
		while(!myQueue.isEmpty()){
			Path pathImage=myQueue.get(0);
			myQueue.remove(0);
			myHashMap=pathImage.createChildren();
			if (pathImage.totalStars>maxim){
				maxim=pathImage.totalStars;
			}
			for (Path pathChild: pathImage.children){
				myQueue.add(pathChild);
			}
		}
		System.out.println(maxim);
		return;

	}
}

class Player{
	public int id;
	public int totalStars;
	public ArrayList<Integer> keysNeeded;
	public ArrayList<Integer> keysGives;
	public Player(ArrayList<Integer> keysNeeded, ArrayList<Integer> keysGives,int totalStars,int id){
		this.keysNeeded=keysNeeded;
		this.keysGives=keysGives;
		this.totalStars=totalStars;
		this.id=id;
	}
}

class Path{
	ArrayList<Player> availablePlayers;
	ArrayList<Integer> availableKeys;
	int totalStars;
	ArrayList<Path> children;
	ArrayList<Integer> ids;
	HashMap<ArrayList<Integer>,Integer> myHashMap;

	public Path(ArrayList<Player> availablePlayers, ArrayList<Integer> availableKeys,int totalStars, ArrayList<Integer> ids,HashMap<ArrayList<Integer>,Integer> myHashMap){
		this.availablePlayers=availablePlayers;
		this.myHashMap=myHashMap;
		this.availableKeys=availableKeys;
		this.totalStars=totalStars;
		this.ids=ids;
		children=new ArrayList<Path>();
	}

	public HashMap<ArrayList<Integer>,Integer> createChildren(){
		for (Player tmp: availablePlayers){
			boolean flag=true;
			ArrayList<Integer> copyOfAvailableKeys=new ArrayList<Integer>();
			for (int key: availableKeys){
				copyOfAvailableKeys.add(key);
			}
			for (int key: tmp.keysNeeded){
				if (copyOfAvailableKeys.contains(key)){
					copyOfAvailableKeys.remove(copyOfAvailableKeys.indexOf(key));
				}
				else{
					flag=false;
					break;
				}
			}
			if (flag==true){
				ArrayList<Integer> copyOfMyIds= new ArrayList<Integer>();
				for (int tmpId: ids){
					copyOfMyIds.add(tmpId);
				}
				copyOfMyIds.add(tmp.id);
				ArrayList<Player> copyOfAvailablePlayers= new ArrayList<Player>();
				int copyOfTotalStars=totalStars+tmp.totalStars;
				for (Player pl: availablePlayers){
					if (pl.id!=tmp.id){
						copyOfAvailablePlayers.add(pl);
					}
				}
				for (int key: tmp.keysGives){
					copyOfAvailableKeys.add(key);
				}
				Collections.sort(copyOfMyIds);
				if (! myHashMap.containsKey(copyOfMyIds)){
					myHashMap.put(copyOfMyIds,1);
					children.add(new Path(copyOfAvailablePlayers,copyOfAvailableKeys,copyOfTotalStars,copyOfMyIds,myHashMap));
				}
			}
		}
		return myHashMap;
	}
}