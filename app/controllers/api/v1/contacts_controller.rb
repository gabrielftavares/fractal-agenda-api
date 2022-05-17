class Api::V1::ContactsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: %i[index show]
  before_action :set_contact, only: %i[show update destroy]

  def index
    @user = User.where(email: params[:email]).first
    if @user&.valid_password?(params[:password])
      sign_in(@user)
      @contacts = Contact.where(user: @user)
    else
      render json: { message: "You must be logged in or create an account to see your contacts" }, status: :ok
    end
  end

  def show; end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
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

  def destroy
    if @contact.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

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
