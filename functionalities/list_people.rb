class ListPeople
  def self.list(people)
    people.each do |object|
      puts "[#{object.class}] Name: #{object.name}, ID: #{object.id}, Age: #{object.age}"
    end
  end
end
