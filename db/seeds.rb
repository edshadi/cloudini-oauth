BANDNAMES = [ "Joy Division", "New Order", "The Smiths", "The Sisters of Mercy", "Wye Oak", "Thao and the Get Down Stay Down",
          "Siouxsie and the Banshees", "Interpol", "Ted Leo and The Pharmacists", "The Impossibles", "The Promise Ring",
          "Fugazi" ]

BANDNAMES.each{ |band_name| Band.create(name: band_name) }
