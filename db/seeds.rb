# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

b1 = Broadcast.create({
	session_name: "test broadcast 1",
	broadcast_date: Date.parse("01/01/2012 00:00")
})

b2 = Broadcast.create({
	session_name: "test broadcast 2",
	broadcast_date: Date.parse("01/01/2012 00:00")
})

b3 = Broadcast.create({
	session_name: "test broadcast 3",
	broadcast_date: Date.parse("01/01/2012 00:00")
})

Mix.create({
	name: "test mix 1",
	url: "htpt://foo",
	broadcast: b1
})

Mix.create({
	name: "test mix 2",
	url: "htpt://bar",
	broadcast: b1
})

Mix.create({
	name: "test mix 3",
	url: "htpt://foo",
	broadcast: b2
})

Mix.create({
	name: "test mix 4",
	url: "htpt://bar",
	broadcast: b2
})

Mix.create({
	name: "test mix 5",
	url: "htpt://foo",
	broadcast: b2
})

Mix.create({
	name: "test mix 6",
	url: "htpt://bar",
	broadcast: b2
})

Mix.create({
	name: "test mix 7",
	url: "htpt://foo",
	broadcast: b3
})

Mix.create({
	name: "test mix 8",
	url: "htpt://bar",
	broadcast: b3
})

Mix.create({
	name: "test mix 9",
	url: "htpt://foo",
	broadcast: b3
})

Mix.create({
	name: "test mix 10",
	url: "htpt://bar",
	broadcast: b3
})
