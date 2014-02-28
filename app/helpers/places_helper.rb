module PlacesHelper


  def about_place(place_name)

    dict = [
      ['Salon fryzjerski','salonie fryzjerskim'],
      ['Salon Fryzjerski','salonie fryzjerskim'],
      ['Studio Fryzjerskie', 'studiu fryzjerskim'],
      ['Studio', 'studiu'],
      ['Salon', 'salonie'],
      ['Fryzjer', 'fryzjerze']

    ]

    dict.each { |tr| place_name.gsub!(tr[0], tr[1]) }

    return place_name

  end

end
