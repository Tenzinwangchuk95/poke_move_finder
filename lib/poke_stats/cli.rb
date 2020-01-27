class PokeStats::CLI

    def call
        puts "Welcome to the Pokemon Center!"
        PokeStats::API.new.dex
    end

    def menu
        puts "How would you like to search for Pokemon today?"
        input = nil
        while input != 'exit'
            # puts "Enter 'type' to search by Pokemon move"
            puts "Enter 'number' to search by Pokedex number"
            puts "Enter 'exit' to leave the Pokemon Center"
            input = gets.strip.downcase
            case input
            # when 'move'
            #     move
            when 'number'
                display_all_pokemon
            when 'exit'
                goodbye
            else 
            puts "Thats not a valid input"
            end
        end
    end

    def goodbye
        puts "Thanks for visting the Pokemon Center!"
        exit!
    end

    def display_all_pokemon
        PokeStats::Pokemon.all.each {|pokemon| puts "#{pokemon.number}.#{pokemon.name}"}
        PokeStats::Pokemon.find_moves
    end

end