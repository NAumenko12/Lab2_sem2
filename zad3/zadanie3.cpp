#include <iostream>
# include <vector>

using namespace std;

int countElements( const vector<int>& massiv);
void zapolnenie(int n , vector<int>& massiv);
void printVector(const vector<int>& massiv);

int main(){
    int n {};
    vector<int> massiv;
    cout<<"Введите N\n";
    cin>> n;
    cout<< "Введите массив до N\n";
    zapolnenie(n, massiv);
    cout<<"Введенный массив\n";
    printVector(massiv);
    cout<< "\n Колличество элементов равному предыдущему числу : ";
    cout << countElements(massiv)<<endl;
    return 0;
}

int countElements( const vector<int>& massiv){
    int count {};
    for (size_t i = 1; i < massiv.size() ; ++i){
        if (massiv[i] == massiv[i-1]){
            ++count;
        }
    }
    return count;
}
void zapolnenie(int n , vector<int>& massiv){
    int numbers{};
    for (int i{}; i <n ; ++i){
        cin>> numbers;
        massiv.push_back(numbers);
    }
}
void printVector(const vector<int>& massiv){
    for (int val : massiv){
        cout<< val << " ";
    }
}

