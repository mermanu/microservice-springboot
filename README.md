# microservice-springboot
**Project test using spring boot:**

0. **dependencies:** maven, java 8, docker

1. **account-api:** api with the service in itself to manage the accounts of users (here is wrapped now the user model)
Spring boot, postgresql

2. **api-gateway:** entry point of all the petitions to the services, authorization, api, others.
Spring boot, zuul

3. **account-web:** angularjs app, with nodejs http-server

4. **authorization:** not implemented -- service to grant access with user and password 

5. **RunApp.sh:** automation of project build, services, and test environment
