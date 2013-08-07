class AppsController < ApplicationController
  before_filter :authenticate_user!
  load_resource :except => [:index, :create]
  authorize_resource

  def index
    @apps = App.all
  end

  def show
  end

  def edit
  end

  def create
    @app = App.new(app_params)

    if @app.save
      redirect_to @app, notice: 'Application was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @app.update(app_params)
      redirect_to @app, notice: 'Application was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @app.destroy
    redirect_to apps_url
  end

private

  # Never trust parameters from the scary internet, only allow the white list through.
  def app_params
    params.require(:app).permit(:accepted, :score, :reviewer_id, :rejected)
  end
end
