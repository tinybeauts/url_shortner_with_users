enable :sessions

get '/' do
  session["user"] ||= nil
  # raise session["user"]
  if session["user"] != nil
    @user = User.where('email = ?', session["user"]).first
    @all_urls = @user.urls
    @all_links = @all_urls.map { |my_url| my_url.url }
    erb :users
  else
    erb :index
  end
end

post '/urls' do

  @url_name = params[:url]
  @new_url = Url.create(:url => params[:url], :counter => 0)
  @key = @new_url.key
  if session["user"] != nil
     erb :posts
  else
     erb :login_posts 
  end
end

get "/logout" do 
  session["user"] = nil 
  redirect to '/'
end

# e.g., /q6bda
get '/:short_url' do
 @key = params[:short_url]
 @url_object = Url.find_url_by_key(@key)
 link = @url_object.url
 @url_object.increment!(:counter, by = 1)
 @counter = @url_object.counter
 redirect to("#{link}")
end

post '/login' do 
  @email = params[:email]
  @password = params[:password]
  if User.authentic?(@email, @password)
    # @user = User.get_user(@email)
    session["user"] = @email
  end
  redirect to ("/")
end


