# Simple GRUD on RoR with GraphQL
This is the RoR and GraphQL application
## Getting started

To get started with the app, clone the repo and build docker container:

```
$ docker-compose build
```

Next, create and migrate the database:

```
$ docker-compose run --rm web bash -c "rails db:create db:migrate db:seed"
```

```
docker-compose run --rm --service-ports web /bin/bash -c "rm tmp/pids/server.pid; bundle exec rails s -b '0.0.0.0' -p 3000"
```

For more information how work with GraphQL, see the:
[*GraphQL Documentation*](https://graphql.org/learn/),
[*GraphqlRuby Documentation*](https://graphql-ruby.org/).
