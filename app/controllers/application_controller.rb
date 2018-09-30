class ApplicationController < ActionController::Base
  before_action :cargar_registros

  def cargar_registros
    @categorias = Category.all
  end

  def authenticate_editor!
    redirect_to root_path, notice: "No tienes permisos" unless user_signed_in? && current_user.is_editor?
  end

  def authenticate_admin!
    redirect_to root_path, notice: "No tienes permisos" unless user_signed_in? && current_user.is_admin?
  end
end
