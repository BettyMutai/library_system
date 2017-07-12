require("sinatra")
  require("sinatra/reloader")
  also_reload("lib/**/*.rb")
  require("./lib/book")
  require("./lib/patron")
  require("pg")


  DB = PG.connect({:dbname => "library_system"})

  get("/") do
    @patrons = Patron.all()
    erb(:index)
  end

  post("/patrons") do
    name = params.fetch("name")
    patron = Patron.new({:name => name, :id => nil})
    patron.save()
    @patrons = Patron.all()
    erb(:index)
  end

  get("/patrons/:id") do
    @patron = Patron.find(params.fetch("id").to_i())
    erb(:patron)
  end

  post("/books") do
    title = params.fetch("title")
    author = params.fetch("author")
    patron_id = params.fetch("patron_id").to_i()
    book = Book.new({:title => title, :author => author, :patron_id => patron_id})
    book.save()
    @patron = Patron.find(patron_id)
    erb(:patron)
  end
