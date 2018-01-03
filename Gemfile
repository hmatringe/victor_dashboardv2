source 'https://rubygems.org'
ruby '2.3.5'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'devise'
gem 'devise-i18n'
# dependency devise_logout start
gem 'jquery-rails'
# dependency devise_logout end
gem 'figaro'
gem 'jbuilder', '~> 2.0'
gem 'redis'
gem 'autoprefixer-rails'
gem 'bootstrap-sass'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'simple_form'
gem 'webpacker'
gem 'rails', '5.1.0'
gem 'pg'
gem 'thin'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails', '~> 4.2'
gem "bower-rails", "~> 0.9.2"
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
gem 'remotipart', github: 'mshibuya/remotipart'
gem 'rails_admin', '>= 1.0.0.rc'

gem 'annotate'


group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capybara'
  gem 'nokogiri', '>= 1.8.1'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

