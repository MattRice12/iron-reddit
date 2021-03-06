# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


################### OPTION 1 ##################

BUZZ_1 = ["You'll Never Believe", "Click Here To See"]

ADJECTIVE_1 = ["Fat", "Skinny", "Tall", "Enormous", "Dumb", "Ugly", "Beautiful"]

CELEB_1 = ["J-Lo", "Kim Kardashian", "Kanye", "Taylor Swift", "The World", "America", "Donald Trump"]

VERB_1 = ["Is", "Looks In This Video", "Became", "Will Be"]

def option_1
  "#{BUZZ_1.sample} How #{ADJECTIVE_1.sample} #{CELEB_1.sample} #{VERB_1.sample}!!"
end

################## OPTION 1 ###################

################## OPTION 2 ###################

VERB_PHRASE_2 = ["Kim Kardashian Pleases Her", "To Please Your", "To Feed Your", "To Get A", "To Get Over Your", "To Love Your", "To Seduce Your", "To Kill Your"]

NOUN_2 = ["Man", "Woman", "Dog", "Wife", "Husband", "Ex", "Girlfriend", "Boyfriend", "Neighbor", "Dane", "Crush", "Special Someone"]

def option_2
  "#{rand(5..13)} Ways #{VERB_PHRASE_2.sample} #{NOUN_2.sample}!!"
end

################## OPTION 2 ###################

################## OPTION 3 ###################

BUZZ_START_3 = ["Lab Created", "No Mother Could Love This", "Circuses Won't Even Show This", "What No One Is Talking About: Genetically Created"]

BUZZ_END_3 = ["Has Science Gone Too Far???", "1 Like 1 Prayer!!", "Why Is No One Talking About This?!"]

APPENDAGE_3 = ["Legged ", "Armed ", "Headed ", "Nosed ", "Eared ", "Winged ", "Brained "]

OBJECT_3 = [" Dog. ", " Child. ", " Boy. ", " Girl. ", " Dane. ", " Elephant.", " Cat. ", " Table. ", " Chair. "]

def option_3
  BUZZ_START_3.sample + " #{rand(1..8)} " + APPENDAGE_3.sample + OBJECT_3.sample + BUZZ_END_3.sample
end

################## OPTION 3 ###################

################## COMMENTS ##################

STANDALONE = ["LMFAO!", "Wat", "First", "lol", "that's dumb", "neat", "have an upvote", "clickbait warning", "repost"]

START = ["LMFAO! That's so ", "You're so ", "ur ", "your "]

MID = ["dumb", "funny", "lame"]

################# COMMENTS ###################

################# SUBREDDITS ###################

subreddits = ["games", "art", "bikes", "movies", "music", "news", "coding", "front", "funny", "Austin", "AskScience"]


################# SUBREDDITS ###################


def options
  [option_1, option_2, option_3]
end

def comment_phrases
  [STANDALONE.sample, [START.sample + MID.sample].join]
end


CELEB_1.each do |name|
  User.create!(username: name, email: "#{name}@example.com", password: "password")
end

subreddits.each do |subr|
  board = Board.new(name: subr)
  board.save
  3.times do
    Link.create!(title: options.sample, board_id: board.id, user_id: rand(1..7))
  end
end

100.times do
  Comment.create!(body: comment_phrases.sample, link_id: rand(1..30), user_id: rand(1..7))
end

300.times do
  Upvote.create!(link_id: rand(1..30))
end
