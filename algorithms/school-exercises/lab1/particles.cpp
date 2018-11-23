#include <iostream>
#include <algorithm>
#include <math.h>
#include <vector>
#include <tuple>
#include <map>
using namespace std;
const double epsilon = pow(10, -7);
typedef long long ll;
typedef vector < pair <int, int> > vecpair;


vecpair particles_a;
vecpair particles_b;

double compute_x_position(int start_time, int velocity, double curr_time){
  return velocity * (curr_time - start_time);
}

double compute_y_position(int start_time, int velocity, double curr_time, ll L){
  return L - velocity * (curr_time - start_time);
}

double get_rightmost_particle_a(double curr_time, int N){
  double max_pos = 0;
  for (int i=0; i<N; i++){
    double curr_pos = compute_x_position(particles_a[i].first, particles_a[i].second, curr_time);
    if (curr_pos > max_pos){
      max_pos = curr_pos;
    }
  }
  return max_pos;
}

int get_rightmost_index(double curr_time, int N){
  double max_pos = 0;
  int index = 0;
  for (int i=0; i<N; i++){
    double curr_pos = compute_x_position(particles_a[i].first, particles_a[i].second, curr_time);
    if (curr_pos > max_pos){
      max_pos = curr_pos;
      index = i;
    }
  }
  return index;
}

int get_leftmost_index(double curr_time, int N, ll L){
  double min_pos = L;
  int index = 0;
  for (int i=0; i<N; i++){
    double curr_pos = compute_y_position(particles_b[i].first, particles_b[i].second, curr_time, L);
    if (curr_pos < min_pos){
      min_pos = curr_pos;
      index = i;
    }
  }
  return index;
}


// to mikrainei oso to dinaton perissotero gia na isxiei
double continuous_binary_search(double low, double high, int N, ll L){
  if (low >= high){
    return high;
  }
  double middle = (low + high)/2;
  double right_most_a = get_rightmost_particle_a(middle, N);
  bool collision_flag = false;
  for (int i=0; i<N; i++){
    double b_particle_position = compute_y_position(particles_b[i].first, particles_b[i].second, middle, L);
    if (b_particle_position < right_most_a){
      collision_flag = true;
      break;
    }
  }
  if (collision_flag) return continuous_binary_search(low, middle - epsilon, N, L);
  else return continuous_binary_search(middle + epsilon, high, N, L);
}

int main(void){
  int N, K;
  ll L;
  cin >> N >> L >> K;
  map < pair<int, int>, int> mapper_a;
  map < pair<int, int>, int> mapper_b;
  for (int i = 0; i<N; i++){
    int start_time, velocity;
    cin >> start_time >> velocity;
    pair <int, int> particle_pair = make_pair(start_time, velocity);
    particles_a.push_back(particle_pair);
    mapper_a[particle_pair] = i+1;
  }

  for (int i = 0; i<N; i++){
    int start_time, velocity;
    cin >> start_time >> velocity;
    pair <int, int> particle_pair = make_pair(start_time, velocity);
    particles_b.push_back(particle_pair);
    mapper_b[particle_pair] = i+1;
  }

  int collisions = 0;
  double low = 0;
  double high = L;
  double vec_size = N;
  while (collisions < K){
    double curr_time = continuous_binary_search(low, high, vec_size, L);
    int to_delete_a = get_rightmost_index(curr_time, vec_size);
    int to_delete_b = get_leftmost_index(curr_time, vec_size, L);
    cout << mapper_a[particles_a[to_delete_a]] << " " << mapper_b[particles_b[to_delete_b]] << endl;
    particles_a.erase(particles_a.begin() + to_delete_a);
    particles_b.erase(particles_b.begin() + to_delete_b);
    collisions += 1;
    vec_size -= 1;
  }

}
