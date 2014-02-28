class Place < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :city, counter_cache: true
  has_many :corrections


  def self.crawl
    require 'open-uri'
    require 'nokogiri'

    for i in 473..695
      #i = 1 + rand(1..300)

      #uri = open("http://panoramafirm.pl/fryzjer/ma%C5%82opolskie,,krak%C3%B3w/firmy,#{i}.html?sort=2")
      uri = "http://panoramafirm.pl/fryzjer/firmy,#{i}.html?sort=2"
      puts "Opening page #{uri}\n"
      page = Nokogiri::HTML(open(uri))

      puts "Looking for elements"
      cards = page.css('li.card')
      puts "Found #{cards.size} cards"

      puts "Iterating..."

      cards.each do |card|

        title = card.css('.addax-cs_hl_hit_company_name_click').first

        name = title.content
        href = title['href']

        # url
        u = card.css('.addax-cs_hl_hit_homepagelink_click')
        if u.size > 0
          url = u.first['href']
        end

        # phone
        p = card.css('.addax-cs_hl_hit_call_click')
        if p.size > 0
          phone = p.first['href'].gsub(/tel:/, '')
        end

        # email
        e = card.css('.addax-cs_hl_email_submit_click')
        if e.size > 0
          email = e.first['href'].gsub(/mailto:/, '')
        end

        # address
        a = card.css('.contacts')
        if a.size > 0
          node = a.first
          node.search('.//a').remove
          address = node.content.strip
          search = address.split(', ')
          if(search.size > 1)
            street = search[0]
            city = search[1]
          end

        end

        puts("-------------------")
        puts("Found: #{name}")
        puts("Url: #{url}")
        puts("Email: #{email}")
        puts("Phone: #{phone}")
        if(city != nil)
          puts("Street: #{street}")
          puts("City: #{city}")
        else
          puts("Address: #{address}")
        end

        place = Place.new({name: name, website: url, email: email, phone: phone, source: href})

        if(city.nil?)
          place.street_address = address
        else
          place.street_address = street
          place.city = City.find_or_create_by({name: city})
        end

        place.save
        puts "Createad place >> #{place}!"
        puts("-------------------")

      end

      x = 1 + rand(5)
      puts "Waiting #{x} seconds"
      sleep(x)

    end



  end

end
