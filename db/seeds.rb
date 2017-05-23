if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

testDepartment  = Department.create( name: 'DepartmentName' )
testWorker      = Worker.create( fn: 'fn', sn: 'sn', ln: 'ln', passport: '0123456789', inn: '012345678901', birthday: '1996.4.7', position: 'position', department: testDepartment )
testProject     = Project.create( name: 'ProjectName', start: '2017.04.07', end: '2017.05.07', price: '1000' )
