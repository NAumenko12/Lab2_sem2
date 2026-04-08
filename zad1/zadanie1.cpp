#include<iostream>
#include <string>
#include <vector>
#include <climits>

using namespace std;

string minPodstroka(const string& stroka, const string& podstroka);
string mySubstr(const string& stroka, int start, int length);
bool podhodit(const string& stroka, const string& podstroka);

int main() {
    string stroka {};
    string podstoka{};
    cout << "Введите строку \n ";
    cin >> stroka;
    cout << "\nВведите подстроку " << endl;
    cin >> podstoka;
    if (!minPodstroka(stroka, podstoka).empty()) {
        cout << "Результат: " << minPodstroka(stroka, podstoka) << endl;
    }
    else{
        cout << "Не найдено\n";
    }
    return 0;
}

string mySubstr(const string& stroka, int start, int length) {
    string result{};
    for (int i = start; i < start + length; ++i) {
        result += stroka[i];
    }
    return result;
}

bool podhodit(const string& stroka, const string& podstroka) {
    vector<int> count(128, 0);
    bool isOk {true};
    for (char ch : podstroka){
        count[ch]++;
    } 
    for (char ch : stroka){
        count[ch]--;
    } 
    for (int i = 0; i < 128; i++) {
        if (count[i] >0) {
            isOk = false;
        }  
    }
    return isOk;
}

string minPodstroka(const string& stroka, const string& podstroka) {
    int n = static_cast<int>(stroka.size());
    string result{};
    for (int i = 0; i < n; i++){
        for (int j = i; j < n; j++){
            string pod = mySubstr(stroka, i, j - i + 1);
            if (podhodit(pod, podstroka)){
                if (result.empty() || pod.size() < result.size()){
                    result = pod;
                }
            }
        }
    }
    return result;
}
