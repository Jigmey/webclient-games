class Game 
	attr_accessor :company, :name, :price, :date, :id
	def initialize(input)
		@id = input[:id]
		@company=input[:company]
		@name =input[:name]
		@price =input[:price]
		@date =input[:date]
	end
	def self.find(puddin)
		game_hash=Unirest.get("http://localhost:3001/api/v1/games/#{puddin}").body
		p game_hash
		game_hash=Game.new(
				id: game_hash['id'],
				company: game_hash['company'],
				name: game_hash['name'],
				price: game_hash['price'],
				date: game_hash['date']
		)

	end
	def self.all
		game_hash=Unirest.get("http://localhost:3001/api/v1/games").body
		games=[]
		game_hash.each do |game|
			games<<Game.new(
			id: game['id'],
			company: game['company'],
			name: game['name'],
			price: game['price'],
			date: game['date']		
				)	
		end	
		return games
	end
	def destroy
		game_hash=Unirest.get("http://localhost:3001/api/v1/games/#{id}").body
		game_hash.destroy
	end

end
