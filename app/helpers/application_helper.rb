module ApplicationHelper
  #helpers :all
  
  def self.controller= cont
    @@cont = cont
  end
  
  def graph param
    @@cont.graph param
  end
end
