class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :facebook
  
  def facebook
    ApplicationHelper.controller = self
    fields = cookies[:fbs_164143943660572]
    return unless fields
    
    @fb_fields = Hash[fields[1..-2].scan(/([^&=]+)=([^&=]+)/)]
  end
  
  def facebook?
    graph('me').size > 0
  rescue
    false
  end
  
  def graph path='me'
    require 'open-uri'
    require 'json'
    
    @graph ||= {}
    @graph[path] ||= JSON(open("https://graph.facebook.com/#{path}?access_token=#{CGI.escape @fb_fields['access_token']}").read)
  end
  
  def fb_roomie_info
    me = graph('me')
    
    {:email => me['email'],
     :gender => me['gender'][0,1],
     :name => me['name'],
     :fb_id => me['id']}
  end
end
