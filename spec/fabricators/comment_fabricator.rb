Fabricator(:comment) do
  body { Faker::Lorem.paragraphs(2).join("\n")}
end