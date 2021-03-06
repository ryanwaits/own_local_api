### REST API | OwnLocal
##### Servicing Company Data in JSON

***

#### Installation
    # clone and cd into the repository
    $ git clone git@github.com:ryanwaits/own_local_api.git && cd own_local_api

    # bundle dependencies
    $ bundle

    # create a postgresql db
    $ rake db:create:all

    # migrate the database
    $ rake db:migrate

    # import CSV data
    $ rake import:companies OR bundle exec rake import:companies

    # start the rails server
    $ rails server
    
#### Requests

    # GET a list of all the companies (default: 50 per page)

    | /api/v1/companies.json
    | /api/v1/companies.json?page={page_number}
    | /api/v1/companies.json?page={page_number}&per_page={per_page}

    
    # GET one company by {id} 

    | /api/v1/companies/{id}.json

#### Testing

First run ``` rails generate rspec:install ``` to prepare ```spec_helper``` & ```rails_helper``` files

To test all specs

    $ rspec spec

Or one at a time

    $ rspec spec/controllers/api/v1/{spec_file}

