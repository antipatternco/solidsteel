# Solid Steel Website and API

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](http://git-scm.com/)
* [Vagrant](https://www.vagrantup.com/)

## Installation

* `git clone <repository-url>` this repository
* change into the new directory
* `vagrant up`
* `vagrant ssh`
* `bin/setup` (rake db:create db:migrate)
* `mysql -u root -p MyApp_Development < lib/tasks/ss_tue_17_mar.sql`
* `bin/rails s -b 0.0.0.0`


## Running / Development

* Visit the site/API at [http://localhost:3001](http://localhost:3001) and [http://localhost:3001/api/v1/broadcasts](http://localhost:3001/api/v1/broadcasts) and [http://localhost:3001/documentation](http://localhost:3001/documentation)