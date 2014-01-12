ruby '2.0.0'
source 'https://rubygems.org'

gem 'rails', '3.2.14'
gem 'pg'
gem 'jquery-rails'
gem 'haml-rails'
gem 'jquery-rails'
gem 'http-cookie'
gem 'devise'
gem 'css3buttons', '0.9.5'
gem 'httparty'
gem 'rmagick', '2.13.2'
gem "mini_magick"
gem 'carrierwave'
gem "fog"
gem 'geocoder'
gem 'paper_trail', '~> 3.0.0'
gem 'jquery-datatables-rails'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  # will need this gem to convert erb files generated by Devise
  gem "rails-erd"
  gem 'erb2haml' # then run: rake haml:replace_erbs
  gem 'pry-rails'
  gem 'annotate'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem "rspec-rails"
end

group :test do
  gem 'simplecov', :require => false
end

# group :production do
#   gem 'newrelic_rpm'
# end