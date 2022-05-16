require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test "Name and relation must be present" do
    contact = Contact.new(name: 'Gabriel', relation: 'professional')
    assert contact.save
  end

  test "Shouldn't save without name" do
    contact = Contact.new(phone_number: '84 99452-9376', relation: 'professional')
    assert_not contact.save
  end
end
