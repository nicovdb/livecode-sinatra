require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require 'pry-byebug'

#récupère l'url et si c'est la racine il lance ce bloc
get "/" do
  #récupère tous les restaurants
  @restaurants = Restaurant.all
  #renvoyer la vue index.erb
  erb :index
end

#si l'url correspond à /restaurants/id, il lance ce bloc
get "/restaurants/:id" do
  #on récupère l'id qui est passé dans les params (grâce au :id de ta route)
  id = params[:id]
  #on récupère l'instance de restau qui a cet id
  @restaurant = Restaurant.find(id)
  #on renvoie à show.erb
  erb :show
end

#va être lancé quand on soumet un formulaire qui a pour action /restaurants et pour method "post"
post "/restaurants" do
  #on crée une instance de restau avec les variables d'instance qu'on récupère grâce aux params
  restaurant = Restaurant.new(
    name: params[:name],
    address: params[:address],
    rating: params[:rating].to_i
  )
  restaurant.save!
  #après la sauvegarde, on renvoie sur l'index
  redirect '/'
end
