#include <iostream>
#include <random>
#include <vector>
#include <algorithm>
using namespace std;
typedef long long ll;

mt19937 rng;
int *arr;
int N;


int main(void){

  N = 5;
  while(1){
    rng.seed(random_device()());
    uniform_int_distribution<mt19937::result_type> rr(1,100);
    arr = (int *) malloc (N * sizeof(int));
    int maxim = 0;
    int maxim_index = 0;
    for (int i=0; i<N; i++){
      arr[i] = rr(rng);
    }
    int results[N];
    for (int i=0; i<N; i++){
      int curr_sum = arr[i];
      int curr_max = arr[i];
      for (int j=i-1; j>=0; j--){
        if (arr[j] > curr_max){
          curr_max = arr[j];
        }
        curr_sum += curr_max;
      }
      curr_max = arr[i];
      for (int j=i+1; j<N; j++){
        if (arr[j] > curr_max){
          curr_max = arr[j];
        }
        curr_sum += curr_max;
      }
      results[i] = curr_sum;
    }
    int minim_index = 0;
    int minim = results[0];
    for (int i=0; i<N; i++){
      if (results[i] < minim){
        minim = results[i];
        minim_index = i;
      }
    }
    if (minim != builder(0, N-1)){
      for (int i=0; i<N; i++){
        cout << arr[i] << " ";
      }
      cout << endl;
      cout << minim << endl;
      return 0;
    }
  }


}
