#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int main(void){
  int N;
  cin >> N;
  pair<int, int> *keraies = new pair<int, int>[N+1];
  for (int i=1; i<=N; i++){
    int t, r;
    cin >> t >> r;
    keraies[i] = make_pair(t, r);
  }

  int DP[N+1][N/2+1];
  // i: poia keraia exetazw
  // j: posous receivers exei dexia tis
  for (int i=1; i<=N; i++){
    for (int j=N/2; j>=0; j--){
      /* base case */
      if (i==1 && j == N/2) DP[i][j] = keraies[1].first;
      /* penalize wrong cases */
      else if (i==1) DP[i][j] = 1e6;
      else{
        /* an exei N/2 receivers dexia tote tha einai sigoura pompos */
        if (j==N/2) DP[i][j] = keraies[i].first + DP[i-1][j];
        /* an exei 0 receivers dexia tote tha einai sigoura dektis */
        else if (j==0) DP[i][j] = keraies[i].second + DP[i-1][j+1];
        /* se diaforetiki periptwsi mporei na einai eite pompos, eite dektis */
        else DP[i][j] = min(keraies[i].first + DP[i-1][j], keraies[i].second + DP[i-1][j+1]);
      }
    }
  }

  cout << DP[N][0] << endl;
}
