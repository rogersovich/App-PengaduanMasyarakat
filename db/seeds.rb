# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

include BCrypt

Role.create([
    { name: 'Admin' },
    { name: 'Petugas' },
    { name: 'Masyarakat' }
])

User.create([
    { name: 'Admin', username: 'admin', password: Password.create('admin'), telp:'08983231096', role_id: 1 },
    { name: 'Petugas', username: 'petugas', password: Password.create('petugas'),telp: '08963435096', role_id: 2 }
])

Society.create(name: 'Luke', username: 'luke', password: Password.create('luke'), telp: '08982321096')
