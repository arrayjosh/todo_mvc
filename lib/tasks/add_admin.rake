desc "Add an admin by email"
task :add_admin, [:email] => :environment do |task, args|
  puts args.inspect
  User.find_by_email(args.email).update_attribute(:is_admin, true)
end
