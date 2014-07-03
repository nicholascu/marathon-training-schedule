require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "invalid_without_a_name" do 
  	z = User.new
  	assert !z.valid?, "Name is not being validated"
  end

	test "valid with all attributes" do 
		# z = User.new
		# z.name = "Nic"
		# z.email = "nic@nic.com"
		# z.username = "nic"
		z = users(:nic)
		assert z.valid?, "User was not valid"
	end

test "invalid name gives error message" do
	z = users(:nic)
	z.name = nil
	z.valid?
	assert_match /can't be blank/, z.errors[:name].join
end

end
