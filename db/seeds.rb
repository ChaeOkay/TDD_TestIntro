mymenu = Menu.create(name: "Toy sale", description: "summer sale on used and collector's items!", start_at: DateTime.now, end_at: DateTime.now + 100000)


  mymenu.menu_items << MenuItem.create(name: "The Terminator", description:"You'll come back!", price: 100 ) 
  mymenu.menu_items << MenuItem.create(name: "Batman costume", description:"includes free bat-scented candle", price: 200 )  
  mymenu.menu_items << MenuItem.create(name: "llama hair records", description:"top of the line. for your listening pleasure", price: 10000 ) 
