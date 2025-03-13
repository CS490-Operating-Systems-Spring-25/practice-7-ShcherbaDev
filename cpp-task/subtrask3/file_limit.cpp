#include <iostream>
#include <filesystem>
#include <fstream>
#include <vector>
#include <thread>
#include <chrono>

std::vector<std::ifstream> files;

int main() {
    std::cout << "Getting file paths from /usr directory\n";

    std::vector<std::string> usr_file_paths;
    for (const auto& file : std::filesystem::recursive_directory_iterator("/usr")) {
        if (file.is_regular_file()) {
            usr_file_paths.push_back(file.path().string());
        }
    }

    std::cout << "/usr files: " << usr_file_paths.size() << '\n';

    if (usr_file_paths.size() < 100000) {
        std::cerr << "There are less then 100000 files in /usr dir. Exiting\n";
        return 1;
    }

    for (size_t i = 0; i < 100000; i += 1000) {
        for (int j = 0; j < 1000; ++j) {
            std::ifstream file(usr_file_paths[i + j]);
            if (!file.is_open()) {
                std::cerr << "Failed to open file: " << usr_file_paths[i + j] << '\n';
                continue;
            }
            files.push_back(std::move(file));
        }

        std::cout << "Opened " << files.size() << " files\n";
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }

    // for (const auto& entry : std::filesystem::directory_iterator("/tmp")) {
    //     std::ifstream file(entry.path());
    //     if (!file.is_open()) {
    //         std::cerr << "Failed to open file: " << entry.path() << '\n';
    //         continue;
    //     }
    //     files.push_back(std::move(file));
    //     std::cout << "Opened file " << entry.path() << '\n';
    //     std::this_thread::sleep_for(std::chrono::seconds(1));
    // }

    // Close all files
    for (auto& file : files) {
        file.close();
    }

    return 0;
}
