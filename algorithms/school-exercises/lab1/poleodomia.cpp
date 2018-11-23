#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
typedef long long ll;
const int size = 1000000;
ll arr[size];
ll costs_left[size];
ll costs_right[size];
ll total_costs[size];
int main(void){
  int N;
  cin >> N;
  for (int i=0; i<N; i++){
    cin >> arr[i];
  }
  costs_left[0] = arr[0];
  for (int i=1; i<N; i++){
    ll j;
    for (j=i-1; j>=0; j--){
      if (arr[i] <= arr[j]){
        costs_left[i] = costs_left[j] + (i-j)*arr[i];
        break;
      }
    }
    if (j == -1){
      costs_left[i] = arr[i]*(i+1);
    }
  }
  costs_right[N-1] = arr[N-1];
  for (int i=N-2; i>=0; i--){
    int j;
    for (j = i+1; j<N; j++){
      if (arr[i] <= arr[j]){
        costs_right[i] = costs_right[j] + (j-i)*arr[i];
        break;
      }
    }
    if (j==N){
      costs_right[i] = arr[i]*(N-i);
    }
  }
  total_costs[0] = costs_left[0] + costs_right[0] - arr[0];
  ll minim = total_costs[0];
  int index = 0;
  for (int i=1; i<N; i++){
    total_costs[i] = costs_left[i] + costs_right[i] - arr[i];
    if (total_costs[i] < minim){
      index = i;
      minim = total_costs[i];
    }
  }
  cout << minim << endl;

}
