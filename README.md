# Drop

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