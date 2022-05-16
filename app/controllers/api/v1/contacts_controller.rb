class Api::V1::ContactsController < Api::V1::BaseController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render :show
    else
      render_error
    end
  end

  def update; end

  def destroy; end

  private

  def contact_params
    params.require(:restaurant).permit(:name, :email, :city, :state, :country, :phone_number, :relation)
  end
end
