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


end
