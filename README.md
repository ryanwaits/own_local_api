### REST API | OwnLocal
##### Servicing Company Data in JSON

***

#### Installation
    # clone and cd into the repository
    $ git clone ------------ && cd ----------------

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

