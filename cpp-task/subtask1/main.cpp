#include <iostream>
#include <fstream>
#include <thread>
#include <chrono>

int main() {
    std::ofstream file("test.txt");

    for (int i = 0; i < 1000; ++i) {
        file << i << std::endl << std::flush;
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }

    file.close();

    return 0;
}
