# frozen_string_literal: true

# 30.times do
#  title = Faker::FunnyName.two_word_name #=> "Shirley Knot"
#  body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4) #=> "Vomito unde uxor annus. Et patior utilis sursum."
#  Question.create title: title, body: body
# end

User.find_each do |u|
  u.send(:set_gravatar_hash)
  u.save
end
