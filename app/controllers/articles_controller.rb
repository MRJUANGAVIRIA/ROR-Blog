class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_editor!, only: [:edit, :update, :new, :create]
    before_action :authenticate_admin!, only: [:destroy]

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    #raise params[:categories].nil?.to_yaml
    if params[:categories].nil?
      redirect_to new_article_path, alert: "Necesitas agregar mínimo una categoria"
    else
      @article = current_user.articles.new(article_params) #crea el articulo relacionado al usuario que esta logueado
      @article.categories = params[:categories]
      #raise @article.to_yaml
      respond_to do |format|
          #raise params.to_yaml Sirve para verificar que esta llegando por parametros
          if @article.save
              format.html {redirect_to articles_path, notice: "Articulo Creado"}
              format.json {render :show, status: :created, location: @article}
          else
              format.html { render :new }
              format.json {render json: @article.errors, status: :unprocessable_entity}
          end
      end
    end
   end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
        if @article.update(article_params)
            format.html  {redirect_to @article, notice: "Articulo Modificado"}
            format.json { render :show, status: :ok, location: @article}
        else
            format.html {render :edit}
            format.json {render json: @article.errors, status: :unprocessable_entity}
        end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html {redirect_to articles_path, notice: "Articulo Eliminado"}
      format.json {head :no_content}
    end
  end

  def index
    @articles =  Article.all
    if user_signed_in? && current_user.is_editor? && !params.has_key?(:normal)
      render :"admin_article"
    end
  end

  private

  def article_params
      params.require(:article).permit(:title, :body, :categories)
  end

  def set_article
      @article = Article.find(params[:id])
  end

  def imprimir
    puts params.to_yaml
  end


end
