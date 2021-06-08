# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
  def initialize(first_name: 'Poppy', middle_name: nil, last_name: 'Jennings')
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name(first_name, middle_name, last_name)
    if middle_name == ''
      first_name + ' ' + last_name
    else
      first_name + ' ' + middle_name + ' ' + last_name
    end
  end

  def full_name_with_middle_initial(first_name, middle_name, last_name)
    if middle_name == ''
      first_name + ' ' + last_name
    else
      first_name + " " + middle_name.chr + " " + last_name
    end
  end

  def initials(first_name, middle_name, last_name)
    if middle_name == ''
      first_name + ' ' + last_name
    else
      first_name.chr + " " + middle_name.chr + " " + last_name.chr
    end
  end
end

RSpec.describe Person do
  describe '#full_name' do
    it 'concatenates first name, middle name, and last name with spaces' do
      person = Person.new
      expect(person.full_name('Poppy', 'Alexandra', 'Jennings')).to eq('Poppy Alexandra Jennings')
    end
    it 'does not add extra spaces if middle name is missing' do
      person = Person.new
      expect(person.full_name('Poppy', '', 'Jennings')).to eq('Poppy Jennings')    
    end
  end

  describe '#full_name_with_middle_initial' do
    it 'concatenates first name, the first letter of the middle name, and the last name with spaces' do
      person = Person.new
      expect(person.full_name_with_middle_initial('Poppy', 'Alexandra', 'Jennings')).to eq('Poppy A Jennings')
    end
  end
  describe "#initials" do
    it 'concatenates the first letters of the first, middle and last names' do
      person = Person.new
      expect(person.initials('Poppy', 'Alexandra', 'Jennings')).to eq('P A J')
    end
  end
end
