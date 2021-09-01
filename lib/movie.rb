class Movie

    attr_accessor :title, :genre, :rating

    def initialize(title, genre)
        @title = title
        @genre = genre
    end

    def print_movie
        puts ""
        puts " Title: #{self.title} "
        puts "Genre: #{self.genre}  "
        puts "Rating: #{self.rating || "none"} "
        puts ""
      end

    



end