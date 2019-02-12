#include <iostream>
#include <climits>
#include <math.h>
using namespace std;

/* heap stop */
int hs = 0;

/* initialize heap */
const int MAX_NODES = 1024;
int heap[MAX_NODES];

/* Forward declarations */
void combine(int i);

void swap(int i, int j){
  int tmp = heap[j];
  heap[j] = heap[i];
  heap[i] = tmp;
}

int get_left_index(int index){
  int left_index = 2*index + 1;
  return left_index;
}
int get_right_index(int index){
  int right_index = 2*index + 2;
  return right_index;
}
int get_father(int index){
  return (index - 1) / 2;
}

int get_max(){
  return heap[0];
}

bool empty(){
  if (hs == 0) return 1;
  else return 0;
}

int extract_max(){
  if (empty()) return INT_MIN;
  int maxx = heap[0];
  /* bring the latest inserted to the root */
  heap[0] = heap[hs - 1];
  hs--;
  /* fix broken tree */
  combine(0);
  return maxx;
}

void combine(int i){
  int left = get_left_index(i);
  int right = get_right_index(i);
  int new_index = i;
  if ( (left < hs) && heap[left] > heap[i]){
    new_index = left;
  }
  if ( (right < hs) && heap[right] > heap[i]){
    new_index = right;
  }
  if (new_index != i){
    swap(i, new_index);
    combine(new_index);
  }
}

void insert(int value){
  heap[hs] = value;
  hs++;
  int index = hs - 1;
  int parent = get_father(hs-1);
  while (index > 0 && heap[parent] < heap[index]){
    swap(parent, index);
    index = parent;
    parent = get_father(index);
  }
}

int main(void){
  insert(20);
  insert(200);
  insert(800);
  // cout << extract_max() << endl;
  // cout << extract_max() << endl;
}
