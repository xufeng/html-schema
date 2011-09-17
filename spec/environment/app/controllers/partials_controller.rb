
class PartialsController < ApplicationController
  layout false

  def show
    render :partial => "partials/#{params[:id]}", :layout => false
  end
end
