require 'csv'

namespace :import do
    desc 'import companies from csv'
    task companies: :environment do
        fn = 'db/csv/companies.csv'
        CSV.foreach(fn, headers: true) do |row|
            Company.create(row.to_hash)
        end
    end
end