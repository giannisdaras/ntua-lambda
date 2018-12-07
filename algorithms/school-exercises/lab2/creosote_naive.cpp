#include <iostream>
#include <climits>
#include <math.h>
#include <cstdio>
using namespace std;
const int MAX_LEN = 100000;
long long arr[MAX_LEN];
long long sums[MAX_LEN];
long long DP[MAX_LEN];
long long a, b, c;

long long compute_value(long long x){
  return a*pow(x, 2) + b*x + c;
}

int main(void){
  int N;
  cin >> N >> a >> b >> c;
  sums[0] = 0;
  long long x;
  for (int i=1; i<=N; i++){
    scanf("%lld", &x);
    sums[i] = sums[i-1] + x;
  }
  DP[0] = 0;
  DP[1] = compute_value(sums[1]);
  for (int i=2; i<=N; i++){
    DP[i] = LONG_MIN;
    for (int j=0; j<i; j++){
      long long new_value;
      new_value = DP[j] + compute_value(sums[i] - sums[j]);
      if (new_value >= DP[i]){
        DP[i] = new_value;
      }
    }
  }
  printf("%lld\n",DP[N]);

}
