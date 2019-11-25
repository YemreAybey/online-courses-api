require 'faker'

TYPE = ['Javascript', 'Ruby', 'Rails', 'React']
Course.destroy_all
10.times do |ind|
  Course.create({
    author: Faker::ProgrammingLanguage.creator,
    duration: '2 hours',
    detail: TYPE[ind % TYPE.size]
  })
end