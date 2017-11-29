require 'csv'

namespace :import do

  desc 'rake import merchants data from csv'
  task merchants: :environment do
    file = "data/merchants.csv"

    CSV.foreach(file, :headers => true) do |row|
      Merchant.create! ({
        :name => row[1],
        :created_at => row[2],
        :updated_at => row[3]
        })
      end
    end

    desc 'rake import invoice data from csv'
    task invoices: :environment do
      file = "data/invoices.csv"

      CSV.foreach(file, :headers => true) do |row|
        Invoice.create! ({
          :status => row[3],
          :created_at => row[4],
          :updated_at => row[5]
          })
      end
    end

    desc 'rake import customer data from csv'
    task customers: :environment do
      file = "data/customers.csv"

      CSV.foreach(file, :headers => true) do |row|
        Customer.create! ({
          :first_name => row[1],
          :last_name => row[2],
          :created_at => row[3],
          :updated_at => row[4]
          })
      end
    end

    desc 'rake import transaction data from csv'
    task transactions: :environment do
      file = "data/transactions.csv"

      CSV.foreach(file, :headers => true) do |row|
        Transaction.create! ({
          :invoice_id => row[1],
          :credit_card_number => row[2],
          :credit_card_expiration_date => row[3],
          :result => row[4],
          :created_at => row[5],
          :updated_at => row[6]
          })
      end
    end

    desc 'rake import item data from csv'
    task items: :environment do
      file = "data/items.csv"

      CSV.foreach(file, :headers => true) do |row|
        Item.create! ({
          :name => row[1],
          :description => row[2],
          :unit_price => row[3],
          :merchant_id => row[4],
          :created_at => row[5],
          :updated_at => row[6]
          })
      end
    end

    desc 'rake import invoice_items data from csv'
    task invoice_items: :environment do
      file = "data/invoice_items.csv"

      CSV.foreach(file, :headers => true) do |row|
        Invoice_item.create! ({
          :item_id => row[1],
          :invoice_id => row[2],
          :quantity => row[3],
          :unit_price => row[4],
          :created_at => row[5],
          :updated_at => row[6]
          })
      end
    end

    desc 'rake import for all csv data'
    task all: :environment do
        Rake::Task[merchants].invoke
        Rake::Task[items].invoke
        Rake::Task[invoices].invoke
        Rake::Task[invoice_items].invoke
        Rake::Task[transactions].invoke
        Rake::Task[customers].invoke

    end
end
