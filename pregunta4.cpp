#include <iostream>
#include <fstream>
#include <thread>
#include <mutex>
#include <vector>
#include <string>

using namespace std;

mutex mtx;

void escribirLinea(const string& archivo, int id) {
    string linea = "Soy el thread #" + to_string(id) + " y estoy escribiendo mi linea.\n";

    lock_guard<mutex> lock(mtx);

    ofstream out(archivo, ios::app);
    if (!out.is_open()) {
        cerr << "Error: no se pudo abrir el archivo.\n";
        return;
    }

    out << linea;
}

int main() {
    string archivo = "salida.txt";

    // limpiar al inicio
    {
        ofstream out(archivo, ios::trunc);
    }

    vector<thread> hilos;

    for (int i = 1; i <= 5; i++) {
        hilos.emplace_back(escribirLinea, archivo, i);
    }

    for (auto& t : hilos) {
        t.join();
    }

    cout << "Listo. Revisa el archivo: " << archivo << endl;
    return 0;
}
