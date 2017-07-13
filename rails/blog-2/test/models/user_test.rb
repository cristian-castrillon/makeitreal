require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @pepe = User.new(email: 'pepe@email.com', password: '1234567')
  end
end
