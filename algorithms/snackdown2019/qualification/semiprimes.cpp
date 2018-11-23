#include <iostream>
using namespace std;
#include <algorithm>
#include <vector>
#include <math.h>


int binarySearch(vector<int> arr, int l, int r, int x)
{
   if (r >= l)
   {
        int mid = l + (r - l)/2;
        if (arr[mid] == x)
            return mid;
        if (arr[mid] > x)
            return binarySearch(arr, l, mid-1, x);
        return binarySearch(arr, mid+1, r, x);
   }
   return -1;
}

int checkSemiprime(int num)
{
    int cnt = 0;

    for (int i = 2; cnt < 2 && i * i <= num; ++i)
        while (num % i == 0)
            num /= i, ++cnt;
    if (num > 1)
        ++cnt;

    return (cnt == 2 && sqrt(num)!=ceil(sqrt(num)));
}




int main(void){
  int T;
  cin >> T;
  vector<int> semi_primes;
  for (int i=0; i<T; i++){
    int N, flag = 0;
    cin >> N;
    for (int j=0; j<N; j++){
      if (checkSemiprime(j)) semi_primes.push_back(j);
    }
    for (int j=0; j<semi_primes.size(); j++){
      int curr = semi_primes[j];
      if (binarySearch(semi_primes,0, semi_primes.size()-1, N-curr)!=-1){
        cout << "YES" << endl;
        flag = 1;
        break;
      }
    }
    if (!flag) cout << "NO" << endl;
  }
}
