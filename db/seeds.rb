# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create Company Types
CompanyType.create([{name: 'Public'},{name: 'Private'}])

#Create Job Categories
JobCategory.create([
                       {name: 'Accounting'},
                       {name: 'Banking & Finance'},
                       {name: 'Engineering'},
                       {name: 'Education'},
                       {name: 'Government'},
                       {name: 'Hotel - Hospitality'},
                       {name: 'Information Technology'},
                       {name: 'Insurance'},
                       {name: 'Management'},
                       {name: 'Marketing'},
                       {name: 'Pharmaceutical'},
                       {name: 'QA- Quality Control'},
                       {name: 'Telecommunications'},
                       {name: 'Training'},
                       {name: 'Warehouse'},
                       {name: 'Other'}
                   ])
