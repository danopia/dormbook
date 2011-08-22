module ApplicationHelper
  #helpers :all
  
  def self.controller= cont
    @@cont = cont
  end
  
  def facebook?
    @@cont.facebook?
  end
  
  def roomie
    @@cont.roomie
  end
  def roomie?
    @@cont.roomie != nil
  end
  
  def graph param
    @@cont.graph param
  end
end
