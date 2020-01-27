class PokeStats::Pokemon
    attr_accessor :name, :moves, :number

    @@all_pokemon = []

    def initialize(name, number)
        @name = name
        @number = number
        @@all_pokemon << self
    end

    def self.all
        @@all_pokemon
    end

    def sort_by_dex
        PokeStats::API.new.dex
    end

    def self.find_moves
        puts "Enter the PokeDex number of the Pokemon you would like to know what moves it is able to learn"
        puts "Enter 'exit' to exit"
        number = self.number_input
        self.all.each do |pokemon| 
            
            if pokemon.number == number
               
                pokemon.moves = PokeStats::API.new.get_moves(number)
                puts pokemon.moves
            else
                nil
            end
        end
    end

    def self.number_input
        number = gets.strip
        if number == 'exit'
            PokeStats::CLI.new.menu
        elsif number.to_i > self.all.length
            puts "That is not a valid number"
            self.number_input
        elsif number.to_i == Float
            puts "That is not a valid number"
            self.number_input
        elsif number.to_i < 1
            puts "That is not a valid number"
            self.number_input
        elsif number.to_i.to_s == number
            number.to_i
        else
            puts "That is not a valid number"
            self.number_input
        end
    end
end
