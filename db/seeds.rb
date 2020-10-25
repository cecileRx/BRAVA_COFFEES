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

puts 'Creating equipments...'

Product.create!(
  name: I18n.t('chemex_3_name'),
  description: I18n.t('chemex_desc'),
  photo: 'chemex_3_cups.jpg',
  price_cents: 4369,
  category: equipment)

Product.create!(
  name: I18n.t('chemex_6_name'),
  description: I18n.t('chemex_desc'),
  photo: 'chemex_6_cups.jpg',
  price_cents: 4949,
  category: equipment)

Product.create!(
  name: I18n.t('V60_name'),
  description: I18n.t('kit_v_60_desc'),
  photo: 'Kit_V60.jpg',
  price_cents: 3999,
  category: equipment)

Product.create!(
  name: I18n.t('chemex_3_filter_name'),
  description: I18n.t('chemex_3_filter_desc'),
  photo: 'Filtro_Chemex_3_cups.jpg',
  price_cents: 1239,
  category: equipment)

Product.create!(
  name: I18n.t('chemex_6_filter_name'),
  description: I18n.t('chemex_6_filter_desc'),
  photo: 'Filtro_Chemex_6_cups.jpg',
  price_cents: 1239,
  category: equipment)

Product.create!(
  name: I18n.t('hario_01_name'),
  description: I18n.t('hario_01_desc'),
  photo: 'Hario_V60_Filters.jpg',
  price_cents: 329,
  category: equipment)

Product.create!(
  name: I18n.t('hario_02_name'),
  photo: 'Hario_V60_Filters.jpg',
  description: I18n.t('hario_02_desc'),
  price_cents: 349,
  category: equipment)

Product.create!(
  name: I18n.t('Mesh_dripper_name'),
  description: I18n.t('mesh_dripper_desc'),
  photo: 'Mesh_Metal_Dripper_2_cups.jpg',
  price_cents: 3289,
  category: equipment)

puts 'Creating coffees...'

Product.create!(
  weight: 250,
  price_cents: 1250,
  origin: I18n.t('nica_origin'),
  name:'Cerro de Jesus farm',
  region: 'Jalapa, Neuva Segovia',
  process:  I18n.t('process_att'),
  grind_options: I18n.t('nica_grind'),
  cupping_notes: I18n.t('nica_cp'),
  description: I18n.t('nica_desc'),
   category: coffee)

Product.create!(
  weight: 1000,
  price_cents: 4366,
  origin: I18n.t('nica_origin'),
  name:'Cerro de Jesus farm',
  region: 'Jalapa, Neuva Segovia',
  process:  I18n.t('process_att'),
  grind_options: I18n.t('nica_grind'),
  cupping_notes: I18n.t('nica_cp'),
  description: I18n.t('nica_desc'),
   category: coffee)

Product.create!(
  weight: 250,
  price_cents: 900,
  origin: I18n.t('columb_fudam_origin'),
  name:'FUDAM',
  region:'La Uniõn, Nariño',
  process: I18n.t('process_att'),
  grind_options: I18n.t('columb_fudam_grind'),
  cupping_notes:I18n.t('columb_fudam_cp'),
  description: I18n.t('columb_fudam_desc'),
  photo: 'columbia_fundam.jpg',
  category: coffee)

Product.create!(
  weight: 1000,
  price_cents: 2960,
  origin: I18n.t('columb_fudam_origin'),
  name:'FUDAM',
  region:'La Uniõn, Nariño',
  process: I18n.t('process_att'),
  grind_options: I18n.t('columb_fudam_grind'),
  cupping_notes: I18n.t('columb_fudam_cp'),
  description: I18n.t('columb_fudam_desc'),
  photo: 'columbia_fundam.jpg',
  category: coffee)

Product.create!(
  weight: 250,
  price_cents: 1130,
  origin: I18n.t('ethiopia_origin'),
  name:'Tega & Tula farm',
  region:'Bonga, gifo, Keffa',
  process: I18n.t('process_att'),
  grind_options: I18n.t('ethiopia_grind'),
  cupping_notes: I18n.t('ethiopia_cp'),
  description: I18n.t('ethiopia_desc'),
photo:'ethiopia.jpg',
category: coffee)

Product.create!(
  price_cents: 3880,
  weight: 1000,
  origin: I18n.t('ethiopia_origin'),
  name:'Tega & Tula farm',
  region:'Bonga, gifo, Keffa',
  process: I18n.t('process_att'),
  grind_options: I18n.t('ethiopia_grind'),
  cupping_notes: I18n.t('ethiopia_cp'),
  description: I18n.t('ethiopia_desc'),
photo:'ethiopia.jpg',
category: coffee)

Product.create!(
  price_cents: 1041,
  weight: 250,
  origin: I18n.t('columb_amaca_origin'),
  name:'AMACA',
  region:'El Tambo, Cauca',
  process:  I18n.t('process_att'),
  grind_options: I18n.t('columb_amaca_grind'),
  cupping_notes: I18n.t('columb_amaca_cp'),
  description: I18n.t('columb_amaca_desc'),
  photo: 'columbia_amaca2.jpg',
  category: coffee)

Product.create!(
  price_cents: 3524,
  weight: 1000,
  origin: I18n.t('columb_amaca_origin'),
  name:'AMACA',
  region:'El Tambo, Cauca',
  process:  I18n.t('process_att'),
  grind_options: I18n.t('columb_amaca_grind'),
  cupping_notes: I18n.t('columb_amaca_cp'),
  description: I18n.t('columb_amaca_desc'),
  photo: 'columbia_amaca2.jpg',
  category: coffee)


puts 'Finished!'
