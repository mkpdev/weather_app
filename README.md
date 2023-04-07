# README

Information regarding this project:

* Using Ruby version
  ruby 3.0.0

* System dependencies
  Install docker - Docker version 23.0.3

## Local development flow

1) Clone the repository.

2) Go to project directory.

3) Run docker command to setup - 
  ```docker-compose build```

4) To run server - 
   ```docker-compose up```

5) Finally go to `http://localhost:3000`

6) To access rails c, following command can used - 
  ```docker-compose run web rails  c```

### Third party public API used - 

Weather API - https://openweathermap.org/api
