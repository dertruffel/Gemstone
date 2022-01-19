User.create!([
  {email: "test@mail.ch", password: "tester", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 8, current_sign_in_at: "2022-01-18 17:32:00", last_sign_in_at: "2022-01-18 16:55:49", current_sign_in_ip: "::1", last_sign_in_ip: "::1", isadmin: false},
  {email: "admin@admin.ch", password: "adminer", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 9, current_sign_in_at: "2022-01-18 17:32:12", last_sign_in_at: "2022-01-18 16:56:06", current_sign_in_ip: "::1", last_sign_in_ip: "::1", isadmin: true}
])
#test account password: tester
#admin account password: adminer
# rake db:seed