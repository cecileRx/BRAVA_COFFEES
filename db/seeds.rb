# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Product.destroy_all
Category.destroy_all

puts 'Creating categories...'
coffee = Category.create!(name: 'coffee')
equipment = Category.create!(name: 'equipment')

puts 'Creating equipments...'

Product.create!(
  name: 'hario_skerton_grinder_name',
  description: 'hario_skerton_grinder_desc',
  photo: 'hario_skerton_grinder.jpg',
  price_cents: 4478,
  shipping_points: 2,
  category: equipment)

Product.create!(
  name: 'hario_V60_ceramic_dripper_name',
  description: 'hario_V60_ceramic_dripper_desc_html',
  photo: 'hario_V60_ceramic_dripper.jpg',
  price_cents: 2919,
  shipping_points: 2,
  category: equipment)

Product.create!(
  name: 'hario_V60_glass_dripper_name',
  description: 'hario_V60_glass_dripper_desc_html',
  photo: 'hario_V60_glass_dripper.jpg',
  price_cents: 5199,
  shipping_points: 2,
  category: equipment)

Product.create!(
  name: 'hario_V60_server_name',
  description: 'hario_V60_server_desc',
  photo: 'hario_V60_server.jpg',
  price_cents: 2919,
  shipping_points: 2,
  category: equipment)

Product.create!(
  name: 'uchi_mugg_name',
  description: 'uchi_mugg_desc',
  photo: 'uchi_mugg.jpg',
  price_cents: 2919,
  shipping_points: 2,
  category: equipment)

Product.create!(
  name: 'chemex_3_name',
  description: 'chemex_desc_html',
  photo: 'chemex_3_cups.jpg',
  price_cents: 4369,
  shipping_points: 2,
  category: equipment)

Product.create!(
  name: 'chemex_6_name',
  description: 'chemex_desc_html',
  photo: 'chemex_6_cups.jpg',
  price_cents: 4949,
  shipping_points: 2,
  category: equipment)

Product.create!(
  name: 'V60_name',
  description: 'kit_v_60_desc_html',
  photo: 'Kit_V60.jpg',
  price_cents: 3999,
  shipping_points: 2,
  category: equipment)

Product.create!(
  name: 'chemex_3_filter_name',
  description: 'chemex_3_filter_desc',
  photo: 'Filtro_Chemex_3_cups.jpg',
  price_cents: 1239,
  shipping_points: 2,
  category: equipment)

Product.create!(
  name: 'chemex_6_filter_name',
  description: 'chemex_6_filter_desc',
  photo: 'Filtro_Chemex_6_cups.jpg',
  shipping_points: 2,
  price_cents: 1239,
  category: equipment)

Product.create!(
  name: 'hario_01_name',
  description: 'hario_01_desc',
  photo: 'Hario_V60_Filters.jpg',
  price_cents: 329,
  shipping_points: 1,
  category: equipment)

Product.create!(
  name: 'hario_02_name',
  photo: 'Hario_V60_Filters2.jpg',
  description: 'hario_02_desc',
  price_cents: 659,
  shipping_points: 1,
  category: equipment)

puts 'Creating coffees...'

Product.create!(
  price_cents: 920,
  shipping_points: 2,
  weight: 250,
  origin: 'brasil_origin',
  name:'Fazenda Bagagem farm',
  region:'brasil_region',
  variety: 'Red Catuai',
  certification: 'Direct trade/ UTZ/ Rainforest/ BSCA',
  altitude: '1100 masl',
  process:  'process_att_3',
  grind_options: 'brasil_grind',
  cupping_notes: 'brasil_cp_html',
  description: 'brasil_desc',
  photo: 'brasil_home.jpg',
  photo_square: 'brasil_s.jpg',
  category: coffee)

Product.create!(
  price_cents: 3500,
  shipping_points: 4,
  weight: 1000,
  origin: 'brasil_origin',
  name:'Fazenda Bagagem farm',
  region:'brasil_region',
  variety: 'Red Catuai',
  certification: 'Direct trade/ UTZ/ Rainforest/ BSCA',
  altitude: '1100 masl',
  process:  'process_att_3',
  grind_options: 'brasil_grind',
  cupping_notes: 'brasil_cp_html',
  description: 'brasil_desc',
  photo: 'brasil_home.jpg',
  photo_square: 'brasil_s.jpg',
  category: coffee)

puts 'Finished!'
