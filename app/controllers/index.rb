get '/' do
  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/urls' do
  # p params
  @long = params[:long_input] 
  @url = Url.new(long_url: @long)
  @url.valid?
  p "*" * 70
  p @errors = @url.errors.messages.values.flatten

  @url.save
  # create a new Url


  erb :new_url
end

# e.g., /q6bda
get '/:blah' do
  puts '*'*100
  p params
  # redirect to appropriate "long" URL
  # autoincrement the click_count value:  url.click_count += 1
  #url_object = Url.find_by_short_url(params[:blah])
  # url_object = Url.find_by short_url: params[:blah]
  url_object = Url.where(short_url: params[:blah]).first
  url_object.click_count += 1
  url_object.save 
  url_object.errors.messages
  redirect url_object.long_url
end
