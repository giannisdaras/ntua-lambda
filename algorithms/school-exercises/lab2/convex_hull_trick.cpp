#include <iostream>
#include <algorithm>
#include <vector>
#include <math.h>
#include <climits>
#include <fstream>
#include <string>
using namespace std;
const int MAX_LEN = 10000000;
long long s[MAX_LEN];
long long DP[MAX_LEN];
long long a, b, c;

long long compute_value(long long x){
  return a*pow(x, 2) + b*x + c;
}

void f()
{
    std::string line;
    while(std::getline(std::cin, line))  //input from the file in.txt
    {
        std::cout << line << "\n";   //output to the file out.txt
    }
}


class Line {
public:
  long double m , b;
  Line(long double m, long double b){
    this->m = m;
    this->b = b;
  }
  pair<long double, long double> intersect(Line other) {
    long double x;
    if (other.m == this->m){
      x = 0;
    }
    else{
        x = (this->b - other.b) / (other.m - this->m);
    }
    long double y = (this->m)*x + this->b;
    return make_pair(x, y);
  }
  long double get_y(long double x) {
    return m*x + b;
  }

  bool better_line(Line other){
    long double eps = 10e-9;
    /* leei an egw eimai kaliteri eftheia apo tin alli */
    if (other.m < this->m && (-other.b/ (other.m + eps)) > (-this->b/ (this->m+eps))) {
      return true;
    }
    else return false;
  }
};

vector<pair<long double, Line>> convexHull;

void add2ConvexHull(Line line) {
  if (convexHull.size() == 0){
    convexHull.emplace_back(LONG_MIN, line);
    return;
  }
  while (convexHull.size() > 1){
    /* if the new line is better than the previously inserted line, just remove
    the previous */
    if (line.better_line(convexHull.back().second)) {
      convexHull.pop_back();
    }
    else if (line.intersect(convexHull[convexHull.size()-2].second).first <= convexHull.back().first){
      convexHull.pop_back();
    }
    else{
      break;
    }
  }
  /* if we are here and the size is 1 maybe we need to pop again? */
  if (convexHull.size() == 1 && line.better_line(convexHull.front().second)){
    convexHull.pop_back();
  }
  if (convexHull.size() == 0) convexHull.emplace_back(LONG_MIN,line);
  else{
    convexHull.emplace_back(line.intersect(convexHull.back().second).first, line);
  }
return;
}


long long get_best(long double x){
  long long low = 0;
  long long high = convexHull.size()-1;
  long long middle = low;
  while (low <= high){
    middle = ceil ( (low + high)/2 );
    if (convexHull[middle].first < x) low = middle + 1;
    else high = middle - 1;
  }
  // cout << low - 1 << endl;
  long long index = max(low - 1, (long long) 0);
  Line line = convexHull[index].second;
  // cout << "Chosen line " << line.m << " , " << line.b << endl;
  return line.get_y(x);
}

void debugConvexHull(){
  for (long long i=0; i<=convexHull.size()-1; i++){
    cout << "Line with parameters " << convexHull[i].second.m << " , " <<
    convexHull[i].second.b << " dominating from: " << convexHull[i].first << endl;
  }
}

void testConvexHull(){
  add2ConvexHull(Line(1, 10));
  add2ConvexHull(Line(2, 3));
  add2ConvexHull(Line(3, 7));
  add2ConvexHull(Line(4, 20));
  add2ConvexHull(Line(5, 15));
  debugConvexHull();
  cout << get_best(10) << endl;
  cout << get_best(20) << endl;
  cout << get_best(0) << endl;
  cout << get_best(-30.5) << endl;
}
bool debug = true;

int main(void){
debug = false;
  if (debug){
    testConvexHull();
    return 0;
  }
  // std::ifstream in("creosote/input17.txt");
  // std::streambuf *cinbuf = std::cin.rdbuf(); //save old buf
  // std::cin.rdbuf(in.rdbuf()); //redirect std::cin to in.txt!
  long long N;
  cin >> N >> a >> b >> c;
  long long x;
  s[0] = 0;
  for (long long i=1; i<=N; i++){
    cin >> x;
    s[i] = s[i-1] + x;
  }
  DP[0] = 0;
  DP[1] = compute_value(s[1]);
  // cout << "Running?" << endl;
  add2ConvexHull(Line(0, 0));
  add2ConvexHull(Line(-2*a*s[1], DP[1] + a*pow(s[1] , 2) - b*s[1]));
  for (long long i=2; i<=N; i++){
    long long result = get_best(s[i]);
    DP[i] = c + a*pow(s[i], 2) + b*s[i] + result;
    add2ConvexHull(Line(-2*a*s[i], DP[i] + a*pow(s[i],2) - b*s[i]));
  }
  cout << DP[N] << endl;
}
