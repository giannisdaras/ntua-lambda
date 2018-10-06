#include <iostream>
#include <vector>
#include <cstring>
#include <fstream>
#include <queue>
#include <tuple>
#include <cstdio>
using namespace std;


char grid[1002][1002];

vector< pair <int,int> > get_neighbors(int i,int j){
	vector < pair <int,int> > g;
	if (grid[i-1][j]!='X'){
		g.push_back(make_pair(i-1,j));
	}
	if (grid[i+1][j]!='X'){
		g.push_back(make_pair(i+1,j));
	}
	if (grid[i][j-1]!='X'){
		g.push_back(make_pair(i,j-1));
	}
	if (grid[i][j+1]!='X'){
		g.push_back(make_pair(i,j+1));
	}
	return g;	
}

int main(int argc, char ** argv){


	// file configuration
	char * file_name;
	if (argc==2){
		file_name=argv[1];
	}
	else{
		return(0);
	}

	FILE * file = fopen(file_name,"r");
	// grid initialization and queue preparation
	queue< pair <int, int> > * last_updated= new queue < pair <int,int>>;
	char * line;
	size_t len=0;
	int N=1;
	int M=1;
	while ( (getline(&line,&len,file) )!=-1){
		if (N==1) M=strlen(line)-1;
		for (int j=0; j<M; j++){
			grid[N][j+1]=line[j];
		}
		N++;
	}
	N=N-1;
	fclose(file);
	for (int j=0; j<=M+1; j++){
		grid[0][j]='X';
		grid[N+1][j]='X';
	}

	for (int i=0; i<=N+1; i++){
		grid[i][0]='X';
		grid[i][M+1]='X';
	}

	for (int i=1; i<=N; i++){
		for (int j=1; j<=M; j++){
			if ( (grid[i][j]=='+') || (grid[i][j]=='-') ){
				last_updated->push(make_pair(i,j));
			}
		}
	}
	bool flagEnd=false;
	bool flagQueue=true;
	int counter=0;
	vector < pair<int,int> >:: iterator it;
	while (!flagEnd && flagQueue){
		counter++;
		queue< pair <int, int> > * last_updated_new = new queue < pair <int,int>>;
		queue< pair<int,int> >  to_update;
		flagQueue=false;
		while (!last_updated->empty()){
			pair <int, int> current= last_updated->front();
			last_updated->pop();
			int i=get<0>(current); int j=get<1>(current); char symbol=grid[i][j];
			vector <pair <int,int> > neighbors=get_neighbors(i,j);
			for (it=neighbors.begin(); it!=neighbors.end(); it++){
				int neighbor_x=get<0>(*it);
				int neighbor_y=get<1>(*it);
				char neighbor_symbol=grid[neighbor_x][neighbor_y];
				if (neighbor_symbol=='.'){
					last_updated_new->push(make_pair(neighbor_x,neighbor_y));
					grid[neighbor_x][neighbor_y]=symbol;
					flagQueue=true;
				}
				else if ( symbol!=neighbor_symbol){
					flagEnd=true;
					to_update.push(make_pair(neighbor_x,neighbor_y));
				}
			} 
		}

		while (!to_update.empty()){
			pair <int, int> pl = to_update.front();
			int n=get<0>(pl);
			int m=get<1>(pl);
			grid[n][m]='*';
			to_update.pop();
		}
		last_updated=last_updated_new;
	}
	if (flagEnd==false){
		cout << "the world is saved" << endl;
		for (int k=1; k<=N; k++){
			for (int l=1; l<=M; l++){
				cout << grid[k][l];
			}
			cout << endl;
		}
		
	}
	else{
		cout << counter << endl;
		for (int k=1; k<=N; k++){
			for (int l=1; l<=M; l++){
				cout << grid[k][l];
			}
			cout << endl;
		}
	}

}