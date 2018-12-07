#include <iostream>
#include <cstdio>
#include <math.h>
using namespace std;
const int MAX_LEN = 1e6;
long long seq[MAX_LEN];
int m_golden[MAX_LEN];
int m_bronze[MAX_LEN];
int l_golden = 0;
int l_bronze = 0;
bool bronze_flag = false;
int bronze_low;
int bronze_high;
/*
to m_golden[i] exei to teliko stoixeio tis megaliteris golden akolouthias
mikous i.
*/
int main(void){
  int N;
  scanf("%d", &N);
  for (int i=0; i<N; i++){
    scanf("%lld", &seq[i]);
  }
  for (int i=0; i<N; i++){
    /* psaxnw ti megaliteri golden akolouthia pou mporw na to valw */
    int lo = 1;
    int hi = l_golden;
    while (lo <= hi){
      int mid = ceil((lo + hi)/2);
      if (seq[m_golden[mid]] < seq[i]) lo = mid + 1;
      else hi = mid - 1;
    }
    /* to lo exei to mikos tis megaliteris golden akolouthias pou mporw na to
    valw + 1*/
    /*
      oi diagrafes ginontai me oti spane oi isopalies sta miki vazontas tin
      kainourgia.
    */
    m_golden[lo] = i;
    if (lo > l_golden){
      l_golden = lo;
    }
    else if (bronze_flag == false){
      /* h prwti pou mpainei stis bronze */
      bronze_flag = true;
      // to bronze_low einai to mikos tis mikroteris akolouthias pou exoume
      // valei mesa sto bronze. Afto, pithanws na afxithei.
      bronze_low = l_golden; // h kainourgia pou tha mpei
      // to l_bronze einai to mikos tis megaliteris akolouthias pou iparxei
      // mesa sto bronze
      l_bronze = 0;
    }

    if (bronze_flag){
      // an exw mesa akolouthies stis bronze, arxika prepei na epekteinw ti
      // megaliteri, opos akrivws kaname stis golden
      int new_low = bronze_low;
      int new_high = l_bronze;
      while (new_low <= new_high){
        int mid = ceil ( (new_low + new_high) / 2);
        if (seq[m_bronze[mid]] < seq[i]) new_low = mid + 1;
        else new_high = mid - 1;
      }
      m_bronze[new_low] = i;
      if (new_low > l_bronze){
        l_bronze = new_low;
      }

      /* panta bazw ti megaliteri apo tis golden */
      int sequence_length = l_golden + 1;
      if (seq[m_bronze[sequence_length]] > seq[i]){
      /* psaxnw tin megaliteri mikroteri akolouthia pou exei teliko stoixeio
      mikrotero apo to diko mou
      */
      int new_low = bronze_low;
      int new_high = sequence_length;
      while (new_low <= new_high){
        int mid = ceil ( (new_low + new_high) / 2);
        if (seq[m_bronze[mid]] < seq[i]) new_low = mid + 1;
        else  new_high = mid - 1;
      }
      /* to stoixeio pou brika einai to new_low */
      bronze_low = new_low;
      m_bronze[sequence_length] = i;
      if (sequence_length > l_bronze){
        l_bronze = sequence_length;
      }
      }
    }
  }




  cout << max(l_bronze, l_golden) << endl;


}
