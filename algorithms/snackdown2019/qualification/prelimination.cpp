#include <iostream>
using namespace std;
#include <algorithm>
#include <vector>

int main(void){
  int T;
  cin >> T;
  for (int t=0; t<T; t++){
    int teams, threshold;
    int counter = 0;
    cin >> teams >> threshold;
    vector<int> arr;
    for (int i=0; i<teams; i++){
      int val;
      cin >> val;
      arr.push_back(val);
    }
    make_heap(arr.begin(), arr.end());
    int max_holder = 0;
    for (int i=0; i<threshold; i++){
      max_holder = arr.front();
      pop_heap(arr.begin(), arr.end());
      arr.pop_back();
    }
    counter = threshold;
    while (arr.size()!=0 && max_holder == arr.front()){
      counter++;
      pop_heap(arr.begin(), arr.end());
      arr.pop_back();
    }
    cout << counter << endl;
    arr.clear();
  }
}
