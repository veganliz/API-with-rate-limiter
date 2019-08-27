
# API-with-rate-limiter 

Simple API that throttles requests over 166 per 10 second.
Includes a script that uses exponential backoff to test making requests to the API

## Problem to solve

Customers hitting our rate limits don't always handle the 429 reponse in the best way possible. 
Here is an API which implements the same rate limits that we impose and against which the exponential backoff algorithm can be tested using the script included.

## Steps to install

1. Clone this repo to your machine
2. Install dependencies with 'bundle install'.
3. Update config/database.yml to use the adapter of choice
4. If you are not using sqlite, you may need to create the database using 'rake db:create'
5. Migrate the database using 'rake db:migrate'
6. Run 'rails s' and navigate to localhost:3000/api/v1/articles to see list of articles returned
7. Once the server is up and running run client/client_random.rb to see exponential backoff in action.

