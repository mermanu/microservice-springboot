green=$(tput setaf 2)
reset=$(tput sgr0)
bold=$(tput bold)
yellow=$(tput setaf 3)
filepath="$PWD"
jsonstring="{"

echo "${green}------------------------------------------------------------------------------------"
echo "${green}Building viventor test: call to Manuel Merida for details :)"
echo "${green}------------------------------------------------------------------------------------"


. config.properties
echo "${green}--> Setting up variables"
while read line;
do export "$line";
echo "${yellow}--> $line"
done < config.properties
echo "${reset}"

jsonstring+="\"ACCOUNT_API_URL\":\"${ACCOUNT_API_URL}\""
jsonstring+="}"
echo "${jsonstring}" > /${filepath}/account-web/web/js/config.properties

docker run -e POSTGRES_DB=$POSTGRES_DB -e POSTGRES_USER=$POSTGRES_USER -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD -p 5432:5432 -d postgres

mvn clean install -f $PWD/account-api -Dmaven.test.skip=true
cd $filepath/account-api
mvn package docker:build -Dmaven.test.skip=true
echo "${yellow}--> account-api build done"
echo "${reset}"

cd $filepath/account-gateway
mvn clean install -f $filepath/account-gateway -Dmaven.test.skip=true
mvn package docker:build -Dmaven.test.skip=true
echo "${yellow}--> account-gateway build done"

echo "${green}------------------------------------------------------------------------------------"
echo "${green}Running viventor accounts app ...."
echo "${green}------------------------------------------------------------------------------------"
echo "${reset}"

cd $filepath
echo "${yellow}--> Setting up hosts file: ${DOCKER_HOST_IP}:${APP_SERVER_NAME}"
sh /${filepath}/changehosts.sh
echo "${reset}"

docker-compose up
echo "${green}------------------------------------------------------------------------------------"
echo "${yellow}App is running on:---> ${APP_SERVER_NAME}:${APP_SERVER_PORT}/app/#/dashboards/dashboard_5"
echo "${green}------------------------------------------------------------------------------------"
echo "${reset}"
