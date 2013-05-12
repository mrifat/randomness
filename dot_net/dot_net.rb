You = Struct.new(:name, :code)
you = You.new
puts 'Please enter your name'
you.name = gets.chomp.capitalize

puts 'Please enter your favorite programming language'
you.code = gets.chomp.downcase

Me = Struct.new(:name, :weapons)
me = Me.new('Rifat', %w(Machine\ gun RPG 9mm\ gun Colt-45 Katana Ak-47 Ak-12))

class String
  def engage(person)
    person.taint
  end
end

if you.code =~ /^\w*[.](net)$/
  me.weapons.shuffle.first.engage(you)
end

puts you.tainted? ? "You are tainted" : "You may pass #{you}"

