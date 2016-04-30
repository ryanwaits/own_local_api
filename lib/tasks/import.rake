require 'csv'
desc 'import from csv file'
task :import => [:environment] do
    fn = 'db/csv/businesses.csv'

    CSV.foreach(fn, headers: true) do |doc|
        Company.create(doc.to_hash)
    end
end