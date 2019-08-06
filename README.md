
# API-with-rate-limiter

Simple API that throttles requests over 100 per 10 seconds

## Problem to solve

Customers hitting our rate limits don't always handle the 429 reponse in the best way possible. 
Here is an API which implements the same rate limits that we impose and against which the exponential backoff algorithm can be tested. 

## Steps to install

1. Clone this repo to your machine
2. Install dependencies with bundle install.
3. Update config/database.yml to use the adapter of choice
4. If you are not using sqlite, you may need to create the database using rake db:create
5. Migrate the database using rake db:migrate
4. System dependencies


