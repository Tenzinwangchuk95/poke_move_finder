class PokeStats::CLI

    def call
        puts "Welcome to the Pokemon Center!"
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
                pokemon
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

    def pokemon
        PokeStats::Pokemon.new.sort_by_dex
        PokeStats::Moves.new.pokemon_movelist
    end


end