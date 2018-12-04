#include <iostream>
#include <algorithm>
#include <vector>
#include <climits>
using namespace std;
const int max_num = 1e6;

int main(void){
  int N, Q;
  cin >> N >> Q;
  int q[N];
  int start;
  for (int i=0; i<N; i++){
    cin >> q[i];
  }
  cin >> start;

  int DP[N][Q+1];

  for (int i=0; i<N; i++){
    for (int j=0; j<=Q; j++){
      DP[i][j] = max_num;
    }
  }
  for (int i=0; i<N; i++){
    for (int j=0; j<=Q; j++){
      if (Q-j <= q[i]){
        DP[i][j] = 0;
      }
    }
  }

  for (int i=N-1; i>=0; i--){
    for (int j=Q; j>=0; j--){
      if (DP[i][j] == max_num){
        for (int k=0; k<N; k++){
          if (k!=i && q[k] > q[i]){
            int upper_limit = min(j+q[i], Q);
            if (DP[k][upper_limit] + abs(i-k) < DP[i][j]){
              DP[i][j] = DP[k][upper_limit] + abs(i-k);
            }
          }
        }
      }
    }
  }

  int min = max_num;
  for (int i=0; i<N; i++){
    if (DP[i][0] + abs(start -i ) < min){
      min = DP[i][0] + abs(start - i);
    }
  }
  cout << min << endl;

}
