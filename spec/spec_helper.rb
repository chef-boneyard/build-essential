require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start!

RSpec.configure do |config|
  config.order = 'random'
end
