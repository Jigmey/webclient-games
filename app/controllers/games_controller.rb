class GamesController < ApplicationController
	def index
		@game=Game.all 
		render 'index.html.erb'
	end
	def show
		@game=Game.find(params[:id])
		
		render 'show.html.erb'
	end
	def new
		
	end
	def create
		@games=Unirest.post("http://localhost:3000/api/v1/games", 
			headers:{ "Accept" => "application/json" }, 
            parameters:{ :company => params[:form_company],
            :name => params[:form_name] }).body
		redirect_to "games/#{@game.params['id']}"
	end
	def edit
		@game=Game.find(params[:id])
		render 'edit.html.erb'		
	end
	def destroy
		game=Game.find(params[:id])
		game.destroy
		p "Item is deleted"
		redirect_to "/games"
	end
end
