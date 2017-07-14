require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @pepe = User.new(email: 'pepe@email.com', password: '1234567')
  end

  test "it should create an user with email and password" do
    assert @pepe.save
  end
end
