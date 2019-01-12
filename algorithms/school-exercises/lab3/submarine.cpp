#include <iostream>
#include <unordered_map>
#include <algorithm>
#include <utility>
#include <functional>
#include <vector>
#include <stdexcept>
using namespace std;
/*
Semantics for input:
N, M: grid
K: the number of pilots
X: the maximum number of pilots for a path
*/
int N, M, K, X;
int grid[180][180];
long long MOD_CONSTANT = 1000000103;

/* Map has not implemened hash function for pairs, so let's create our own */
struct pair_hash {
    template <class T1, class T2>
    size_t operator () (const pair<T1,T2> &p) const {
        auto h1 = hash<T1>{}(p.first);
        auto h2 = hash<T2>{}(p.second);
        return h1 ^ h2;
    }
};

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

vector<pair<int, int>> get_neighbors(int i, int j){
  vector<pair<int, int>> neighbors;
  if (i<0 || i>=N || j<0 || j>=M){
    throw invalid_argument("You are pushing too far!");
  }
  if (grid[i][j] == -1){
    throw invalid_argument("This is an unexplored region captain!");
  }
  if (grid[i][j] == 1){
    throw invalid_argument("You missed a pilot stupid!");
  }
  if (i!=0){
    neighbors.push_back(make_pair(i-1, j));
  }
  if (j!=0){
    neighbors.push_back(make_pair(i, j-1));
  }
  return neighbors;
}

/* Semantics for maps
pilot: check whether a position is a beginning of a pilot
explored: check whether the state is explored
*/
unordered_map <pair<int, int>, pair<int, int>, pair_hash> pilot;
unordered_map<pair<int, int>, pair<int, int>, pair_hash>::iterator map_it;
unordered_map<tuple<int, int, int>, long long, tuple_hash> explored;
unordered_map<tuple<int, int, int>, long long, tuple_hash>::iterator explored_it;


long long explore(int i, int j, int B){


  if (i==0 & j==0 & B>=0){
    /* reached the target */
    explored[make_tuple(i, j, B)] = 1;
    return 1;
  }
  if (grid[i][j] == 1 && B <= 0){
    /* game over */
    explored[make_tuple(i, j, B)] = 0;
    return 0;
  }
  if (explored.find(make_tuple(i, j, B)) != explored.end()){
    /* if we are in an explored state, there is no need to search again */
    return explored.at(make_tuple(i, j, B));
  }
  else{
    long long res = 0;
    /* if we are here, we are on an unexplored state */
    if (grid[i][j] == 1){
        /* pilot */
        pair<int, int> dst = pilot.at(make_pair(i, j));
        int dst_i, dst_j;
        dst_i = dst.first;
        dst_j = dst.second;
        res = explore(dst_i, dst_j, B-1) % MOD_CONSTANT;
    }
    else{
      vector <pair<int, int>> neighbors = get_neighbors(i, j);
      vector<pair<int, int>>::iterator it;
      for (it = neighbors.begin(); it!=neighbors.end(); it++){
        int neighbor_i = (*it).first;
        int neighbor_j = (*it).second;
        long tmp = explore(neighbor_i, neighbor_j, B);
        res += tmp % MOD_CONSTANT;
      }
    }
    explored[make_tuple(i, j, B)] = res % MOD_CONSTANT;
    return res % MOD_CONSTANT;
  }

}




int main(void){
  /*
  Semantics for grid:
  -1: does not belong to grid
  0: belongs to grid and it's not a pilot
  1: it is a pilot
  */
  for (int i=0; i<180; i++){
    for (int j=0; j<180; j++){
      grid[i][j] = -1;
    }
  }
  cin >> N >> M >> K >> X;
  for (int i=0; i<N; i++){
    for (int j=0; j<M; j++){
      grid[i][j] = 0;
    }
  }
  for (int i=0; i<K; i++){
    long long s, e;
    cin >> s >> e;
    int origin_i, origin_j, dst_i, dst_j;
    origin_i = s/M;
    origin_j = s % M;
    dst_i = e / M;
    dst_j = e % M;
    grid[origin_i][origin_j] = 1;
    pilot[make_pair(origin_i, origin_j)] = make_pair(dst_i, dst_j);
  }
  cout << explore(N-1, M-1, X) << endl;
  // for (int i=0; i<N; i++){
  //   for (int j=0; j<M; j++){
  //     if (explored.find(make_pair(i, j)) == explored.end()){
  //       cout << i << " " << j << " not explored" << endl;
  //     }
  //     else{
  //       cout << explored.at(make_pair(i,j)) << " ";
  //     }
  //   }
  //   cout << endl;
  // }


}
