require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test "Name and relation must be present" do
    user = User.create(name: 'testman1', email: 'testman1@testman1.com', password: '123123')
    contact = Contact.new(name: 'Gabriel', user: user)
    assert_not contact.save
  end

  test "Shouldn't create a contact without a user" do
    contact = Contact.new(phone_number: '84 99452-9376', relation: 'professional')
    assert_not contact.save
  end

  test "Create a contact with a user logged in" do
    user = User.create(name: 'testman2', email: 'testman2@testman2.com', password: '123123')
    contact = Contact.new(name: 'Geraldo', relation: 'professional', user: user)
    assert contact.save
  end
end
