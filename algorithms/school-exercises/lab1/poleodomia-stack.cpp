#include <iostream>
#include <vector>
#include <stack>
#include <algorithm>
#include <iterator>
using namespace std;
typedef long long ll;
ll arr[1000000];
ll costs_left[1000000];
ll costs_right[1000000];
ll total_costs[1000000];
int main(void){
  int N;
  cin >> N;
  for (int i=0; i<N; i++){
    cin >> arr[i];
  }
  stack < pair<ll, ll> > st1;
  stack <ll> costs1;
  costs1.push(arr[0]);
  st1.push(make_pair(arr[0], 1));
  costs_left[0] = arr[0];
  for (int i=1; i<N; i++){
    int counter = 1;
    while (!st1.empty()){
      pair <ll, ll> stack_head = st1.top();
      ll current_cost = costs1.top();
      if (arr[i] < stack_head.first){
        costs_left[i] = current_cost + counter * arr[i];
        st1.push(make_pair(arr[i], counter));
        costs1.push(costs_left[i]);
        break;
      }
      else{
        counter += stack_head.second;
        st1.pop();
        costs1.pop();
      }

    }
    if (st1.empty()){
      costs_left[i] = counter * arr[i];
      st1.push(make_pair(arr[i], counter));
      costs1.push(costs_left[i]);
    }
  }

  stack < pair<ll, ll> > st2;
  stack <ll> costs2;
  costs2.push(arr[N-1]);
  st2.push(make_pair(arr[N-1], 1));
  costs_right[N-1] = arr[N-1];
  for (int i=N-2; i>=0; i--){
    int counter = 1;
    while (!st2.empty()){
      pair <ll, ll> stack_head = st2.top();
      ll current_cost = costs2.top();
      if (arr[i] < stack_head.first){
        costs_right[i] = current_cost + counter * arr[i];
        st2.push(make_pair(arr[i], counter));
        costs2.push(costs_right[i]);
        break;
      }
      else{
        counter += stack_head.second;
        st2.pop();
        costs2.pop();
      }
    }
    if (st2.empty()){
      costs_right[i] = counter * arr[i];
      st2.push(make_pair(arr[i], counter));
      costs2.push(costs_right[i]);
    }
  }
  ll minim = costs_left[0] + costs_right[0] - arr[0];
  for (int i=0; i<N; i++){
    total_costs[i] = costs_left[i] + costs_right[i] - arr[i];
    if (total_costs[i] < minim){
      minim = total_costs[i];
    }
  }
  cout << minim << endl;


}
