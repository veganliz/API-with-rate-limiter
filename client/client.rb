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
else puts "You've hit the rate limit. We will try again soon."
        number = 2 ** retries
        puts "Seconds before retry:  " + number.to_s
         # Thread.new {

  # Print total number of seconds wait before code will retry

  # Print seconds to the console as the time passes
         print_seconds(number)
       #}
         retries = retries + 1
       end
     end
   end
end

# Print number of seconds to console
def print_seconds(number_of_seconds)
  i = number_of_seconds
  while i > 0
    puts i
    sleep 1
    i = i - 1
  end
end

exponential_BackOff = ExponentialBackOff.new
500.times do
  puts exponential_BackOff.articles
end
