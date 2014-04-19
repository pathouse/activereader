source 'https://rubygems.org'

gem 'rails',                    '4.1.0'

# DATABASE
gem 'pg',                       '~> 0.17.1'

# AUTH
gem 'devise',                   '~> 3.2.3'
gem 'pundit',                   github: "pathouse/pundit", branch: "rspec-3-compatability"

# ASSETS
gem 'sass-rails',               '~> 4.0.3'
gem 'bootstrap-sass',           '~> 3.1.1'
gem 'uglifier',                 '~> 1.3.0'
gem 'coffee-rails',             '~> 4.0.0'
gem 'jquery-rails',             '~> 3.1.0'
gem 'simple_form',              '~> 3.0.2'

#HELPERS
gem 'stamp',                    '~> 0.5.0'

group :development do
  gem 'foreman',                '~> 0.63.0'
  gem 'spring',                 '~> 1.1.2'
  gem 'spring-commands-rspec',  '~> 1.0.2'
  gem 'byebug',                 '~> 2.7'
  gem 'guard',                  '~> 2.5'
  gem 'guard-rspec',            '~> 4.2.8', require: false
  gem 'guard-livereload',       '~> 2.1.2', require: false
  gem "rack-livereload",        '~> 0.3.15'
  gem 'better_errors',          '~> 1.1.0'
  gem 'binding_of_caller',      '~> 0.7.2'
  gem 'annotate',               '~> 2.6.2'
  gem 'thin',                   '~> 1.6.2'
end

 group :development, :test do
  gem 'awesome_print',          '~> 1.2.0'
  gem 'dotenv-rails',           '~> 0.10.0'
  gem 'pry-rails',              '~> 0.3.2'
  gem 'rspec',                  '~> 3.0.0.beta2'
  gem 'rspec-rails',            '~> 3.0.0.beta2'
  gem 'rb-fsevent' if 'uname' =~ /Darwin/
  gem 'faker',                  '~> 1.2'
end

group :test do
  gem 'fabrication',            '~> 2.11.1'
  gem 'selenium-webdriver',     '~> 2.40.0'
  gem 'database_cleaner',       '~> 1.2.0'
  gem 'capybara',               github: "pathouse/capybara", branch: "rspec-3-compatibility"
  gem 'simplecov',              '~> 0.7.1', require: false
  gem 'webmock',                '~> 1.17.4'
end

group :production do
  gem 'unicorn',                '~> 4.8.2'
  gem 'rails_12factor',         '~> 0.0.2'
end



