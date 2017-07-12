class Book
  @@all_books = []

  attr_reader(:title, :author, :patron_id)

  define_method(:initialize) do |attributtes|
    @title = attributtes.fetch(:title)
    @author = attributtes.fetch(:author)
    @patron_id = attributtes.fetch(:patron_id)
  end

  define_singleton_method(:all) do
    @@all_books
  end

  define_method(:save) do
    @@all_books.push(self)
  end

end
