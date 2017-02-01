green=`tput setaf 2`
reset=`tput sgr0`
bold=$(tput bold)
echo "${green}------------------------------------------------------------------------------------"
echo "${green}Building viventor test: call to Manuel Merida for details :)"
echo "${green}------------------------------------------------------------------------------------"
echo "${reset}"
filepath="$PWD"

docker run -e POSTGRES_DB=viventor -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres

mvn clean install -f $PWD/account-api -Dmaven.test.skip=true
cd $filepath/account-api
mvn package docker:build -Dmaven.test.skip=true

cd $filepath/account-gateway
mvn clean install -f $filepath/account-gateway -Dmaven.test.skip=true
mvn package docker:build -Dmaven.test.skip=true
echo "${green}------------------------------------------------------------------------------------"
echo "${green}Running viventor accounts app ...."
echo "${green}------------------------------------------------------------------------------------"
echo "${reset}"

cd $filepath
docker-compose up
echo "${green}------------------------------------------------------------------------------------"
echo "${green}App is running on:---> MACHINE_IP:9000/viventor/#/dashboards/dashboard_5"
echo "${green}------------------------------------------------------------------------------------"
echo "${reset}"
