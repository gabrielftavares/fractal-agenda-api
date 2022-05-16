class Api::V1::ContactsController < Api::V1::BaseController
  def index
    @contacts = Contact.all
  end
end
