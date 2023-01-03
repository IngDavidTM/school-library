class ListBooks
  def self.list(books)
    books.each do |object|
      puts "Title: '#{object.title}', Author: #{object.author}"
    end
  end
end
