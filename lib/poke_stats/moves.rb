class PokeStats::Moves

    def number_input
        number = gets.strip
    
        if number == 'exit'
            return PokeStats::CLI.new.menu
        elsif number.to_i > PokeStats::API.all.length
            puts "That is not a valid number"
            self.number_input
        elsif number.to_i == Float
            puts "That is not a valid number"
            self.number_input
        elsif number.to_i < 1
            puts "That is not a valid number"
            self.number_input
        else
            return number
        end
    end
    






    #     number = nil
    #     while number =! truthy
    #     number = gets.strip.downcase
    #         case number
    #         when "exit"
    #             exit
    #         when float?(number)
    #             puts "Thats not a valid number"
    #         when number < 1
    #             puts "Thats not a valid number"
    #         when number > @@all_pokemon.length
    #             puts "Thats not a valid number"
    #         else 
    #             number
    #         end
    #     end
    # end



    def pokemon_movelist
        puts "Enter the PokeDex number of the Pokemon you would like to know what moves it is able to learn"
        puts "Enter 'exit' to exit"
        PokeStats::API.new.pokemon_info
    end


end
