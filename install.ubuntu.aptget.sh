echo "Ubuntu apt-get update...";
sudo apt-get update -y;  

echo "Ubuntu apt-get install...";
type git &> /dev/null || sudo apt-get install  -y --fix-missing git;
type vim &> /dev/null || sudo apt-get install  -y --fix-missing vim;
type curl &> /dev/null || sudo apt-get install  -y --fix-missing curl;
type tmux &> /dev/null || sudo apt-get install  -y --fix-missing tmux;
sudo apt-get install  -y --fix-missing g++;
sudo apt-get install  -y --fix-missing unzip;
sudo apt-get install  -y --fix-missing make;
sudo apt-get install  -y --fix-missing mysql-client;
sudo apt-get install  -y --fix-missing openjdk-8-jdk;
sudo apt-get install  -y --fix-missing ant;
sudo apt-get install  -y --fix-missing gradle;
sudo apt-get install  -y --fix-missing maven;
# sudo apt-get install  -y --fix-missing build-essential;
# sudo apt-get install  -y --fix-missing python;
# sudo apt-get install  -y --fix-missing python-dev;
# sudo apt-get install  -y --fix-missing python-software-properties;
# sudo apt-get install  -y --fix-missing software-properties-common;
# sudo apt-get install  -y --fix-missing supervisor;
# sudo apt-get install  -y --fix-missing automake;
# sudo apt-get install  -y --fix-missing gnuplot;
