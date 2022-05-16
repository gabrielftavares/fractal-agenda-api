class Api::V1::ContactsController < Api::V1::BaseController
  before_action :set_contact, only: %i[show update]

  def index
    @contacts = Contact.all
  end

  def show; end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @contact.update(contact_params)
      render :show
    else
      render_error
    end
  end

  def destroy; end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :city, :state, :country, :phone_number, :relation)
  end

  def render_error
    render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
  end
end
