source 'https://rubygems.org'

group :lint do
  gem 'foodcritic', '~> 3.0'
  gem 'rubocop',    '~> 0.18'
end

group :unit do
  gem 'berkshelf',  '~> 3.0.0.beta'
  gem 'chefspec',   '~> 3.3'
end

group :kitchen_common do
  gem 'test-kitchen', '~> 1.2'
end

group :kitchen_vagrant do
  gem 'kitchen-vagrant', '~> 0.14'
end

group :kitchen_cloud do
  gem 'kitchen-digitalocean'
  gem 'kitchen-ec2'
  gem 'kitchen-joyent'
  gem 'kitchen-gce', :git => 'git://github.com/someara/kitchen-gce.git', :branch => 'authorized_ssh_keys'
end

group :development do
  gem 'ruby_gntp'
  gem 'growl'
  gem 'rb-fsevent'
  gem 'guard', '~> 2.4'
  gem 'guard-kitchen'
  gem 'guard-foodcritic'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'rake'
end
