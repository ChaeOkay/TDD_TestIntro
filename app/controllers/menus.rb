get '/' do
  @menus = Menu.all
  erb :index
end

post '/menus' do
  @menu = Menu.new params
  if @menu.save
    redirect '/'
  else
    @menus = Menu.all
    @errors = @menu.errors.full_messages
    erb :index
  end
end

get '/menus/:id' do
  @menu = Menu.find params[:id]
  @items = @menu.menu_items
  erb :show
end
