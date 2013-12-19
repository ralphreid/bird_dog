class HomeController < ApplicationController

  def index

    sample = Property.order('price DESC').limit(30)
    set = sample.map do |prop|
      prop.image_url
    end

    set.delete("")
    
    @slider = set
    

  end


end
