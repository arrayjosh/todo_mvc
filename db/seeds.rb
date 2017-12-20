# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed my admin account
admin = User.new({
  firstname: "Joshua",
  lastname: "Sanderlin",
  email: "joshua.sanderlin@gmail.com",
  password: "password",
  is_admin: true,
})
admin.skip_confirmation!
admin.save!

content = <<anything_should_work
<p><img src="https://factsempire.com/wp-content/uploads/2017/04/FIrst-prize.jpg" alt="First Prize" width="190" height="293" /></p>
<h2>Hello World</h2>
<p>We're number 1!</p>
anything_should_work

Article.create({
  title: 'The First Article',
  content: content,
  user_id: admin.id,
  })

37.times do
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  email = Faker::Internet.email(firstname + lastname)
  password = "password"
  user = User.new({
    firstname: firstname,
    lastname: lastname,
    email: email,
    password: password,
  })
  user.skip_confirmation!
  user.save!

  5.times do
    Article.create({
      title: Faker::FamilyGuy.quote,
      content: Faker::Hacker.say_something_smart,
      user_id: user.id
    })

    list = List.create({
      name: Faker::Food.dish,
      user_id: user.id,
    })

    5.times do
      recipe = rand(2) == 0 ? Faker::Food.ingredient : Faker::Food.spice

      Item.create({
        completed: false,
        list_id: list.id,
        description: "#{Faker::Food.measurement} #{recipe}",
      })
    end
  end
end
