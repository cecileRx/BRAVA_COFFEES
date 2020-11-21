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
  name: 'chemex_3_name',
  description: 'chemex_desc',
  photo: 'chemex_3_cups.jpg',
  price_cents: 4369,
  category: equipment)

Product.create!(
  name: 'chemex_6_name',
  description: 'chemex_desc',
  photo: 'chemex_6_cups.jpg',
  price_cents: 4949,
  category: equipment)

Product.create!(
  name: 'V60_name',
  description: 'kit_v_60_desc_html',
  photo: 'Kit_V60.jpg',
  price_cents: 3999,
  category: equipment)

Product.create!(
  name: 'chemex_3_filter_name',
  description: 'chemex_3_filter_desc',
  photo: 'Filtro_Chemex_3_cups.jpg',
  price_cents: 1239,
  category: equipment)

Product.create!(
  name: 'chemex_6_filter_name',
  description: 'chemex_6_filter_desc',
  photo: 'Filtro_Chemex_6_cups.jpg',
  price_cents: 1239,
  category: equipment)

Product.create!(
  name: 'hario_01_name',
  description: 'hario_01_desc',
  photo: 'Hario_V60_Filters.jpg',
  price_cents: 329,
  category: equipment)

Product.create!(
  name: 'hario_02_name',
  photo: 'Hario_V60_Filters.jpg',
  description: 'hario_02_desc',
  price_cents: 349,
  category: equipment)

Product.create!(
  name: 'Mesh_dripper_name',
  description: 'mesh_dripper_desc',
  photo: 'Mesh_Metal_Dripper_2_cups.jpg',
  price_cents: 3289,
  category: equipment)

puts 'Creating coffees...'

Product.create!(
  weight: 250,
  price_cents: 1250,
  origin: 'nica_origin',
  name:'Cerro de Jesus farm',
  region: 'Jalapa, Neuva Segovia',
  process:  'process_att',
  grind_options: 'nica_grind',
  cupping_notes: 'nica_cp_html',
  description: 'nica_desc',
  photo: 'nicaragua.jpg',
  photo_square: 'nica_s.jpg',
  category: coffee)

Product.create!(
  weight: 1000,
  price_cents: 4366,
  origin: 'nica_origin',
  name:'Cerro de Jesus farm',
  region: 'Jalapa, Neuva Segovia',
  process:  'process_att',
  grind_options: 'nica_grind',
  cupping_notes: 'nica_cp_html',
  description: 'nica_desc',
  photo: 'nicaragua.jpg',
  photo_square: 'nica_s.jpg',
  category: coffee)

Product.create!(
  weight: 250,
  price_cents: 900,
  origin: 'columb_fudam_origin',
  name:'FUDAM',
  region:'La Uniõn, Nariño',
  process: 'process_att',
  grind_options: 'columb_fudam_grind',
  cupping_notes:'columb_fudam_cp_html',
  description: 'columb_fudam_desc',
  photo: 'columbia_fundam.jpg',
  photo_square: 'fudam_s.jpg',
  category: coffee)

Product.create!(
  weight: 1000,
  price_cents: 2960,
  origin: 'columb_fudam_origin',
  name:'FUDAM',
  region:'La Uniõn, Nariño',
  process: 'process_att',
  grind_options: 'columb_fudam_grind',
  cupping_notes: 'columb_fudam_cp_html',
  description: 'columb_fudam_desc',
  photo: 'columbia_fundam.jpg',
  photo_square: 'fudam_s.jpg',
  category: coffee)

Product.create!(
  weight: 250,
  price_cents: 1130,
  origin: 'ethiopia_origin',
  name:'Tega & Tula farm',
  region:'Bonga, gifo, Keffa',
  process: 'process_att',
  grind_options: 'ethiopia_grind',
  cupping_notes: 'ethiopia_cp_html',
  description: 'ethiopia_desc',
  photo:'ethiopia.jpg',
  photo_square: 'etiopia_s.jpg',
  category: coffee)

Product.create!(
  price_cents: 3880,
  weight: 1000,
  origin: 'ethiopia_origin',
  name:'Tega & Tula farm',
  region:'Bonga, gifo, Keffa',
  process: 'process_att',
  grind_options: 'ethiopia_grind',
  cupping_notes: 'ethiopia_cp_html',
  description: 'ethiopia_desc',
  photo:'ethiopia.jpg',
  photo_square: 'etiopia_s.jpg',
  category: coffee)

Product.create!(
  price_cents: 1041,
  weight: 250,
  origin: 'columb_amaca_origin',
  name:'AMACA',
  region:'El Tambo, Cauca',
  process:  'process_att',
  grind_options: 'columb_amaca_grind',
  cupping_notes: 'columb_amaca_cp_html',
  description: 'columb_amaca_desc',
  photo: 'columbia_amaca2.jpg',
  photo_square: 'amaca_s.jpg',
  category: coffee)

Product.create!(
  price_cents: 3524,
  weight: 1000,
  origin: 'columb_amaca_origin',
  name:'AMACA',
  region:'El Tambo, Cauca',
  process:  'process_att',
  grind_options: 'columb_amaca_grind',
  cupping_notes: 'columb_amaca_cp_html',
  description: 'columb_amaca_desc',
  photo: 'columbia_amaca2.jpg',
  photo_square: 'amaca_s.jpg',
  category: coffee)


puts 'Finished!'
