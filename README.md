# Budgeting API

API to track budgetary spending on a county and national level.

## Install

### Clone the repository

```shell
git clone git@github.com:samwelkinuthia/Budgeting-api.git
cd project
```

### Check your Ruby version

```shell
ruby -v
```

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.2.0
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler)

```shell
bundle
```

### Initialize the database
You can customize the seeded user data by editing config/db/seeds.rb
```shell
rails db:create
rails db:migrate 
rails db:seed
```

## Serve

```shell
rails s
```

### Documentation
- Navigate to ```http://localhost:3000/api-docs/index.html``` for swagger api documentation.
- Headers required: client, uid, access_token.
- Authentication framework used is [Devise Token Auth](https://devise-token-auth.gitbook.io/devise-token-auth/).
