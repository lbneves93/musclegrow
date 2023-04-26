# Muscle Grow come to help you organize your gym trainings!

* [Muscle Grow Demo](http://staging-musclegrow.us-east-1.elasticbeanstalk.com)
* Admin User:
 > Email: admin@email.com<br>
 > Password: admin123
* Athlete User:
 > Email: athlete@email.com<br>
 > Password: athlete123

### Main Tecnologies

* Ruby version 3.2.1
* Rails version 7.0.4
* Postgresql version 15.2
* Docker version 20.10.5
* Docker Compose version 2.16

### Running Muscle Grow in development

* Clone repository;
* Ask the "master.key" for repository owner;
* Put "master.key" in config folder;
* In root path of project build the containers:
```sh
docker compose build
```
* To create, migrate and seed database:
```sh
docker compose run --rm web rails db:setup
```
* To access Rails console:
```sh
docker compose run --rm web rails c
```
* To run the application:
```sh
docker compose up web
```
* Application runs in http://localhost:3000

### Tests

* Using [rspec](https://rspec.info) for tests.
* To run all tests:
```sh
docker compose run --rm web rspec
```

### Code Quality Analisis

* Usign [rubocop](https://rubocop.org) for code quality.
* To analise the files run:
```sh
docker compose run --rm web rubocop
```



