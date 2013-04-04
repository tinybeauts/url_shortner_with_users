class User < ActiveRecord::Base
  has_many :urls

  def self.authentic?(email, password)
    user = User.where('email = ?', "#{email}")
    user.first.password == password if user.length > 0 
  end
end
# ["email", "allen@bednarheidenreich.com"], ["name", "Enola Grady Sr."], ["password", 3656], ["updated_at", 2013-04-03 17:58:34 -0700]]
