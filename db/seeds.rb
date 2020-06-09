# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Product.destroy_all if Rails.env.development?
Category.destroy_all if Rails.env.development?

puts 'Creating categories...'
coffee = Category.create!(name: 'coffee')
equipment = Category.create!(name: 'equipment')

puts 'Creating products...'

Product.create!(
  origin: 'Nicaragua',
  name:'Cerro de Jesus farm',
  region: 'Jalapa, Neuva Segovia',
  process: 'washed',
  cupping_notes: 'coffee cherry, lemon',
  description: 'Cerro de Jesus or Jesus Mountain Farm is located in Jalapa, Neuva Segovia, on the second highest peak of Nicaragua. The farm spreads through 700 hectares of which about 400 hectares are a beautiful forest reserve.
  In 2017, Jesus Mountain Farm decided to partner with Cafetos de Segovia, a small specialty mill and export company run by two sisters Martha and Ana Albir. The Albir sisters inherited from their father the passion and knowledge to grow their own coffee. Later they acquired a mill and by 2016 they were providing milling and export services to neighboring small coffee farms. This new venture allowed them to contact directly with farms with socially conscious practices and they were also able to focus in separating of coffee by variety.',
   photo:'nicaragua.jpg',
   category: coffee)

Product.create!(
  origin: 'Ethiopia',
  name:'Tega & Tula farm',
  region:'Bonga, gifo, Keffa',
  process:'washed',
  cupping_notes: 'pear, floral',
  description:'Tega & Tula speciality Coffee Farm located at Keffa province bio-reserve, takes its name after the two nearby villages in Woreda, Gibo district, Keffa, Ethiopia. The farm spreads out through 500 hectares where 400 hectares are planted with different coffee varieties. Ethiopian varieties, cultivars from the 70s as well as wild coffee from the Keffa forest, together all contribute for the uniqueness of the coffee grown here.
Coffee harvest and de-pulping always takes place on the same day. The coffee beans are then fermented underwater for 36 hours. Is this anaerobic fermentation that enhances the flavors and aromas of each and every bean. It is then washed in local canals and thereafter, spends between 16 and18 hours soaking in a tank before being spread on the drying tables. It takes washed coffee beans between 7 to 11 days to dry out.',
photo:'ethiopia.jpg',
category: coffee)

Product.create!(
  origin: 'Colombia',
  name:'FUDAM',
  region:'La Uniõn, Nariño',
  process:'washed',
  cupping_notes:'tropical fruits, tamarind',
  description: "FUDAM stands for Fundación Agraria y Ambiental Para el Desarrollo Sostentible - a 300 member’s association of organic and Rainforest Alliance certified coffee growers founded in the year 2000.
  This group of smallholders lives in and around the municipality of La Unión in Nariño. Villages are at such high altitude that the growing areas, instead of being in higher grounds, lay bellow, surrounded by beautiful high peaks and rough roads.
  Today, FUDAM's growers still firmly believe in the principles of sustainability, the ideal that brought them together. Recently, when asked why they continue to farm organically, despite the pressure to rely on chemical inputs, the association explained: 'This is just how we live; these are our values and our way of life.'",
  photo: 'columbia_fundam.jpg',
  category: coffee)

Product.create!(
  origin: 'Columbia',
  name:'AMACA',
  region:'El Tambo, Cauca',
  process: 'washed',
  cupping_notes:'caramel, apple',
  description:'AMACA stands for Asociación de Mujeres Productoras Agropecuarias del Cauca, a group of 80 women’ producers who are based in El Tambo, Cauca, Colombia since 1999. This association has registered a steady growth and, today, it counts up to 140 women from three different villages in the same region. All of these women own the land they farm and are the heads of their households.
  The average farm size is one hectare per member, with many even smaller. Most members harvest only fully ripe cherries which are de-pulped on the same day of harvest and are then processed on their farms. Drying is done on raised beds inside parabolic dryers.',
  photo: 'columbia_amaca2.jpg',
  category: coffee)

puts 'Finished!'
