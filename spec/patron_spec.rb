require('spec_helper')

describe(Patron) do

  describe(".all") do
    it("starts off empty") do
      expect(Patron.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a new patron to the database") do
      patron = Patron.new({:name => "Deedee", :id => nil})
      patron.save()
      expect(Patron.all()).to(eq([patron]))
    end
  end

  describe("#name") do
    it("returns the name of the patron") do
      patron = Patron.new({:name => "Deedee", :id => nil})
      expect(patron.name()).to(eq("Deedee"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      patron = Patron.new({:name => "Deedee", :id => nil})
      patron.save()
      expect(patron.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same patron if they have the same name") do
      patron1 = Patron.new({:name => "Deedee", :id => nil})
      patron2 = Patron.new({:name => "Deedee", :id => nil})
      expect(patron1).to(eq(patron2))
    end
  end

  describe(".find") do
    it("returns a patron by their name") do
      test_patron = Patron.new({:name => "Deedee", :id => nil})
      test_patron.save()
      test_patron2 = Patron.new({:name => "Emma", :id => nil})
      test_patron2.save()
      expect(Patron.find(test_patron2.id())).to(eq(test_patron2))
    end
  end

  describe("#books") do
    it("returns an array of books for that patron") do
      test_patron = Patron.new({:name => "Deedee", :id => nil})
      test_patron.save()
      test_book = Book.new({:title => "Learn SQL", :author => "Betty Mutai", :patron_id => test_patron.id()})
      test_book.save()
      test_book2 = Book.new({:title => "Learn Ruby", :author => "Karen Mutai", :patron_id => test_patron.id()})
      test_book2.save()
      expect(test_patron.books()).to(eq([test_book,test_book2]))
    end
  end

  describe("#update") do
      it("lets you update patrons in the database") do
        patron = Patron.new({:name => "Deedee", :id => nil})
        patron.save()
        patron.update({:name => "Doreen"})
        expect(patron.name()).to(eq("Doreen"))
      end
    end

    describe("#delete") do
      it("lets you delete a patron from the database") do
        patron = Patron.new({:name => "Deedee", :id => nil})
        patron.save()
        patron2 = Patron.new({:name => "Emma", :id => nil})
        patron2.save()
        patron.delete()
        expect(Patron.all()).to(eq([patron2]))
      end
      it("deletes a patron's books from the database") do
        patron = Patron.new({:name => "Deedee", :id => nil})
        patron.save()
        book = Book.new({:title => "Learn SQL", :author => "Betty Mutai", :patron_id => patron.id()})
        book.save()
        book2 = Book.new({:title => "Learn Ruby", :author => "Karen Mutai", :patron_id => patron.id()})
        book2.save()
        patron.delete()
        expect(Book.all()).to(eq([]))
      end
    end

end
