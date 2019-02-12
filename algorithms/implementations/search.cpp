#include <iostream>
using namespace std;
int N = 7;
int arr[] = {10, 200, 1000, 1024, 2930, 10000, 10001};

bool binary_search(int value){
  int low = 0;
  int high = N-1;
  while (low <= high){
    int mid = (low + high)/2;
    if (arr[mid] == value){
      return 1;
    }
    if (arr[mid] > value){
      high = mid - 1;
    }
    else{
      /* arr[mid] < value */
      low = mid + 1;
    }
  }
  return 0;
}


bool interpolation_search(int value){
  int low = 0;
  int high = N-1;
  while (low <= high){
    if (value < arr[low]) return 0;
    double average_increase = (arr[high] - arr[low]) / (high - low);
    int low_distance = (value - arr[low]);
    int positions = (int) low_distance / average_increase;
    int pos = low + positions;
    if (arr[pos] == value) return 1;
    else if (arr[pos] > value) high = pos - 1;
    else low = pos + 1;
  }
}

int main(void){
  cout << binary_search(1024) << endl;
  cout << interpolation_search(1024) << endl;
}
