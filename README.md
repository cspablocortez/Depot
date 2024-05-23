# Depot

Depot is a web application for a fictional storefront.

### Create new app

```sh
rails new depot --css tailwind
```

Go to newly created directory:

```sh
cd depot
```

Create the first scaffold for the Product model:

```sh
rails g scaffold Product \
title:string description:text image_url:string price:decimal
```

After creating this scaffold, we will update the newly created migration file to change the decimal precision of the price attribute.

Run the migration:

```sh
rails db:migrate
```

To run in development:

```sh
bin/dev
```

### Update Listings Page with Seed Data

Add the following in their corresponding directories. 

!https://media.pragprog.com/titles/rails7/code/rails7/depot_a/db/seeds.rb

!https://media.pragprog.com/titles/rails7/code/rails7/depot_a/app/assets/images/


Update `app/views/products/index.html.erb` to create a table.

