Fabricator(:article) do
  title { sequence(:title_counter) {|i| "#{Faker::Lorem.sentence} (#{i})"} }
  body  { Faker::Lorem.paragraphs(3).join("\n") }
  comments(:count => 3) {|article, index| Fabricate(:comment, body: "#{index}")}
end



Fabricator(:article_without_comments, :from => :article) do
  comments(:count => 0)
end

# Fabricator(:article) do
#   title { sequence(:title_counter) {|i| "#{Faker::Lorem.sentence} (#{i})" } }
#   body  { Faker::Lorem.paragraphs(3).join("\n") }
#   comments(:count => 3) {|comment, index| Fabricate(:comment, :body => comment)}
# end