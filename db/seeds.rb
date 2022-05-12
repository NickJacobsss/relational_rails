# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Trail.destroy_all
Park.destroy_all
yosemite = Park.create!(name:'Yosemite', open:true, size:1169)
grand_canyon = Park.create!(name:'Grand Canyon', open:true, size:1902)
zion = Park.create!(name:'Zion', open:false, size:229)

half_dome = Trail.create!(name:'Half Dome', hikable:true, length:17, park_id: yosemite.id)
falls = Trail.create!(name:'Yosemite Falls', hikable:true, length:7, park_id: yosemite.id)
ooh_ahh = Trail.create!(name:"OOH AHH Point", hikable:true, length:2, park_id: grand_canyon.id)
bright_angel = Trail.create!(name:'Bright Angel Trail', hikable: false, length:15, park_id: grand_canyon.id)
angels_landing = Trail.create!(name:"Angel Landing",hikable:true,length:5, park_id:zion.id)
observation_point = Trail.create!(name:"Observation Point",hikable:true,length:8, park_id:zion.id)
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
