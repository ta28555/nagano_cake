# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create!(
  last_name: '管理者',
  first_name: '管理者',
  last_name_kana: 'カンリシャ',
  first_name_kana: 'カンリシャ',
  email: 'admin@gmail.com',
  postal_code: '0000000',
  address: 'nagano cake',
  telephone_number: '00000000000',
  is_active: false,
  created_at: '2000-01-01',
  updated_at: '2000-01-01',
  password: 'adminpass',
  password_confirmation: 'adminpass',
  admin: true
)