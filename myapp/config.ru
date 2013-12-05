
require 'sinatra'
require 'active_record'

require 'rabl'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'builder'

require './models/event_template.rb'
require './models/item.rb'
require './models/item_category.rb'
#require './models/user.rb'
Rabl.register!
ActiveRecord::Base.establish_connection(  
    :adapter  => "mysql2",  
    :encode => 'utf8',  
    :host     => "localhost",  
    :username => "bernard",  
    :password => "bernard",  
    :database => "bernard"  
)  
class App < Sinatra::Base
  get '/categories' do 
    @category = ItemCategory.first
    @items = @category.items
    rabl :category, format: :json
  end
end
run App.new