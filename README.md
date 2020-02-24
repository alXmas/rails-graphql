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
Run the app in a local server:
```
docker-compose run --rm --service-ports web /bin/bash -c "rm tmp/pids/server.pid; bundle exec rails s -b '0.0.0.0' -p 3000"
```

## Example query
```
query {
  posts {
    id
    title
    author {
      id
      name
    }
  }
}
```
## Example mutation
```
mutation {
  addPost(input: { authorId: 1, 
									 title: "Привет мир!",
    								body: "Hello"
									}
		){
    post{
      title
      createdAt
    }
  }
}
```

For more information, see the
[*Dualboot Learn*](https://fullstack-learning.firebaseapp.com/).
