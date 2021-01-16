# feedtheneedy (Repository)
Docker is required to run this application, along with that docker-compose, make sure to install necessary software for docker as per your OS.

#### Docker Installation
- `https://docs.docker.com/engine/install/`
- `https://docs.docker.com/compose/install/`

#### Basic Docker Commands to Build and Run the application
- `docker-compose build`
- `docker-compose up`

#### Docker commands to setup application after build
- `docker-compose run app bundle install`
- `docker-compose run app rails db:drop`
- `docker-compose run app rails db:create`
- `docker-compose run app rails db:migrate`
- `docker-compose run app rails db:seed`

#### Just in case if you want to enter rails console
- `docker-compose run app rails console`

#### Just in case if you want to enter into docker container
- `docker-compose run app sh`

#### How to use byebug?
- `docker attach feedtheneedy_app_1` (you should be running `up` in another terminal tab)

#### Edit Credentials
- `docker-compose exec app sh`
- `apk add nano`
- `EDITOR="nano -w" bundle exec rails credentials:edit`
