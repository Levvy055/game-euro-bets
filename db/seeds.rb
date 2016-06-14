# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


tUser = User.create(visible_name: 'test', password: '1234', email: 'test@t.t')

A = Group.create(name: 'A')
B = Group.create(name: 'B')
C = Group.create(name: 'C')
D = Group.create(name: 'D')
E = Group.create(name: 'E')
F = Group.create(name: 'F')

AL = Country.create(name: 'Albania', code: 'AL', group: A)
AU = Country.create(name: 'Austria', code: 'AU', group: F)
BE = Country.create(name: 'Belgium', code: 'BE', group: E)
CR = Country.create(name: 'Croatia', code: 'CR', group: D)
CZ = Country.create(name: 'Czech Republic', code: 'CZ', group: D)
EN = Country.create(name: 'England', code: 'EN', group: B)
FR = Country.create(name: 'France', code: 'FR', group: A)
GE = Country.create(name: 'Germany', code: 'GE', group: C)
HU = Country.create(name: 'Hungary', code: 'HU', group: F)
IC = Country.create(name: 'Iceland', code: 'IC', group: F)
IR = Country.create(name: 'Ireland', code: 'IR', group: E)
IT = Country.create(name: 'Italy', code: 'IT', group: E)
NI = Country.create(name: 'Northern Ireland', code: 'NI', group: C)
PL = Country.create(name: 'Poland', code: 'PL', group: C)
PO = Country.create(name: 'Portugal', code: 'PO', group: F)
RO = Country.create(name: 'Romania', code: 'RO', group: A)
RU = Country.create(name: 'Russia', code: 'RU', group: B)
SL = Country.create(name: 'Slovakia', code: 'SL', group: B)
SP = Country.create(name: 'Spain', code: 'SP', group: D)
SE = Country.create(name: 'Sweden', code: 'SE', group: E)
SW = Country.create(name: 'Switzerland', code: 'SW', group: A)
TU = Country.create(name: 'Turkey', code: 'TU', group: D)
UK = Country.create(name: 'Ukraine', code: 'UK', group: C)
WA = Country.create(name: 'Wales', code: 'WA', group: B)

date = DateTime.new(2016, 06, 10, 18, 0, 0)

m1 = Match.create(country_a: FR, country_b: RO, start_time: date.change(hour: 21), score_a: 2, score_b: 1)
m2 = Match.create(country_a: AL, country_b: SW, start_time: date.change(day: 11, hour: 15), score_a: 0, score_b: 1)
m3 = Match.create(country_a: RO, country_b: SW, start_time: date.change(day: 15))
m4 = Match.create(country_a: FR, country_b: AL, start_time: date.change(day: 15, hour: 21))
m5 = Match.create(country_a: RO, country_b: AL, start_time: date.change(day: 19, hour: 21))
m6 = Match.create(country_a: SW, country_b: FR, start_time: date.change(day: 19, hour: 21))

m7 = Match.create(country_a: WA, country_b: SL, start_time: date.change(day: 11), score_a: 2, score_b: 1)
m8 = Match.create(country_a: EN, country_b: RU, start_time: date.change(day: 11, hour: 21), score_a: 1, score_b: 1)
m9 = Match.create(country_a: RU, country_b: SL, start_time: date.change(day: 15, hour: 15))
m10 = Match.create(country_a: EN, country_b: WA, start_time: date.change(day: 16, hour: 15))
m11 = Match.create(country_a: RU, country_b: WA, start_time: date.change(day: 20, hour: 21))
m12 = Match.create(country_a: SL, country_b: EN, start_time: date.change(day: 20, hour: 21))

m13 = Match.create(country_a: PL, country_b: NI, start_time: date.change(day: 12), score_a: 1, score_b: 0)
m14 = Match.create(country_a: GE, country_b: UK, start_time: date.change(day: 12, hour: 21), score_a: 2, score_b: 0)
m15 = Match.create(country_a: UK, country_b: NI, start_time: date.change(day: 16))
m16 = Match.create(country_a: GE, country_b: PL, start_time: date.change(day: 16, hour: 21))
m17 = Match.create(country_a: UK, country_b: PL, start_time: date.change(day: 21))
m18 = Match.create(country_a: NI, country_b: GE, start_time: date.change(day: 21))

m19 = Match.create(country_a: TU, country_b: CR, start_time: date.change(day: 12, hour: 15), score_a: 0, score_b: 1)
m20 = Match.create(country_a: SP, country_b: CZ, start_time: date.change(day: 13, hour: 15))
m21 = Match.create(country_a: CZ, country_b: CR, start_time: date.change(day: 17))
m22 = Match.create(country_a: SP, country_b: TU, start_time: date.change(day: 17, hour: 21))
m23 = Match.create(country_a: CZ, country_b: TU, start_time: date.change(day: 21, hour: 21))
m24 = Match.create(country_a: CR, country_b: SP, start_time: date.change(day: 21, hour: 21))

m25 = Match.create(country_a: IR, country_b: SE, start_time: date.change(day: 13))
m26 = Match.create(country_a: BE, country_b: IT, start_time: date.change(day: 13, hour: 21))
m27 = Match.create(country_a: IT, country_b: SE, start_time: date.change(day: 17, hour: 15))
m28 = Match.create(country_a: BE, country_b: IR, start_time: date.change(day: 18, hour: 15))
m29 = Match.create(country_a: IT, country_b: IR, start_time: date.change(day: 22, hour: 21))
m30 = Match.create(country_a: SE, country_b: BE, start_time: date.change(day: 22, hour: 21))

m31 = Match.create(country_a: AU, country_b: HU, start_time: date.change(day: 14))
m32 = Match.create(country_a: PO, country_b: IC, start_time: date.change(day: 14, hour: 21))
m33 = Match.create(country_a: IC, country_b: HU, start_time: date.change(day: 18))
m34 = Match.create(country_a: PO, country_b: AU, start_time: date.change(day: 18, hour: 21))
m35 = Match.create(country_a: IC, country_b: AU, start_time: date.change(day: 22))
m36 = Match.create(country_a: HU, country_b: PO, start_time: date.change(day: 22))


Bet.create(user: tUser, match: m1, score_a: 1, score_b: 1 )
Bet.create(user: tUser, match: m2, score_a: 2, score_b: 1 )
Bet.create(user: tUser, match: m3, score_a: 1, score_b: 2 )
Bet.create(user: tUser, match: m4, score_a: 0, score_b: 1 )
Bet.create(user: tUser, match: m4, score_a: 1, score_b: 1 )