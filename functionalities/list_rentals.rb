class ListRentals
  def self.list(rentals)
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    rentals.each do |object|
      puts "Date: #{object.date}, Book '#{object.book.title}' by #{object.book.author}" if object.person.id == person_id
    end
  end
end
