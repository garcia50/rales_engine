# Rales_Engine

This is a Turing BackEnd Mod 3 paired project that uses Rails to build JSON API endpoints to expose SalesEngine data. It is a Ruby on Rails application using Ruby 2.4.1, Rails 5 with Active Record, and a PostgreSQL database.

## How to install

#### One:
git clone: `https://github.com/hmorri32/rales_engine.git`

`cd rales_engine`

#### Two:
CLI -> `bundle`

#### Three:
`rake db:create db:migrate`

If you run into an error about citext, run the following commands:
  1. Run the your database -> `psql`
  2. Then, in the psql cli type: `\c 'rales_engine_development'`
  3. Then `CREATE EXTENSION citext;`
  4. `\q` to exit the psql cli

#### Four:
 Pull all of the CSV files into the database.
 Run the following command from the terminal:

 To load all: `Rake import: all`

#### Five:
test.
`$ rails db:test:prepare`
`$ rspec`

#### Six:
To start the sever run: `rails s`

## Endpoints

#### Record Endpoints

GET /api/v1/merchants/

GET /api/v1/merchants/:id


GET /api/v1/invoices/

GET /api/v1/invoices/:id

GET /api/v1/invoice_items/

GET /api/v1/invoice_items/:id

GET /api/v1/items/

GET /api/v1/items/:id

GET /api/v1/transactions/

GET /api/v1/transactions/:id

GET /api/v1/customers/

GET /api/v1/customers/:id

#### Relationship Endpoints

##### Merchants

GET /api/v1/merchants/:id/items returns a collection of items associated with that merchant

GET /api/v1/merchants/:id/invoices returns a collection of invoices associated with that merchant from their known orders

##### Invoices


GET /api/v1/invoices/:id/transactions returns a collection of associated transactions

GET /api/v1/invoices/:id/invoice_items returns a collection of associated invoice items

GET /api/v1/invoices/:id/items returns a collection of associated items

GET /api/v1/invoices/:id/customer returns the associated customer

GET /api/v1/invoices/:id/merchant returns the associated merchant

##### Invoice Items

GET /api/v1/invoice_items/:id/invoice returns the associated invoice

GET /api/v1/invoice_items/:id/item returns the associated item

##### Items

GET /api/v1/items/:id/invoice_items returns a collection of associated invoice items

GET /api/v1/items/:id/merchant returns the associated merchant

##### Transactions

GET /api/v1/transactions/:id/invoice returns the associated invoice

##### Customers

GET /api/v1/customers/:id/invoices returns a collection of associated invoices

GET /api/v1/customers/:id/transactions returns a collection of associated transactions

#### Business Intelligence Endpoints

##### All Merchants

GET /api/v1/merchants/most_revenue?quantity=x returns the top x merchants ranked by total revenue

GET /api/v1/merchants/most_items?quantity=x returns the top x merchants ranked by total number of items sold

GET /api/v1/merchants/revenue?date=x returns the total revenue for date x across all merchants. Assume the dates provided match the format of a standard ActiveRecord timestamp.

##### Single Merchant

GET /api/v1/merchants/:id/revenue returns the total revenue for that merchant across successful transactions

GET /api/v1/merchants/:id/revenue?date=x returns the total revenue for that merchant for a specific invoice date x

GET /api/v1/merchants/:id/favorite_customer returns the customer who has conducted the most total number of successful transactions.

GET /api/v1/merchants/:id/customers_with_pending_invoices returns a collection of customers which have pending (unpaid) invoices. A pending invoice has no transactions with a result of success.

##### Items

GET /api/v1/items/most_revenue?quantity=x returns the top x items ranked by total revenue generated

GET /api/v1/items/most_items?quantity=x returns the top x item instances ranked by total number sold

GET /api/v1/items/:id/best_day returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.

##### Customers

GET /api/v1/customers/:id/favorite_merchant returns a merchant where the customer has conducted the most successful transactions
