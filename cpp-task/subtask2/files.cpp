#include <iostream>
#include <filesystem>
#include <fstream>
#include <vector>
#include <thread>
#include <chrono>

std::vector<std::ifstream> files;

int main() {
    for (const auto& entry : std::filesystem::directory_iterator("../../")) {
        std::ifstream file(entry.path());
        if (!file.is_open()) {
            std::cerr << "Failed to open file: " << entry.path() << '\n';
            continue;
        }
        files.push_back(std::move(file));
        std::cout << "Opened file " << entry.path() << '\n';
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }

    // Close all files
    for (auto& file : files) {
        file.close();
    }

    return 0;
}
