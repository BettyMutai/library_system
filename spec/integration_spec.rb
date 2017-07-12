require('capybara/rspec')
  require('./app')
  require('spec_helper')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('adding a new patron', {:type => :feature}) do
    it('allows an administrator to click a patron and see books they have') do
      visit('/')
      fill_in('name', :with => 'Deedee')
      click_button('Add Patron')
      expect(page).to have_content('Library System')
    end
  end

  describe('viewing all the patrons', {:type => :feature}) do
    it('allows an administrator to see all the patrons') do
      patron = Patron.new({:name => 'Deedee', :id => nil})
      patron.save()
      visit('/')
      expect(page).to have_content(patron.name)
    end
  end

  describe('seeing details for a single patron', {:type => :feature}) do
    it('allows an administrator to click a patron and see the books they have') do
      test_patron = Patron.new({:name => 'Deedee', :id => nil})
      test_patron.save()
      test_book = Book.new({:title => "Learn SQL", :author => "Betty Mutai", :patron_id => test_patron.id()})
      test_book.save()
      visit('/')
      click_link(test_patron.name())
      expect(page).to have_content(test_book.title)
    end
  end

  describe('adding books to a patron', {:type => :feature}) do
    it('allows an administrator to add books to a patron') do
      test_patron = Patron.new({:name => 'Deedee', :id => nil})
      test_patron.save()
      visit('/')
      fill_in("Title of Book:", {:with => "Learn SQL"})
      click_button("Add book")
      expect(page).to have_content("Books")
    end
  end
