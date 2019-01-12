#include <iostream>
#include<tuple>
#include<vector>
#include <unordered_map>
#include <algorithm>
#include <map>
#define NIL -1
using namespace std;


bool flag = false;
int readint() {
  int n = 0;
  char c = getchar_unlocked();
  while ( !( '0' <= c && c <= '9' ) ) c = getchar_unlocked();
  while ( '0' <= c && c <= '9' ) {
    n = n * 10 + c - '0';
    c = getchar_unlocked();
  }
  return n;
}

/* util function for tuples comparison */
bool comparator (tuple<int, int, int> a, tuple<int, int, int> b) {
  return (get<2>(a) < get<2>(b));
}


/* Map has not implemented hash function for tuples, so let's create our own */
struct tuple_hash {
    template <class T1, class T2, class T3>
    size_t operator() (const tuple<T1, T2, T3> &p) const {
        auto h1 = hash<T1>{}(get<0>(p));
        auto h2 = hash<T2>{}(get<1>(p));
        auto h3 = hash<T3>{}(get<2>(p));
        return h1 ^ h2 ^ h3;
    }
};


class MultiGraph{
public:
  unordered_map<int, vector<int>> adj;
  unordered_map<int, bool> visited;
  unordered_map<int, int> parent;
  unordered_map<int, int> disc;
  unordered_map<int, int> low;
  int total_bridges = 0;

  void addEdge(int u, int v){
    visited[u] = false;
    visited[v] = false;
    parent[u] = NIL;
    parent[v] = NIL;
    if (adj.find(u) == adj.end()){
      adj[u] = vector<int>();
    }
    if (adj.find(v) == adj.end()){
      adj[v] = vector<int>();
    }
    adj[u].push_back(v);
    adj[v].push_back(u);
  }

  void printNeighbors(){
    for (pair<int, vector<int>> elem : adj){
      cout << "Neighbors of elem " << elem.first << endl;
      vector<int> neighbors = elem.second;
      for (vector<int>::iterator it=neighbors.begin(); it!=neighbors.end(); it++){
        cout << *it << " ";
      }
      cout << endl;
    }
  }



  int find_bridges() {
    for (pair<int, vector<int>> elem : adj){
        int i = elem.first;
        if (visited.at(i) == false){
            bridge_util(i);
        }
    }
    return total_bridges;
  }

  int bridge_util(int u){
    static int time = 0;
    visited[u] = true;
    disc[u] = low[u] = ++time;
    vector<int> neighbors = adj.at(u);
    for (vector<int>::iterator it = neighbors.begin(); it!=neighbors.end(); it++){
      int neighbor = *it;
      if (!visited.at(neighbor)){
        parent[neighbor] = u;
        bridge_util(neighbor);
        low[u] = min(low.at(u), low.at(neighbor));
        if (low.at(neighbor) > disc.at(u)){
          int count = 0;
          for (vector<int>::iterator it2 = adj.at(u).begin(); it2!=adj.at(u).end(); it2++){
            if (*it2 == neighbor){
              count++;
            }
          }
          if (count == 1) total_bridges++;
        }
      }
      else if (neighbor != parent[u]) low[u] = min(low[u], disc[neighbor]);
    }
  }


};


class Graph{
public:
    int V;
    int E;
    int yes;
    int no;
    int maybe;
    vector<tuple<int, int, int>> edges;
    /* edges semantics: the edges of the graph */
    vector<tuple<int, int, int>>::iterator tuple_it;
    vector<pair<int, int>>::iterator pair_it;
    map<int, vector<pair<int, int>>> ties;
    /* ties semantics:
        key is the edge cost and there is a vector of the edges it connects.
    */

    vector<int> parents;
    /* parents semantics:
      used for union-find algorithm for MSTs
    */
    vector<int> rank;
    /*
      rank semantics:
        the node rank
    */

    Graph(int V, int E){
      this->V = V;
      this->E = E;
      yes = 0;
      no = 0;
      maybe = 0;
      for (int i=0; i<V; i++){
        parents.push_back(i);
        rank.push_back(0);
      }
    }
    void addEdge(tuple<int, int, int> edge){
      edges.push_back(edge);
      int v1 = get<0>(edge);
      int v2 = get<1>(edge);
      int cost = get<2>(edge);
    }


    int find_path_compression(int i){
      if (i == parents[i]) {
        return i;
      }
      parents[i] = find_path_compression(parents[i]);
      return parents[i];
    }



    void union_by_rank(int i, int j){
      int i_root = find_path_compression(i);
      int j_root = find_path_compression(j);
      if (rank[i_root] < rank[j_root]){
        parents[i_root] = j_root;
      }
      else if (rank[i_root] > rank[j_root]){
        parents[j_root] =  i_root;
      }
      else{
        /* equal ranks */
        parents[j_root] = i_root;
        rank[i_root]++;
      }
    }



    void print_edge(tuple<int, int, int> edge){
      int v1 = get<0>(edge);
      int v2 = get<1>(edge);
      int cost = get<2>(edge);
      cout << "Edge: " << v1 << " " << v2 <<  " " << cost << endl;
    }


    void kruskal(){
      int total_edges = 0;
      sort(edges.begin(), edges.end(), comparator);
      for (tuple_it = edges.begin(); tuple_it != edges.end(); tuple_it++){
          int v1 = get<0>(*tuple_it);
          int v2 = get<1>(*tuple_it);
          int cost = get<2>(*tuple_it);
          ties[cost].push_back(make_pair(v1, v2));
      }
      for (pair<int, vector<pair<int, int>>> elem : ties){
        int edge_cost = elem.first;
        vector<pair<int, int>> vertices = elem.second;
        MultiGraph h;
        for (pair_it=vertices.begin(); pair_it!=vertices.end(); pair_it++){
          int v1 = pair_it->first;
          int v2 = pair_it->second;
          int parent1 = find_path_compression(v1);
          int parent2 = find_path_compression(v2);
          if (parent1 == parent2){
            no += 1;
          }
          else{
            h.addEdge(parent1, parent2);
          }
        }
        yes += h.find_bridges();

        for (pair_it=vertices.begin(); pair_it!=vertices.end(); pair_it++){
          int v1 = pair_it->first;
          int v2 = pair_it->second;
          int parent1 = find_path_compression(v1);
          int parent2 = find_path_compression(v2);
          if (parent1 != parent2) union_by_rank(v1, v2);
        }

      }
    }

    void count_edges(){
      cout << yes << endl;
      cout << no << endl;
      cout << E - (yes + no) << endl;
    }

    void test_bridges(){
      MultiGraph h;
      h.addEdge(0, 1);
      h.addEdge(1, 3);
      h.addEdge(0, 3);
      h.addEdge(1, 2);
      h.addEdge(2, 3);
      h.addEdge(2, 1);
      h.addEdge(3, 0);
      h.addEdge(3, 4);
      // h.addEdge(2, 4);

      // h.addEdge(0, 2);
      // h.addEdge(2, 1);
      // h.addEdge(0, 3);
      // h.addEdge(3, 4);
      cout <<  h.find_bridges() << endl;

    }





};


int main(void){
  // Graph g(10, 10);
  // g.test_bridges();
  int V, E;
  V = readint();
  E = readint();
  Graph g(V, E);
  for (int i=0; i<E; i++){
    int v1, v2, cost;
    v1 = readint();
    v2 = readint();
    cost = readint();
    v1 = v1 - 1;
    v2 = v2 - 1;
    g.addEdge(make_tuple(v1, v2, cost));
  }
  g.kruskal();
  g.count_edges();
}
