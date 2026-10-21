
#include <iostream>
#include <chrono>
#include <memory>
using namespace std;
using namespace std::chrono;

//array size and number of function calls
const int N = 10000;
const int CALLS = 100000;

volatile long long result = 0;

// Part1
void staticArray(int n) {
    static int arr[N];
    long long sum = 0;
    for (int i = 0; i < N; i++) {
        arr[i] = i + n;
        sum += arr[i];
    }
    result = sum;
}

// Part 2
void stackArray(int n) {
    int arr[N];
    long long sum = 0;
    for (int i = 0; i < N; i++) {
        arr[i] = i + n;
        sum += arr[i];
    }
    result = sum;
}

// Part 3
void heapArray(int n) {
    unique_ptr<int[]> arr(new int[N]);
    long long sum = 0;
    for (int i = 0; i < N; i++) {
        arr[i] = i + n;
        sum += arr[i];
    }
    result = sum;
}

template <typename Function>
double TimeCalc(Function func) {
    
    // Record starting time
    auto start =
        high_resolution_clock::now();

    for (int i = 0; i < CALLS; i++) {
        func(i);
    }

    // Record ending time
    auto stop =
        high_resolution_clock::now();

    auto duration =
        duration_cast<milliseconds>(stop - start).count();

    return duration;
}

int main() {
    cout << "Array size: " << N << " integers\n";
    cout << "Function calls: " << CALLS << "\n\n";

    double staticTime = TimeCalc(staticArray);
    double stackTime  = TimeCalc(stackArray);
    double heapTime   = TimeCalc(heapArray);

    cout << "Static array: " << staticTime << " ms\n";
    cout << "Stack array:  " << stackTime  << " ms\n";
    cout << "Heap array:   " << heapTime   << " ms\n";

    return 0;
}
