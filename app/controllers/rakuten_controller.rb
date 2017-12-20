class RakutenController < ApplicationController
  include RakutenWebServiceHelper

  def query
    render :json => queryItem(params[:keyword])
  end
end
