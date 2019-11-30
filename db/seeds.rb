# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{name: 'Graphics & Design'}, {name: 'Digital Marketing'},
{name: 'Writing & Translation'}, {name: 'Video & Animation'}, {name: 'Music & Audio'},
{name: 'Programming & Tech'}, {name: 'Business'}, {name: 'Lifestyle'}])


Subcategory.create(name: 'Logo Design', category_id: categories[0].id)
Subcategory.create(name: 'Game Design', category_id: categories[0].id)
Subcategory.create(name: 'Web & Mobile Design', category_id: categories[0].id)
Subcategory.create(name: 'Cartoons & Comics', category_id: categories[0].id)
Subcategory.create(name: 'Architecture & Interior Design', category_id: categories[0].id)
Subcategory.create(name: 'Photoshop Editing', category_id: categories[0].id)
Subcategory.create(name: 'Poster Design', category_id: categories[0].id)

Subcategory.create(name: 'Social Media Marketing', category_id: categories[1].id)
Subcategory.create(name: 'Video Marketing', category_id: categories[1].id)
Subcategory.create(name: 'Crowd Funding', category_id: categories[1].id)
Subcategory.create(name: 'Content Marketing', category_id: categories[1].id)

Subcategory.create(name: 'Articles & Blog Posts', category_id: categories[2].id)
Subcategory.create(name: 'Resume & Cover Letters', category_id: categories[2].id)
Subcategory.create(name: 'Speechwriting', category_id: categories[2].id)
Subcategory.create(name: 'Transcripts', category_id: categories[2].id)

Subcategory.create(name: 'Video Editing', category_id: categories[3].id)
Subcategory.create(name: 'Lyric & Music Video', category_id: categories[3].id)
Subcategory.create(name: 'Visual Effects', category_id: categories[3].id)
Subcategory.create(name: 'Photography', category_id: categories[3].id)

Subcategory.create(name: 'Voice Over', category_id: categories[4].id)
Subcategory.create(name: 'Producers & Composers', category_id: categories[4].id)
Subcategory.create(name: 'Sound Effects', category_id: categories[4].id)
Subcategory.create(name: 'Session Musicians & Singers', category_id: categories[4].id)

Subcategory.create(name: 'Game Development', category_id: categories[5].id)
Subcategory.create(name: 'Website Builder', category_id: categories[5].id)
Subcategory.create(name: 'Mobile Apps', category_id: categories[5].id)
Subcategory.create(name: 'Support & IT', category_id: categories[5].id)
Subcategory.create(name: 'Data Analysis & Reports', category_id: categories[5].id)

Subcategory.create(name: 'Business Plans', category_id: categories[6].id)
Subcategory.create(name: 'Market Research', category_id: categories[6].id)
Subcategory.create(name: 'Legal Consulting', category_id: categories[6].id)
Subcategory.create(name: 'Career Advice', category_id: categories[6].id)

Subcategory.create(name: 'Online Lessons', category_id: categories[7].id)
Subcategory.create(name: 'Health, Nutrition & Fitness', category_id: categories[7].id)
Subcategory.create(name: 'Arts & Crafts', category_id: categories[7].id)
