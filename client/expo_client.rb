require 'rubygems'
require 'httparty'

class ExponentialBackOff
 include HTTParty
 base_uri "localhost:3000/api/v1"

  def articles
    max_retries = 10
    retries = 0

      while retries <= max_retries
	# Make a request to REST API
	    response = self.class.get('/articles/1')
      puts response.code
      puts response


	# If not rate limited, break out of while loop and continue with the rest of the code
	     if response.code != 429
         puts 'success'
		   break

	# If rate limited, wait and try again
      else puts "You've hit our rate limit. Please wait"
        max_sleep_seconds = Float(2 ** retries)
        sleep rand(0..max_sleep_seconds)
         number = sleep rand(0..max_sleep_seconds)
         puts number
         print_seconds(number)
         retries = retries + 1
       end
     end
   end
end

  def print_seconds(number_of_seconds)
  i = 0
    while i <= number_of_seconds
      puts i
      sleep 1
      i = i + 1
    end
  end

exponential_BackOff = ExponentialBackOff.new
500.times do
  puts exponential_BackOff.articles
end
