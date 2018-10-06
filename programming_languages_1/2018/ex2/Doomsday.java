import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;

public class Doomsday{
	public static void main(String[] args){
		Game gameInst= new Game(args[0]);
	}
}


class Tuple{
	public int x,y;
	public Tuple(int x,int y){
		this.x=x;
		this.y=y;
	}
}
class Game{
	public char[][] grid= new char[1002][1002];
	public String fileName=null;
	public int N=0;
	public int M=0;
	public Game(String fileName){
		this.fileName=fileName;
		this.fileProcesser();
		this.run();
	}

	public void run(){
		ArrayList<Tuple> last_updated=new ArrayList<Tuple>();
		for (int i=1; i<=N; i++){
			for (int j=1; j<=M; j++){
				if (grid[i][j]=='+' || grid[i][j]=='-'){
					last_updated.add(new Tuple(i,j));
				}
			}
		}
		boolean flagQueue=true;
		boolean flagEnd=false;
		int counter=0;
		while (!flagEnd && flagQueue){
			counter++;
			ArrayList<Tuple> last_updated_new= new ArrayList<Tuple>();
			ArrayList<Tuple> to_update= new ArrayList<Tuple>();
			flagQueue=false;
			while (! last_updated.isEmpty()	){
				Tuple current= last_updated.get(0);
				last_updated.remove(0);
				int i=current.x; 
				int j=current.y; 
				char symbol=grid[i][j];
				ArrayList<Tuple> neighbors=getNeighbors(i,j);
				Iterator<Tuple> it=neighbors.iterator();
				while(it.hasNext()){
					Tuple temp=it.next();
					int neighbor_x=temp.x;
					int neighbor_y=temp.y;
					char neighbor_symbol=grid[neighbor_x][neighbor_y];
					if (neighbor_symbol=='.'){
						last_updated_new.add(new Tuple(neighbor_x,neighbor_y));
						grid[neighbor_x][neighbor_y]=symbol;
						flagQueue=true;
					}
					else if ( symbol!=neighbor_symbol){
						flagEnd=true;
						to_update.add(new Tuple(neighbor_x,neighbor_y));
					}
				} 
			}

			while (!to_update.isEmpty()){
				Tuple pl=to_update.get(0);
				to_update.remove(0);
				int n=pl.x;
				int m=pl.y;
				grid[n][m]='*';
			}
			last_updated=last_updated_new;
		}
		if (flagEnd==false){
			System.out.println("the world is saved");
			for (int k=1; k<=N; k++){
				for (int l=1; l<=M; l++){
					System.out.print(grid[k][l]);
				}
				System.out.println();
			}
			
		}
		else{
			System.out.println(counter);
			for (int k=1; k<=N; k++){
				for (int l=1; l<=M; l++){
					System.out.print(grid[k][l]);
				}
				System.out.println();
			}
		}

		return;
	}

	public void fileProcesser(){
		String line = null;
	    try{    	
	        FileReader fileReader = new FileReader(fileName);
	        BufferedReader bufferedReader = new BufferedReader(fileReader);
	        while((line = bufferedReader.readLine()) != null) {
	        	if (N==0){
	        		this.M=line.length();
	        	}
	        	for (int j=1; j<=this.M; j++){
	        		grid[N+1][j]=line.charAt(j-1);
	        	}
	        	N++;
	        } 
	        bufferedReader.close(); 
	        for (int j=0; j<=this.M+1; j++){
				this.grid[0][j]='X';
				this.grid[this.N+1][j]='X';
			}
			for (int i=0; i<=this.N+1; i++){
				grid[i][0]='X';
				grid[i][this.M+1]='X';
			}        
	    }
	    catch(FileNotFoundException ex) {
	        return;                
	    }
	    catch(IOException ex) {
	    	return;               
	    }
	}

	public ArrayList<Tuple> getNeighbors(int i,int j){
		ArrayList<Tuple> g=new ArrayList<Tuple>();
		if (grid[i-1][j]!='X'){
			g.add(new Tuple(i-1,j));
		}
		if (grid[i+1][j]!='X'){
			g.add(new Tuple(i+1,j));
		}
		if (grid[i][j-1]!='X'){
			g.add(new Tuple(i,j-1));
		}
		if (grid[i][j+1]!='X'){
			g.add(new Tuple(i,j+1));
		}
		return g;
	}
}



    

