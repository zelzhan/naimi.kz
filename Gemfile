source 'https://rubygems.org'

gem 'mercury-rails', :git => 'git://github.com/jejacks0n/mercury.git'

gem 'json', github: 'flori/json', branch: 'v1.8'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'devise'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'puma' # app server
gem 'survey' # our gem
gem 'twitter-bootstrap-rails'
gem 'kaminari' # pagination
gem 'client_side_validations', github: 'DavyJonesLocker/client_side_validations' # validates forms on the client side
gem 'newrelic_rpm' # new relic instrumentation (heroku plugin)

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'better_errors' # improves the error page
  gem 'binding_of_caller'  # used by better_errors
  gem 'awesome_print'  # awesome variable print

  gem 'pry-rails'
  gem 'pry-byebug' #replaces pry-nav in MRI 2.0
  gem 'pry-rescue' # use rescue before a rails command, and if an exception is trigger you will be loaded into a pry session
  gem 'pry-stack_explorer' # explore stack calls with up and down

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

gem 'rails_12factor', group: :production

ruby "2.2.0"
gem 'paperclip'