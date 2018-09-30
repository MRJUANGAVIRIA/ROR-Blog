class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(contacs_params)
    respond_to do |format|
      if @contact.save
        InfoMailer.form_contact(@contact).deliver
        format.html {redirect_to root_path, notice: "Se envio su correo"}
        format.json {render :show, status: :created, location: @contact}
      else
        format.html { render :new }
        format.json {render json: @contact.errors, status: :unprocessable_entity}
      end
    end
  end

  private
  def contacs_params
    params.require(:contact).permit(:title, :email, :description)
  end

end