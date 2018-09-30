class WelcomeController < ApplicationController
  def index
  end

  def contacto
    @contacts = Contact.new
  end
end