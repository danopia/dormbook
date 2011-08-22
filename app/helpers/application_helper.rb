module ApplicationHelper
  #helpers :all
  
  def self.controller= cont
    @@cont = cont
  end
  
  def facebook?
    @@cont.facebook?
  end
  
  def graph param
    @@cont.graph param
  end
end
