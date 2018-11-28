#include <iostream>
#include <algorithm>
#include <vector>
#include <limits.h>
using namespace std;

int main(void){
  int N, K, C;
  cin >> N >> K >> C;
  int values[N][K];
  int emotions[N][K];
  for (int i=0; i<N; i++){
    for (int j=0; j<K; j++){
      cin >> values[i][j];
      cin >> emotions[i][j];
    }
  }

  int DP[N][K][C+1];

  for (int j=0; j<K; j++){
    for (int c=0; c<=C; c++){
      if (c >= values[0][j]){
        DP[0][j][c] = emotions[0][j];
      }
      else{
        DP[0][j][c] = DP[0][j-1][c];
      }
    }
  }
  for (int i=1; i<N; i++){
    for (int j=0; j<K; j++){
      for (int c=0; c<=C; c++){
        // an eisai sto 0 kai exeis lefta parto kai des allo provlima
        if (j == 0 && c >= values[i][j]) DP[i][j][c] = emotions[i][j] + DP[i-1][K-1][c-values[i][j]];
        // an eisai sto 0 kai den exeis lefta, eisai doomed case.
        else if (j==0 && c<values[i][j]) DP[i][j][c] = INT_MIN;
        // an den mporeis na to pareis, dokimase na pareis kapoio fthinotero.
        else if (c<values[i][j]) DP[i][j][c] = DP[i][j-1][c];
        // an mporeis na to pareis, des an se simferei na to pareis.
        else DP[i][j][c] = max(DP[i-1][K-1][c - values[i][j]] + emotions[i][j], DP[i][j-1][c]);

      }
    }
  }
  // cout << "Lisi" << endl;
  cout << DP[N-1][K-1][C] << endl;
  // for (int i=0; i<N; i++){
  //   cout << "Nea xwra" << endl;
  //   for (int j=0; j<K; j++){
  //     for (int c=0; c<=C; c++){
  //       cout << DP[i][j][c] << " ";
  //     }
  //     cout << endl;
  //   }
  // }
}
