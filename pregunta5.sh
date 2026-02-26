    1  sudo apt update
    2  sudo apt upgrade
    3  vim
    4  sudo apt install vim
    5  vim
    6  clear
    7  ls
    8  sudo apt install cmake
    9  python
   10  sudo apt install vscode
   11  cd Downloads/
   12  ls
   13  sudo apt install code_1.108.1-1768404234_amd64.deb
   14  sudo apt install ./code_1.108.1-1768404234_amd64.deb 
   15  cd SO
   16  code SO
   17  code
   18  top
   19  sudo apt update
   20  sudo apt install -y git
   21  git --version
   22  cd ~
   23  mkdir SistemasOperativosATG
   24  cd SistemasOperativosATG
   25  pwd
   26  ls -la
   27  cd ~/SistemasOperativosATG
   28  pwd
   29  ls -la
   30  touch "Tarea 1.cpp"
   31  ls -la
   32  code .
   33  cd 
   34  cd Examen-1-Parcial-SO
   35  git clone https://github.com/aixatorres/Examen-1-Parcial-SO.git
   36  cd Examen-1-Parcial-SO
   37  cat << 'EOF' > pregunta4.cpp
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
EOF

   38  cat pregunta4.cpp
   39  g++ -std=c++11 -pthread pregunta4.cpp -o pregunta4
   40  ./pregunta4
   41  cat salida.txt
   42  git add pregunta4.cpp salida.txt
   43  git commit -m "Pregunta 4" 
   44  git push
   45  git add pregunta4.cpp salida.txt
   46  git commit -m "pregunta 4"
   47  git add pregunta4.cpp salida.txt
   48  git commit -m "Pregunta 4" 
   49  git push
   50  printf "pregunta4\n" >> .gitignore
   51  git add .gitignore
   52  git commit -m "Ignorar binario pregunta4"
   53  git branch --unset-upstream
   54  git branch -u origin/main
   55  git credential reject <<EOF
protocol=https
host=github.com
username=aixatorres
EOF

   56  git push -u origin main
   57  read -s TOKEN; echo
   58  curl -s -H "Authorization: token $TOKEN" https://api.github.com/user | head
   59  sudo apt update
   60  sudo apt install -y curl
   61  cd ~/Examen-1-Parcial-SO
   62  git remote -v
   63  rm -f ~/.git-credentials
   64  git config --global --unset credential.helper 2>/dev/null
   65  read -s TOKEN; echo
   66  curl -s -H "Authorization: token $TOKEN" https://api.github.com/user | head -n 20
   67  curl -I -s -H "Authorization: token $TOKEN" https://api.github.com/user | grep -i x-oauth-scopes
   68  rm -f ~/.git-credentials
   69  git push -u origin main
   70  cd ~/Examen-1-Parcial-SO
   71  : > accept.txt; ls >> accept.txt; printf "%s\n" "$(history | awk '$2=="ls"{c++} END{print c+0}')" >> accept.txt
   72  cat accept.txt
   73  history > pregunta5.sh
