### REST API | OwnLocal
##### Servicing Company Data in JSON

***

#### Installation
    # clone and cd into the repository (use https://github.com/ryanwaits/own_local_api.git if ssh is not set up)
    $ git clone git@github.com:ryanwaits/own_local_api.git && cd own_local_api

    # bundle dependencies
    $ bundle

    # create a postgresql db
    $ rake db:create:all

    # migrate the database
    $ rake db:migrate

    # import CSV data
    $ rake import

    # start the rails server
    $ rails server
    
#### Requests

    # GET a list of all the companies (default: 50 per page)

    | /api/v1/companies.json
    | /api/v1/companies.json?page={page_number}

    
    # GET one company by {id} 

    | /api/v1/companies/{id}.json

#### Testing

First run ``` rails generate rspec:install ``` to prepare ```spec_helper``` & ```rails_helper``` files

To test all requests

    $ rspec spec/requests/

Or one at a time

    $ rspec spec/requests/{spec_file}

