#include <iostream>
using namespace std;
#include <vector>

int main(void){
  vector<int> arr;
  int T;
  cin >> T;
  for (int t=0; t<T; t++){
    int flag = 1;
    int N; cin >> N;
    vector<int> initial;
    vector<int> goal;
    for (int i=0; i<N; i++){
      int tmp; cin >> tmp;
      initial.push_back(tmp);
    }
    for (int i=0; i<N; i++){
      int tmp; cin >> tmp;
      goal.push_back(tmp);
    }
    for (int i=0; i<N-2; i++){
      if (initial[i] < goal[i]){
        int diff = goal[i] - initial[i];
        initial[i] = initial[i] + diff;
        if (i+1<N){
          initial[i+1] = initial[i+1] + 2*diff;
        }
        if (i+2 < N){
          initial[i+2] = initial[i+2] + 3*diff;
        }
      }
      else if (initial[i] > goal[i]){
        flag = 0;
        break;
      }
    }

    for (int i=0; i<N; i++){
      if (initial[i] != goal[i]){
        flag = 0;
        break;
      }
    }

    if (flag == 1){
      cout << "TAK" << endl;
    }
    else{
      cout << "NIE" << endl;
    }
  }
}
