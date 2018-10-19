admin_role = Role.create(name: 'admin')
shop_owner_role = Role.create(name: 'shop_owner')
ordinary_role = Role.create(name: 'ordinary')

admin = User.create(email: 'st120367@ait.asia', password: 'Kan21341722', roles: [admin_role, ordinary_role])
