class PokeStats::API
    
    
    
    def dex
        # changes to the generation of pokemon can be made here

        response = RestClient.get("https://pokeapi.co/api/v2/pokedex/2/")
        pokemon_array = JSON.parse(response)["pokemon_entries"]
        # binding.pry
        pokemon_array.each {|pokemon| PokeStats::Pokemon.new(pokemon["pokemon_species"]["name"].upcase, pokemon["entry_number"])}
    end

    def get_moves(number)
        movelist = []
        response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{number}")
        pokemon_info_array = JSON.parse(response)
        @counter = -1
        pokemon_info_array["moves"].each do |moves|
            moves["version_group_details"].each do |version_groups|
                # changes to which game can be made here
                (version_groups["version_group"].has_value?("red-blue")) ? (movelist << moves["move"]["name"]) : nil
            end
        end
        movelist
    end

end