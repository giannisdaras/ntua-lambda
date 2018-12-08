#include <iostream>
#include <cstdio>
#include <math.h>
#include <fstream>
#include <string>
using namespace std;
const int MAX_LEN = 1e8;
long long seq[MAX_LEN];
int golden[MAX_LEN];
int bronze[MAX_LEN];
int golden_high = 0;
int bronze_high = 0;
bool bronze_flag = false;
int bronze_low;

// bool debug = true;
bool debug = false;

int sequence_length;
/*
to golden[i] exei to teliko stoixeio tis megaliteris golden akolouthias
mikous i.
*/
int main(void){
  // std::ifstream in("credits/input11.txt");
  // std::streambuf *cinbuf = std::cin.rdbuf(); //save old buf
  // std::cin.rdbuf(in.rdbuf()); //redirect std::cin to in.txt!
  int N;
  cin >> N;
  // scanf("%d", &N);
  for (int i=0; i<N; i++){
    // scanf("%lld", &seq[i]);
    cin >> seq[i];
  }
  for (int i=0; i<N; i++){
    /* -------------------------- GOLDEN ------------------------------------ */
    int lo = 1;
    int hi = golden_high;
    while (lo <= hi){
      int mid = ceil((lo + hi)/2);
      if (seq[golden[mid]] < seq[i]) lo = mid + 1;
      else hi = mid - 1;
    }
    golden[lo] = i;
    if (lo > golden_high){
      golden_high = lo;
    }
    else if (bronze_flag == false){
      bronze_flag = true;
      bronze_low = golden_high + 1; // h kainourgia pou tha mpei
      bronze_high = 0;
    }

    /* -------------------------- BRONZE ------------------------------------*/

    if (bronze_flag){
      /* -------------------- epektasi --------------------------------------*/
      int new_low = bronze_low;
      int new_high = bronze_high;
      while (new_low <= new_high){
        int mid = ceil ( (new_low + new_high) / 2);
        if (seq[bronze[mid]] < seq[i]) new_low = mid + 1;
        else new_high = mid - 1;
      }
      bronze[new_low] = i;
      if (new_low > bronze_high){
        bronze_high = new_low;
      }

      /* -------------------- merge -----------------------------------------*/
      if (lo != golden_high){
        sequence_length = min(golden_high + 1, N-1);
        /* to parakatw if sigrinei tin ektimisi pou exw gia afto to mikos
        akolouthias me to pragmatiko */
        if (seq[bronze[sequence_length]] >= seq[i]){
          /* an to kainourgio pou irthe einai pio megalo, tote vazw to
          kainourgio */
          bronze[sequence_length] = i;
          int new_low = bronze_low;
          int new_high = sequence_length;
          int mid;
          while (new_low <= new_high){
            mid = ceil ( (new_low + new_high) / 2);
            if (seq[bronze[mid]] < seq[i]) new_low = mid + 1;
            else  new_high = mid - 1;
          }
          if (seq[bronze[mid]] < seq[i]){
            bronze_low = mid;
          }
          else{
            bronze_low = sequence_length;
          }
        }
      }
    }
    if (debug){
      cout << "Golden: " << golden_high << " with biggest last " <<
      seq[golden[golden_high]] << " Bronze: " << bronze_high <<
      " with biggest last " <<
      seq[bronze[bronze_high]]  <<  " Bronze low " <<
      bronze_low << " Bronze high " << bronze_high << endl;
    }
  }

  cout << max(bronze_high, golden_high) << endl;


}
