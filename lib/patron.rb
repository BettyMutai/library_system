class Patron
  attr_reader(:name, :id)

  @@all_patrons = []

  define_method(:initialize) do |attributtes|
    @name = attributtes.fetch(:name)
    @id = attributtes.fetch(:id)
  end

  define_singleton_method(:all) do
    @@all_patrons
  end

  define_method(:save) do
    @@all_patrons.push(self)
  end


end
