And(/^the forum board "([^"]*)" exists$/) do |board|
  Thredded::Messageboard.create(name: board)
end

Then(/^there should be "([^"]*)" topic on the board "([^"]*)"$/) do |number, name|
  board = Thredded::Messageboard.find_by(name: name)
  expect(board.topics.count).to eq number.to_i
end

Then(/^there should be "([^"]*)" posts in the topic "([^"]*)"$/) do |number, title|
  topic = Thredded::Topic.find_by(title: title)
  expect(topic.posts.count).to eq number.to_i
end