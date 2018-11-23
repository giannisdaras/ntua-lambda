#include <iostream>
using namespace std;
#include <vector>

int main(void){
  int T;
  cin >> T;
  vector<int> arr;
  for (int t=0; t<T; t++){
    int N;
    cin >> N;
    arr.clear();
    for (int i=0; i<N; i++){
      int tap; cin >> tap;
      arr.push_back(tap);
    }
    int index = 0; // mexri poios to xerei
    int step = arr[0]; // posoi tha to mathoun tin epomeni mera
    int days = 0; // poses meres exoun perasei

    while (index <= N-1){
      index = index + step;
      days++;
      int to_add = 0;
      for (int i=index; i<min(index+step, N); i++){
          to_add += arr[i];
      }
      step += to_add; // to step gia tin epomeni mera
    }
    cout << days << endl;

  }

}
