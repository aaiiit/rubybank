user  = User.create login: 'mestdaght', password: '12345', password_confirmation: '12345'
user.account.add_credit 100
user.account.save
User.create login: 'mestdagho', password: '12345', password_confirmation: '12345'
