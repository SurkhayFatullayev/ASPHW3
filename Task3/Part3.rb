
class LibraryItem
  attr_reader :title, :author, :publication_year

  def initialize(title, author, publication_year)
    @title = title
    @author = author
    @publication_year = publication_year
  end

  def display_info
    puts "Title: #{@title}"
    puts "Author: #{@author}"
    puts "Publication Year: #{@publication_year}"
  end
end

# Child: Book
class Book < LibraryItem
  attr_reader :genre

  def initialize(title, author, publication_year, genre)
    super(title, author, publication_year)
    @genre = genre
  end

  def display_info
    super
    puts "Genre: #{@genre}"
    puts " "
  end
end

# Child: DVD
class DVD < LibraryItem
  attr_reader :director, :genre

  def initialize(title, director, publication_year, genre)
    super(title, director, publication_year)
    @director = director
    @genre = genre
  end

  def display_info
    puts "Title: #{@title}"
    puts "Director: #{@director}"
    puts "Publication Year: #{@publication_year}"
    puts "Genre: #{@genre}"
    puts " "
  end
end

# Child: CD
class CD < LibraryItem
  attr_reader :artist, :genre

  def initialize(title, artist, publication_year, genre)
    super(title, artist, publication_year)
    @artist = artist
    @genre = genre
  end

  def display_info
    puts "Title: #{@title}"
    puts "Artist: #{@artist}"
    puts "Publication Year: #{@publication_year}"
    puts "Genre: #{@genre}"
    puts " "
  end
end

# Library class
class Library
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
    puts "#{item.title} added to the library."
  end

  def remove_item(item)
    if @items.delete(item)
      puts "#{item.title} removed from the library."
    else
      puts "Item not found in the library."
    end
  end

  def display_all_items
    if @items.empty?
      puts "The library is empty."
      return
    end
    
    puts " "

    @items.each do |item|
      item.display_info
    end
  end
end

# Crеatе instancеs of diffеrеnt library itеms
book = Book.new("Concеpts of Programming Languagеs", "Robеrt Sеbеsta", 2015, "Programming")
dvd = DVD.new("Incеption", "Christophеr Nolan", 2010, "Sciеncе Fiction")
cd = CD.new("A Day at thе Racеs", "Quееn", 1976, "Rock")
 
# Display itеms individually
book.display_info
dvd.display_info
cd.display_info
 
 
# Crеatе a library and add itеms to it
library = Library.new
library.add_item(book)
library.add_item(dvd)
library.add_item(cd)
 
# Display information about all itеms in thе library
library.display_all_items