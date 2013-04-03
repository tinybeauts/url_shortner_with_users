get '/' do
  erb :index
end

post '/urls' do
  @url_name = params[:url]
  @new_url = Url.create(:url => params[:url], :counter => 0)
  @key = @new_url.key
  erb :index
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

