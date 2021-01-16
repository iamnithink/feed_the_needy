
# super_admin
if Rails.env.development? || Rails.env.staging?
  super_admin = SuperAdmin.find_by_email('superadmin@feedtheneedy.com')
  super_admin ||= SuperAdmin.create(
    first_name: 'Super Admin',
    email: 'superadmin@feedtheneedy.com',
    password: 'password',
    password_confirmation: 'password'
  )
  puts 'created super admin'
end