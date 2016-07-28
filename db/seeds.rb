# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


################### OPTION 1 ##################

buzz_1 = ["You'll Never Believe", "Click Here To See"]

adjective_1 = ["Fat", "Skinny", "Tall", "Enormous", "Dumb", "Ugly", "Beautiful"]

celeb_1 = ["J-Lo", "Kim Kardashian", "Kanye", "Taylor Swift", "The World", "America", "Donald Trump"]

verb_1 = ["Is", "Looks In This Video", "Became", "Will Be"]

# option_1 = "#{buzz_1.sample} How #{adjective_1.sample} This #{noun_1.sample} #{verb_1.sample}!!"

################## OPTION 1 ###################

################## OPTION 2 ###################

verb_phrase_2 = ["Kim Kardashian Pleases Her", "To Please Your", "To Feed Your", "To Get A", "To Get Over Your", "To Love Your", "To Seduce Your", "To Kill Your"]

noun_2 = ["Man", "Woman", "Dog", "Wife", "Husband", "Ex", "Girlfriend", "Boyfriend", "Neighbor", "Dane", "Crush", "Special Someone"]

# option_2 = "#{rand(1..13)} Ways #{verb_phrase_2.sample} #{noun_2.sample}!!"

################## OPTION 2 ###################

################## OPTION 3 ###################

buzz_start_3 = ["Lab Created", "No Mother Could Love This", "Circuses Won't Even Show This", "What No One Is Talking About: Genetically Created"]

buzz_end_3 = ["Has Science Gone Too Far???", "1 Like 1 Prayer!!", "Why Is No One Talking About This?!"]

appendage_3 = ["Legged", "Armed", "Headed", "Nosed", "Eared", "Winged", "Brained"]

object_3 = ["Dog", "Child", "Boy", "Girl", "Dane", "Elephant", "Cat", "Table", "Chair"]

# option_3 = "#{buzz_start_3.sample} #{rand(1..8)} #{appendage_3.sample} #{object_3.sample}! #{buzz_end_3.sample}"

################## OPTION 3 ###################

10.times do
  Link.create!(title: "#{buzz_1.sample} How #{adjective_1.sample} #{celeb_1.sample} #{verb_1.sample}!!")

  Link.create!(title: "#{rand(2..13)} Ways #{verb_phrase_2.sample} #{noun_2.sample}!!")

  Link.create!(title: "#{buzz_start_3.sample} #{rand(1..8)} #{appendage_3.sample} #{object_3.sample}! #{buzz_end_3.sample}")
end

300.times do
  Vote.create!(link_id: rand(1..30))
end
