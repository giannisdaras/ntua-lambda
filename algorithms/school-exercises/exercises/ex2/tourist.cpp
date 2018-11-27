#include <iostream>
#include <algorithm>
#include <vector>
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
  // thewroume sortarismena anamnistika apo to fthinotero sto akrivotero
  for (int j=0; j<K; j++){
    for (int c=0; c<=C; c++){
      if (c > values[0][j]){
        DP[0][j][c] = emotions[0][j];
      }
      else{
        DP[0][j][c] = 0;
      }
    }
  }
  for (int i=1; i<N; i++){
    for (int j=0; j<K; j++){
      for (int c=0; c<=C; c++){
        if (j == 0 && c >= values[i][j]) DP[i][j][c] = emotions[i][j] + DP[i-1][K-1][c-values[i][j]];
        else if (j==0 && c<values[i][j]) DP[i][j][c] = DP[i-1][K-1][c - values[i][j]];
        else if (c<values[i][j]) DP[i][j][c] = DP[i][j-1][c];
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
