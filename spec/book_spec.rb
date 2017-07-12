require("spec_helper")

describe(Book) do

  describe(".all") do
    it("is empty at first") do
      expect(Book.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a book to the array of saved books") do
      test_book = Book.new({:title => "Learn SQL", :author => "Betty Mutai", :patron_id => 1})
      test_book.save()
      expect(Book.all()).to(eq([test_book]))
    end
  end

  describe("#title") do
    it("lets you see the title of the book") do
      test_book = Book.new({:title => "Learn SQL", :author => "Betty Mutai", :patron_id => 1})
      expect(test_book.title()).to(eq("Learn SQL"))
    end
  end

  describe("#author") do
    it("lets you see the author of the book") do
      test_book = Book.new({:title => "Learn SQL", :author => "Betty Mutai", :patron_id => 1})
      expect(test_book.author()).to(eq("Betty Mutai"))
    end
  end

  describe("#patron_id") do
    it("lets you see the patron id") do
      test_book = Book.new({:title => "Learn SQL", :author => "Betty Mutai", :patron_id => 1})
      expect(test_book.patron_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same if it has the same author and title") do
      book1 = Book.new({:title => "Learn SQL", :author => "Betty Mutai", :patron_id => 1})
      book2 = Book.new({:title => "Learn SQL", :author => "Betty Mutai", :patron_id => 1})
      expect(book1).to(eq(book2))
    end
  end


end
