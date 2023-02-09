# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle


# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
rails generate model Movie
rails generate model Studio
rails generate model Actor
rails generate model Role

# class CreateStudios < ActiveRecord::Migration[7.0]
    def change
      create_table :studios do |t|
        t.string "name"
        t.timestamps
      end
    end
  end
  
  class CreateMovies < ActiveRecord::Migration[7.0]
    def change
      create_table :movies do |t|
        t.string "name"
        t.integer "year_released"
        t.string "rated"
        t.integer "studio_id"
        t.timestamps
      end
    end
  end  

  class CreateActors < ActiveRecord::Migration[7.0]
    def change
      create_table :actors do |t|
        t.string "name"
        t.timestamps
      end
    end
  end
  
  class CreateRoles < ActiveRecord::Migration[7.0]
    def change
      create_table :roles do |t|
        t.string "character_name"
        t.integer "movie_id"
        t.integer "actor_id"
        t.timestamps
      end
    end
  end

rails db:migrate

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

#Inserting data in studios
new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save

#Variable extraction for studios
warnerbros = Studio.find_by({"name" => "Warner Bros."})

#Inserting data in movies
new_movie = Movie.new
new_movie["name"] = "Batman Begins"
new_movie["year_released"] = "2005"
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warnerbros["id"]
new_movie.save

new_movie = Movie.new
new_movie["name"] = "The Dark Knight"
new_movie["year_released"] = "2008"
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warnerbros["id"]
new_movie.save

new_movie = Movie.new
new_movie["name"] = "The Dark Knight Rises"
new_movie["year_released"] = "2012"
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warnerbros["id"]
new_movie.save

#Variable extraction for movies
batmanbegins = Movie.find_by({"name" => "Batman Begins"})
thedarkknight = Movie.find_by({"name" => "The Dark Knight"})
thedarkknightrises = Movie.find_by({"name" => "The Dark Knight Rises"})

#Inserting data in actors
new_actor = Actor.new
new_actor["name"] = "Christian Bale"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Michael Caine"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Liam Neeson"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Katie Holmes"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Gary Oldman"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Heath Ledger"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Aaron Eckhart"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Maggie Gyllenhaal"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Tom Hardy"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Joseph Gordon-Levitt"
new_actor.save

new_actor = Actor.new
new_actor["name"] = "Anne Hathaway"
new_actor.save

#Variable extraction for actors
christianbale = Actor.find_by({"name" => "Christian Bale"})
michaelcaine = Actor.find_by({"name" => "Michael Caine"})
liamneeson = Actor.find_by({"name" => "Liam Neeson"})
katieholmes = Actor.find_by({"name" => "Katie Holmes"})
garyoldman = Actor.find_by({"name" => "Gary Oldman"})
heathledger = Actor.find_by({"name" => "Heath Ledger"})
aaroneckhart = Actor.find_by({"name" => "Aaron Eckhart"})
maggiegyllenhaal = Actor.find_by({"name" => "Maggie Gyllenhaal"})
tomhardy = Actor.find_by({"name" => "Tom Hardy"})
josephgordonlevitt = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
annehathaway = Actor.find_by({"name" => "Anne Hathaway"})

#Inserting data in roles
#Bruce Wayne
new_role = Role.new
new_role["movie_id"] = batmanbegins["id"]
new_role["actor_id"] = christianbale["id"]
new_role["character_name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role["movie_id"] = thedarkknight["id"]
new_role["actor_id"] = christianbale["id"]
new_role["character_name"] = "Bruce Wayne"
new_role.save

new_role = Role.new
new_role["movie_id"] = thedarkknightrises["id"]
new_role["actor_id"] = christianbale["id"]
new_role["character_name"] = "Bruce Wayne"
new_role.save

#Alfred
new_role = Role.new
new_role["movie_id"] = batmanbegins["id"]
new_role["actor_id"] = michaelcaine["id"]
new_role["character_name"] = "Alfred"
new_role.save

new_role = Role.new
new_role["movie_id"] = thedarkknight["id"]
new_role["actor_id"] = michaelcaine["id"]
new_role["character_name"] = "Alfred"
new_role.save

#Rachel Dawes
new_role = Role.new
new_role["movie_id"] = batmanbegins["id"]
new_role["actor_id"] = katieholmes["id"]
new_role["character_name"] = "Rachel Dawes"
new_role.save

new_role = Role.new
new_role["movie_id"] = thedarkknight["id"]
new_role["actor_id"] = maggiegyllenhaal["id"]
new_role["character_name"] = "Rachel Dawes"
new_role.save

#Commissioner Gordon
new_role = Role.new
new_role["movie_id"] = batmanbegins["id"]
new_role["actor_id"] = garyoldman["id"]
new_role["character_name"] = "Commissioner Gordon"
new_role.save

new_role = Role.new
new_role["movie_id"] = thedarkknightrises["id"]
new_role["actor_id"] = garyoldman["id"]
new_role["character_name"] = "Commissioner Gordon"
new_role.save

#Ra's Al Ghul
new_role = Role.new
new_role["movie_id"] = batmanbegins["id"]
new_role["actor_id"] = liamneeson["id"]
new_role["character_name"] = "Ra's Al Ghul"
new_role.save

#Joker
new_role = Role.new
new_role["movie_id"] = thedarkknight["id"]
new_role["actor_id"] = heathledger["id"]
new_role["character_name"] = "Joker"
new_role.save

#Harvey Dent
new_role = Role.new
new_role["movie_id"] = thedarkknight["id"]
new_role["actor_id"] = aaroneckhart["id"]
new_role["character_name"] = "Harvey Dent"
new_role.save

#Bane
new_role = Role.new
new_role["movie_id"] = thedarkknightrises["id"]
new_role["actor_id"] = tomhardy["id"]
new_role["character_name"] = "Bane"
new_role.save

#John Blake
new_role = Role.new
new_role["movie_id"] = thedarkknightrises["id"]
new_role["actor_id"] = josephgordonlevitt["id"]
new_role["character_name"] = "John Blake"
new_role.save

#Selina Kyle
new_role = Role.new
new_role["movie_id"] = thedarkknightrises["id"]
new_role["actor_id"] = annehathaway["id"]
new_role["character_name"] = "Selina Kyle"
new_role.save

#Variable extraction for roles
brucewayne = Role.find_by({"character_name" => "Bruce Wayne"})
alfred = Role.find_by({"character_name" => "Alfred"})
rasalghul = Role.find_by({"character_name" => "Ra's Al Ghul"})
racheldawes = Role.find_by({"character_name" => "Rachel Dawes"})
commissionergordon = Role.find_by({"character_name" => "Commissioner Gordon"})
joker = Role.find_by({"character_name" => "Joker"})
harveydent = Role.find_by({"character_name" => "Harvey Dent"})
maggiegyllenhaal = Role.find_by({"character_name" => "Maggie Gyllenhaal"})
bane = Role.find_by({"character_name" => "Bane"})
johnblake = Role.find_by({"character_name" => "John Blake"})
selinakyle = Role.find_by({"character_name" => "Selina Kyle"})

puts "There are #{Movie.count} movies."
puts "There are #{Actor.count} actors."
puts "There are #{Studio.count} studios."
puts "There are #{Role.count} roles."

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
movies = Movie.all
 for movie in movies
  studio = Studio.find_by({"id" => movie["studio_id"]})
  name = movie["name"]
  year = movie["year_released"]
  rated = movie["rated"]
  studio_name = studio["name"]
  puts "#{name} #{year} #{rated} #{studio_name}"
 end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
roles = Role.all
for role in roles
  movie = Movie.find_by({"id" => role["movie_id"]})
  actor = Actor.find_by({"id" => role["actor_id"]})
  movie_name = movie["name"]
  actor_name = actor["name"]
  character_name = role["character_name"]
  puts "#{movie_name} #{actor_name} #{character_name}"
end