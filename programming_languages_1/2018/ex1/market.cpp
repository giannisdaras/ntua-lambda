#include <iostream>
#include <string>
#include <vector>
#include <fstream>
using namespace std;


// finds lcm of 2 numbers using euclidean algorithm for gcd.
long long int lcm(long long int a,long long int b){
	long long int tmp;
	if (b>a){
		tmp=a;
		a=b;
		b=tmp;
	}
	long long int a_copy=a;
	long long int b_copy=b;
	while (b>0){
		tmp=b;
		b=a%b;
		a=tmp;
	}
	return ( (a_copy/a)* b_copy );
}



int main(int argc, char ** argv){
	int N;
	string file_name;
	if (argc==2){
		file_name=argv[1];
	}
	else{
		return(0);
	}
	ifstream file_image;
	file_image.open(file_name.c_str());
	file_image >> N;
	vector<int> days(N);
	for (int i=0; i<N; i++){
		file_image >> days[i];
	}
	vector<long long int> left_lcms(N+2);
	vector<long long int> rigth_lcms(N+2);
	vector<long long int> lcms_without(N);

	left_lcms[N+1]=1; left_lcms[0]=1; rigth_lcms[N+1]=1; rigth_lcms[0]=1;

	for (int i=1; i<=N; i++){
		left_lcms[i]=lcm(left_lcms[i-1],days[i-1]);
	}
	for (int i=N; i>=1; i--){
		rigth_lcms[i]=lcm(rigth_lcms[i+1],days[i-1]);
	}
	for (int i=1; i<=N; i++){
		lcms_without[i-1]=lcm(left_lcms[i-1],rigth_lcms[i+1]);
	}

	long long int lcm_all=left_lcms[N];
	int index=1; long long int minim=lcms_without[0];
	for (int i=0; i<N; i++){
		if (lcms_without[i]<minim){
			index=i+1;
			minim=lcms_without[i];
		}
	}
	if (minim==lcm_all){
		index=0;
	}
	cout << minim << ' ' << index << endl;
	file_image.close();
	

	
}