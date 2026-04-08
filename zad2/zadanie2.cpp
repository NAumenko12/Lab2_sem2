#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void zapolTime(int n, vector<pair <int,int>>& time);
void printNomera(const vector<int>& nomera);
int CountElements(const vector<int>& v);
vector<pair<int, pair<int,int>>> SortZayavki(const vector<pair<int, int>>& time);
vector<int> CountMaxZayavki(const vector<pair<int,pair<int,int>>>& zayvki);

int main(){
    vector<pair<int,int>> time;
    vector<int> nomera;
    int n {};
    cout << "Введите N\n";
    cin >> n;
    cout << "\nВведите время начало и конца\n";
    zapolTime(n, time);
    cout << "\n Максимальное количество встреч" << endl;
    vector<pair<int, pair<int,int>>>zayvki = SortZayavki(time);
    nomera = CountMaxZayavki(zayvki);
    cout << "Результат: " << CountElements(nomera) << ",  ";
    printNomera(nomera);
}


int CountElements(const vector<int>& nomera) {
    int count {};
    for (int val : nomera){
        count++;
    } 
    return count;
}

vector<pair<int, pair<int,int>>> SortZayavki(const vector<pair<int, int>>& time){
    vector<pair<int, pair<int,int>>> zayvka;
    for (int i=0; i<time.size();++i){
        int start = time[i].first;
        int end = time[i].second;
        zayvka.push_back({end, {start,i+1}});
    }
    sort(zayvka.begin(),zayvka.end());
    return zayvka;
}

vector<int> CountMaxZayavki(const vector<pair<int,pair<int,int>>>& zayvki){
    vector <int> chose;
    int lEnd{-1};
    for (pair<int, pair<int,int>> val : zayvki){
        int end = val.first;
        int start = val.second.first;
        int index = val.second.second;
        if (start>=lEnd){
            chose.push_back(index);
            lEnd = end;
        }
    }
    sort(chose.begin(),chose.end());
    return chose;  
}

void zapolTime( int n, vector<pair<int,int>>& time){
    int startTime{};
    int endTime{};
    for (int i=0; i< n; ++i){
        cin>>startTime;
        cin>>endTime;
        time.push_back({startTime, endTime});
    }
}

void printNomera(const vector<int>& nomera){
    for (int val : nomera){
        cout << val << " ";
    }
}

