class Mailer < ActionMailer::Base
  default :from => "dormbook@danopia.net"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.success.subject
  #
  def success email
    @email = email
    @roomy = email.roomie
    
    @url = 'http://dormbook.danopia.net'
    @roomie_url = "#{@url}/roomies/#{@roomy.id}"
    @bldg_url   = "#{@url}/buildings/#{@roomy.building.id}"
    
    @others = Roomie.all(:conditions => {
      :building_id => @roomy.building.id,
      :room => @roomy.room})
    @others = @others.select {|i| i.id != @roomy.id }

    @bldg = Roomie.all(:conditions => {:building_id => @roomy.building.id})
    @bldg = @bldg.select {|i| i.id != @roomy.id }

    @floors = @bldg.select{|o| o.floor == @roomy.floor }

    mail :to => @email.from, :subject => "Thank you for contributing to Dormbook, #{@roomy.name}!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.failure.subject
  #
  def failure email
    @email = email
    @url = 'http://dormbook.danopia.net'

    mail :to => @email.from, :subject => 'There was a problem reading your rooming email'
  end
end
