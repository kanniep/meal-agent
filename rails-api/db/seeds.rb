admin_role = Role.create(id: 1, name: 'admin')
shop_owner_role = Role.create(id: 2, name: 'shop_owner')
ordinary_role = Role.create(id: 3, name: 'ordinary')

admin = User.create(id: 1, email: 'st120367@ait.asia', roles: [admin_role, ordinary_role])
