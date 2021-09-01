MOVIES = []


def start_cli
    puts "Hi! Welcome to the Things CLI"
    main_menu
    handle_user_choice
    
    puts "Thanks for using the Things CLI!"
  end
  
  def main_menu
    puts "Here's what you can do:".cyan
    puts "  1. Add Thing".cyan
    puts "  2. List Things".cyan
    puts "  3. Add movie rating".cyan
    puts "  4. Delete movie".cyan
    puts "  exit".cyan
    puts "Type the number corresponding to your choice, or 'exit' to leave the program".cyan
  end

  def handle_user_choice
    input = gets.chomp
    while input != "exit" do
      if input == "1"
        add_movie
      elsif input == "2"
        list_movies
      elsif input == "3" 
        rate_movie
      elsif input == "4"
        delete_movie
      elsif input == "debug"
        binding.pry
      else
        puts "What are you trying to do?"
      end

      main_menu
      input = gets.chomp
    end
    # add conditional logic for what to do when a user types a certain input
  end

def add_movie
  print "What movie would you like to add?"
  title=gets.chomp
  print "What genre is this movie?"
  genre= gets.chomp
  movie = Movie.new(title, genre)
  
    MOVIES << movie
    movie.print_movie
    movie
end

def list_movies
  MOVIES.each do |movie|
    movie.print_movie
  end
end


def rate_movie
  puts "Please select which movie you want to rate: "
  MOVIES.each.with_index(1) do |movie, index|
    puts "#{index}. #{movie.title}."
  end
    input = gets.chomp
    input_to_index = input.to_i - 1
    movie_to_rate = MOVIES[input_to_index]
    verify_rating(movie_to_rate)
      
      # rating = rating.to_i
      
      
    end

    def verify_rating(movie_to_rate)
      puts "What rating would you like to give to #{movie_to_rate.title}? (1-5)"
      rating = gets.chomp.to_i
      if rating < 1 || rating > 5 || rating.class != Fixnum 
        puts "That's not a valid rating. What rating would you like to give #{movie_to_rate.title}?"
        verify_rating(movie_to_rate)
      else
        movie_to_rate.rating = rating
        movie_to_rate.print_movie
      end
    end

    def delete_movie
      puts "What movie would you like to delete?"
      MOVIES.each.with_index(1) do |movie, index|
        puts "#{index}. #{movie.title}."
      end

      input = gets.chomp
      input_to_index = input.to_i - 1
      movie_to_delete = MOVIES[input_to_index]
      puts "are you sure you want to delete #{movie_to_delete.title}?"
      confirmation = gets.chomp
      if confirmation == "yes"
        MOVIES.delete(movie_to_delete)
      else
        delete_movie



    end