# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

title_noun = %w(Dogs Cats Birds Elephants Fishs Frogs)
title_adjective = %w(Fat Skinny Tall Black White Dark Light)
title_verb = %(Run Eat Drink Sleep Jump Crawl)
title_adverb = ["A Lot", "Fast", "Too Much", "Too Little", "Everywhere", "Sometimes"]

30.times do
  Link.create!(title: "#{title_adjective.sample} #{title_noun.sample} #{title_verb} #{title_adverb}")
end

300.times do
  Vote.create!(link_id: rand(1..30))
end
