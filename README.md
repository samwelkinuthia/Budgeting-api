# Budgeting API

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

The ouput should start with something like `ruby 3.0.0`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.0.0
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler)

```shell
bundle
```

<!-- ### Set environment variables

Using [Figaro](https://github.com/laserlemon/figaro):

See [config/application.yml.sample](https://github.com/juliendargelos/project/blob/master/config/application.yml.sample) and contact the developer: [contact@juliendargelos.com](mailto:contact@juliendargelos.com) (sensitive data). -->

### Initialize the database

```shell
rails db:create db:migrate db:seed
```
## Serve

```shell
rails s
```
