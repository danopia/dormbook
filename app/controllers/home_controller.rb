class HomeController < ApplicationController
  def index
    @recent = Roomie.all(:order => 'created_at DESC', :limit => 5, :include => :building)
    @roomy = Roomie.new
  end
end
