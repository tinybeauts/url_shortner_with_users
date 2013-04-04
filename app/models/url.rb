
require 'open-uri'
require 'net/http'

class Url < ActiveRecord::Base
  
  before_create  :make_key
  validates :check_url, :numericality => {:greater_than_or_equal_to => 200, :less_than_or_equal_to => 400}
  # validates :check_db

  def make_key
    self.key = SecureRandom.hex(3)
  end

  def get_key
    self.key
  end

  def self.find_url_by_key(key)
    test_url = Url.where('key = ?', key)
    test_url.first
  end

  def check_url
    url = self.url
    begin
      status = Net::HTTP.get_response(URI(url))
      status = status.code
    rescue  
      status = 0
    end
  end

  # def check_db 
  #   url = self.url
  #   if Url.exists?(:url => url)
  # end
end
