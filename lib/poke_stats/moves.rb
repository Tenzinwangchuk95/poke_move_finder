class PokeStats::Moves

    def pokemon_movelist
        puts "Enter the PokeDex number of the Pokemon you would like to know what moves it is able to learn"
        puts "Enter 'exit' to exit"
        PokeStats::API.new.pokemon_info
    end
    
    def number_input
        number = gets.strip
    
        if number == 'exit'
            PokeStats::CLI.new.menu
        elsif number.to_i > PokeStats::Pokemon.all.length
            puts "That is not a valid number"
            self.number_input
        elsif number.to_i == Float
            puts "That is not a valid number"
            self.number_input
        elsif number.to_i < 1
            puts "That is not a valid number"
            self.number_input
        elsif number.to_i.to_s == number
            number
        else
            puts "That is not a valid number"
            self.number_input
        end
    end



end
