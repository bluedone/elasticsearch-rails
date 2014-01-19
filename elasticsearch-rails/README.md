# Elasticsearch::Rails

The `elasticsearch-rails` library is a companion for the
the [`elasticsearch-model`](https://github.com/elasticsearch/elasticsearch-rails/tree/master/elasticsearch-model)
library, providing features suitable for Ruby on Rails applications.

## Installation

Install the package from [Rubygems](https://rubygems.org):

    gem install elasticsearch-rails

To use an unreleased version, either add it to your `Gemfile` for [Bundler](http://bundler.io):

    gem 'elasticsearch-rails', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'

or install it from a source code checkout:

    git clone https://github.com/elasticsearch/elasticsearch-rails.git
    cd elasticsearch-rails/elasticsearch-rails
    bundle install
    rake install

## Usage

You can generate a fully working example Ruby on Rails application, with an `Article` model and a search form,
to play with (it even downloads _Elasticsearch_ itself, generates the application skeleton and leaves you with
a _Git_ repository to explore the steps and the code):

```bash
rails new searchapp --skip --skip-bundle --template https://raw.github.com/elasticsearch/elasticsearch-rails/master/elasticsearch-rails/lib/rails/templates/01-basic.rb
```

Run the same command with the `02-pretty` template to add features such as a custom `Article.search` method,
result highlighting and [_Bootstrap_](http://getbootstrap.com) integration:

```bash
rails new searchapp --skip --skip-bundle --template https://raw.github.com/elasticsearch/elasticsearch-rails/master/elasticsearch-rails/lib/rails/templates/02-pretty.rb
```

NOTE: A third, much more complex template, demonstrating other features such as faceted navigation or
      query suggestions is being worked on.

## TODO

This is an initial release of the `elasticsearch-rails` library. Many more features are planned and/or
being worked on, such as:

* Rake tasks for convenient (re)indexing your models from the command line
* Hooking into Rails' notification system to display Elasticsearch related statistics in the application log
* Instrumentation support for NewRelic integration

## License

This software is licensed under the Apache 2 license, quoted below.

    Copyright (c) 2014 Elasticsearch <http://www.elasticsearch.org>

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
