require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "invalid_without_a_name" do 
  	z = User.new
  	assert !z.valid?, "Name is not being validated"
  end
end
