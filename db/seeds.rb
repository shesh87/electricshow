# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Event.create(title: "Ajunabeats", artist: "Above & Beyond, Adam Beyer", description: "Awesome show", date: ('26-3-2015'), time: Time.now, venue: "Minma", city: "Miami", ticket: "www.wantickets.com")
Event.create(title: "Ultra Music Festival", artist: "Tiesto, DJ Icey", description: "Yearly Miami Massive event", date: ('27-3-2015'), time: Time.now, venue: "Bay Front Park", city: "Miami", ticket: "www.wantickets.com")
Event.create(title: "Get Wet", artist: "Boris", description: "Awesome pool party", date: ('12-4-2015'), time: Time.now, venue:"SLS Hotel", city: "Las Vegas", ticket: "www.wantickets.com")
Event.create(title: "Independance", artist: "Cedric Gervais", description: "Gervais show", date: ('5-9-2015'), time: Time.now, venue: "The Hole", city: "Portand", ticket: "www.wantickets.com")
Event.create(title: "FSOB XIV", artist: "DJ Icey, Baby Anne", description: "Best event for break beats", date: ('24-3-2015'), time: Time.now, venue: "Mekka", city: "Miami", ticket: "www.wantickets.com")