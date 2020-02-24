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
## Result
<img width="860" alt="Screen Shot 2020-02-24 at 5 37 45 PM" src="https://user-images.githubusercontent.com/25566849/75157257-330f3180-572d-11ea-9274-2c45bf77049f.png">

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
## Result
<img width="863" alt="Screen Shot 2020-02-24 at 5 38 25 PM" src="https://user-images.githubusercontent.com/25566849/75157273-37d3e580-572d-11ea-8531-9c34af74ad68.png">

For more information how work with GraphQL, see the:
[*GraphQL Documentation*](https://graphql.org/learn/),
[*GraphqlRuby Documentation*](https://graphql-ruby.org/).
