# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

employee_list = [
  {
    first_name: "Nicolas",
    last_name: "Genest",
    title: "CEO",
    email: "nicolas.genest@codeboxx.biz"
  },
  {
    first_name: "Nadya",
    last_name: "Fortier",
    title: "Director",
    email: "nadya.fortier@codeboxx.biz"
  },
  {
    first_name: "Martin",
    last_name: "Chantal",
    title: "Director Assistant",
    email: "martin.chantal@codeboxx.biz"
  },
  {
    first_name: "Mathieu",
    last_name: "Houde",
    title: "Captain",
    email: "mathieu.houde@codeboxx.biz"
  },
  {
    first_name: "David",
    last_name: "Boutin",
    title: "Engineer",
    email: "david.boutin@codeboxx.biz"
  },
  {
    first_name: "Mathieu",
    last_name: "Lortie",
    title: "Engineer",
    email: "mathieu.lortie@codeboxx.biz"
  },
  {
    first_name: "Thomas",
    last_name: "Carrier",
    title: "Engineer",
    email: "thomas.carrier@codeboxx.biz"
  },
]

puts "Seed Started"
######################################################

#-----------------------------------------------### Seed Employee ###-------------------------------------------------
puts "Seed Employee"
employee_list.each do |employee|
  user = User.create!(
    email: employee[:email],
    password: "codeboxx1",
    employee_role: true,
    user_role: false
  )
  employee = Employee.create!(
    first_name: employee[:first_name],
    last_name: employee[:last_name],
    title: employee[:title],
    email: employee[:email],
    user: user
  )
end

### Seeding Users for presentation ###
User.create!(email: 'admin@admin.com', password: 'password', superadmin_role: 1, employee_role: 0, user_role: 0)
User.create!(email: 'employee@employee.com', password: 'password', superadmin_role: 0, employee_role: 1, user_role: 0)
User.create!(email: 'user@user.com', password: 'password', superadmin_role: 0, employee_role: 0, user_role: 1)


#-----------------------------------------------### Seed Address ###-------------------------------------------------
puts "Seed Addresses"
address_list=[
  {
      "address1": "1420 Turtleback Trail",
      "address2": "",
      "city": "Panama City",
      "state": "FL",
      "postalCode": "32413",
      "country": "US",
      "lat": 30.281084,
      "lng": -85.9677169
      
  },
  {
      "address1": "6990 Pierson Street",
      "address2": "",
      "city": "Arvada",
      "state": "CO",
      "postalCode": "80004",
      "country": "US",
      "lat": 39.824425,
      "lng": -105.122103
  },
  {
      "address1": "376 North Williams Drive",
      "address2": "",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72701",
      "country": "US",
      "lat": 36.067997,
      "lng": -94.142563      
  },
  {
      "address1": "3617 Menlo Court",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36116",
      "country": "US",
      "lat": 32.307397,
      "lng": -86.26001099999999
  },
  {
      "address1": "711 Parker Street",
      "address2": "",
      "city": "East Longmeadow",
      "state": "MA",
      "postalCode": "01028",
      "country": "US",
      "lat": 42.082262,
      "lng": -72.488113
  },
  {
      "address1": "8521 Crystal Street",
      "address2": "",
      "city": "Anchorage",
      "state": "AK",
      "postalCode": "99502",
      "country": "US",
      "lat": 61.143426,
      "lng": -149.94665
  },
  {
      "address1": "1622 Edgar D Nixon Avenue",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36104",
      "country": "US",
      "lat": 32.356384,
      "lng": -86.3128909
  },
  {
      "address1": "1608 Gales Street Northeast",
      "address2": "",
      "city": "Washington",
      "state": "DC",
      "postalCode": "20002",
      "country": "US",
      "lat": 38.8985542,
      "lng": -76.9813444
  },
  {
      "address1": "122 East Hayes Street",
      "address2": "",
      "city": "Norman",
      "state": "OK",
      "postalCode": "73069",
      "country": "US",
      "lat": 35.232121,
      "lng": -97.445053
  },
  {
      "address1": "5144 Cattail Court",
      "address2": "",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72701",
      "country": "US",
      "lat": 36.041153,
      "lng": -94.087419
  },
  {
      "address1": "131 Kent Drive",
      "address2": "",
      "city": "Manchester",
      "state": "CT",
      "postalCode": "06042",
      "country": "US",
      "lat": 41.803084,
      "lng": -72.492786
  },
  {
      "address1": "2313 Vegas Avenue",
      "address2": "",
      "city": "Castro Valley",
      "state": "CA",
      "postalCode": "94546",
      "country": "US",
      "lat": 37.689189,
      "lng": -122.076775
  },
  {
      "address1": "5420 Sunset Avenue",
      "address2": "",
      "city": "Panama City Beach",
      "state": "FL",
      "postalCode": "32408",
      "country": "US",
      "lat": 30.145603,
      "lng": -85.755095
  },
  {
      "address1": "242 North Ash Street",
      "address2": "",
      "city": "Fruita",
      "state": "CO",
      "postalCode": "81521",
      "country": "US",
      "lat": 39.161544,
      "lng": -108.725378
  },
  {
      "address1": "38676 Greenwich Circle",
      "address2": "",
      "city": "Fremont",
      "state": "CA",
      "postalCode": "94536",
      "country": "US",
      "lat": 37.562256,
      "lng": -121.976451
  },
  {
      "address1": "2426 East Onyx Trail",
      "address2": "#6",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72701",
      "country": "US",
      "lat": 36.065707,
      "lng": -94.1276125
  },
  {
      "address1": "110 Seaton Place Northwest",
      "address2": "",
      "city": "Washington",
      "state": "DC",
      "postalCode": "20001",
      "country": "US",
      "lat": 38.9146701,
      "lng": -77.01264680000001
  },
  {
      "address1": "5385 Iris Street",
      "address2": "",
      "city": "Arvada",
      "state": "CO",
      "postalCode": "80002",
      "country": "US",
      "lat": 39.794498,
      "lng": -105.106056
  },
  {
      "address1": "5628 West Tonopah Drive",
      "address2": "",
      "city": "Glendale",
      "state": "AZ",
      "postalCode": "85308",
      "country": "US",
      "lat": 33.6710947,
      "lng": -112.1810955
  },
  {
      "address1": "65 Bay Drive",
      "address2": "",
      "city": "Annapolis",
      "state": "MD",
      "postalCode": "21403",
      "country": "US",
      "lat": 38.937493,
      "lng": -76.45638699999999
  },
  {
      "address1": "7401 North 61st Drive",
      "address2": "",
      "city": "Glendale",
      "state": "AZ",
      "postalCode": "85301",
      "country": "US",
      "lat": 33.5450005,
      "lng": -112.191417
  },
  {
      "address1": "8 Watkins Road",
      "address2": "",
      "city": "Milton",
      "state": "VT",
      "postalCode": "05468",
      "country": "US",
      "lat": 44.6028809,
      "lng": -73.17689299999999
  },
  {
      "address1": "2209 June Drive",
      "address2": "",
      "city": "Nashville",
      "state": "TN",
      "postalCode": "37214",
      "country": "US",
      "lat": 36.16848,
      "lng": -86.695241
  },
  {
      "address1": "1840 Nobel Place",
      "address2": "",
      "city": "Louisville",
      "state": "KY",
      "postalCode": "40216",
      "country": "US",
      "lat": 38.198892,
      "lng": -85.8090129
  },
  {
      "address1": "2622 Martin Luther King Junior Boulevard",
      "address2": "",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72704",
      "country": "US",
      "lat": 36.053922,
      "lng": -94.1973008
  },
  {
      "address1": "4 Glen Circle",
      "address2": "",
      "city": "Glen Burnie",
      "state": "MD",
      "postalCode": "21060",
      "country": "US",
      "lat": 39.157751,
      "lng": -76.60633399999999
  },
  {
      "address1": "7529 West 72nd Avenue",
      "address2": "#4",
      "city": "Arvada",
      "state": "CO",
      "postalCode": "80003",
      "country": "US",
      "lat": 39.8276128,
      "lng": -105.0799305
  },
  {
      "address1": "10996 Largo Drive",
      "address2": "",
      "city": "Savannah",
      "state": "GA",
      "postalCode": "31419",
      "country": "US",
      "lat": 31.99178,
      "lng": -81.14366799999999
  },
  {
      "address1": "2027 North Shannon Drive",
      "address2": "#5",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72703",
      "country": "US",
      "lat": 36.0892622,
      "lng": -94.17333020000001
  },
  {
      "address1": "154 Boca Lagoon Drive",
      "address2": "",
      "city": "Panama City Beach",
      "state": "FL",
      "postalCode": "32408",
      "country": "US",
      "lat": 30.171012,
      "lng": -85.77501099999999
  },
  {
      "address1": "3311 Wiley Post Loop",
      "address2": "",
      "city": "Anchorage",
      "state": "AK",
      "postalCode": "99517",
      "country": "US",
      "lat": 61.18686499999999,
      "lng": -149.946288
  },
  {
      "address1": "5055 West 58th Avenue",
      "address2": "",
      "city": "Arvada",
      "state": "CO",
      "postalCode": "80002",
      "country": "US",
      "lat": 39.8024171,
      "lng": -105.0505121
  },
  {
      "address1": "3228 Chettenham Drive",
      "address2": "",
      "city": "Rancho Cordova",
      "state": "CA",
      "postalCode": "95670",
      "country": "US",
      "lat": 38.577813,
      "lng": -121.301333
  },
  {
      "address1": "1901 North Midwest Boulevard",
      "address2": "",
      "city": "Edmond",
      "state": "OK",
      "postalCode": "73034",
      "country": "US",
      "lat": 35.67413,
      "lng": -97.39058399999999
  },
  {
      "address1": "1536 North Main Street",
      "address2": "",
      "city": "Salinas",
      "state": "CA",
      "postalCode": "93906",
      "country": "US",
      "lat": 36.7122208,
      "lng": -121.6522485
  },
  {
      "address1": "33 Linscott Road",
      "address2": "",
      "city": "Hingham",
      "state": "MA",
      "postalCode": "02043",
      "country": "US",
      "lat": 42.2257391,
      "lng": -70.8828675
  },
  {
      "address1": "1732 27th Avenue",
      "address2": "",
      "city": "Oakland",
      "state": "CA",
      "postalCode": "94601",
      "country": "US",
      "lat": 37.783431,
      "lng": -122.228238
  },
  {
      "address1": "22 Gallatin Street Northeast",
      "address2": "",
      "city": "Washington",
      "state": "DC",
      "postalCode": "20011",
      "country": "US",
      "lat": 38.9526368,
      "lng": -77.0080993
  },
  {
      "address1": "8125 Glynnwood Drive",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36117",
      "country": "US",
      "lat": 32.341844,
      "lng": -86.14093
  },
  {
      "address1": "2139 Glynnwood Drive",
      "address2": "",
      "city": "Savannah",
      "state": "GA",
      "postalCode": "31404",
      "country": "US",
      "lat": 32.021538,
      "lng": -81.06860999999999
  },
  {
      "address1": "14 School Street",
      "address2": "",
      "city": "Medway",
      "state": "MA",
      "postalCode": "02053",
      "country": "US",
      "lat": 42.141711,
      "lng": -71.395014
  },
  {
      "address1": "264 Crest Drive",
      "address2": "",
      "city": "Soldotna",
      "state": "AK",
      "postalCode": "99669",
      "country": "US",
      "lat": 60.497608,
      "lng": -151.080848
  },
  {
      "address1": "307 Joel Street",
      "address2": "",
      "city": "Pooler",
      "state": "GA",
      "postalCode": "31322",
      "country": "US",
      "lat": 32.123265,
      "lng": -81.24991
  },
  {
      "address1": "188 River Road",
      "address2": "",
      "city": "Essex",
      "state": "VT",
      "postalCode": "05452",
      "country": "US",
      "lat": 44.478846,
      "lng": -73.058294
  },
  {
      "address1": "1643 Oxford Street",
      "address2": "R C",
      "city": "Berkeley",
      "state": "CA",
      "postalCode": "94709",
      "country": "US",
      "lat": 37.877894,
      "lng": -122.266436
  },
  {
      "address1": "5545 Saddlewood Lane",
      "address2": "",
      "city": "Brentwood",
      "state": "TN",
      "postalCode": "37027",
      "country": "US",
      "lat": 36.026888,
      "lng": -86.7576629
  },
  {
      "address1": "26466 Mockingbird Lane",
      "address2": "",
      "city": "Hayward",
      "state": "CA",
      "postalCode": "94544",
      "country": "US",
      "lat": 37.6410262,
      "lng": -122.0864272
  },
  {
      "address1": "4840 Reservoir Road Northwest",
      "address2": "",
      "city": "Washington",
      "state": "DC",
      "postalCode": "20007",
      "country": "US",
      "lat": 38.9158933,
      "lng": -77.0962873
  },
  {
      "address1": "599 Cambridge Street",
      "address2": "#303",
      "city": "Cambridge",
      "state": "MA",
      "postalCode": "02141",
      "country": "US",
      "lat": 42.3720518,
      "lng": -71.08610949999999
  },
  {
      "address1": "584 Rural Hill Road",
      "address2": "",
      "city": "Nashville",
      "state": "TN",
      "postalCode": "37217",
      "country": "US",
      "lat": 36.089291,
      "lng": -86.621854
  },
  {
      "address1": "10262 West 59th Avenue",
      "address2": "#1",
      "city": "Arvada",
      "state": "CO",
      "postalCode": "80004",
      "country": "US",
      "lat": 39.803718,
      "lng": -105.111974
  },
  {
      "address1": "945 South 5th Street",
      "address2": "#1020",
      "city": "Louisville",
      "state": "KY",
      "postalCode": "40203",
      "country": "US",
      "lat": 38.2402351,
      "lng": -85.76031119999999
  },
  {
      "address1": "2543 The Meadows",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36116",
      "country": "US",
      "lat": 32.3463001,
      "lng": -86.2185382
  },
  {
      "address1": "153 Atlantic Avenue",
      "address2": "#6",
      "city": "Salisbury",
      "state": "MA",
      "postalCode": "01952",
      "country": "US",
      "lat": 42.8339101,
      "lng": -70.81575269999999
  },
  {
      "address1": "9 Brooklyn Street",
      "address2": "",
      "city": "Morristown",
      "state": "VT",
      "postalCode": "05488",
      "country": "US",
      "lat": 44.924599,
      "lng": -73.12809399999999
  },
  {
      "address1": "5722 8th Street Northwest",
      "address2": "",
      "city": "Washington",
      "state": "DC",
      "postalCode": "20011",
      "country": "US",
      "lat": 38.959305,
      "lng": -77.024463
  },
  {
      "address1": "8700 Seaton Boulevard",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36116",
      "country": "US",
      "lat": 32.3378676,
      "lng": -86.1731595
  },
  {
      "address1": "1004 Bellflower Street",
      "address2": "",
      "city": "Livermore",
      "state": "CA",
      "postalCode": "94551",
      "country": "US",
      "lat": 37.710745,
      "lng": -121.732765
  },
  {
      "address1": "4738 Mallard Common",
      "address2": "",
      "city": "Fremont",
      "state": "CA",
      "postalCode": "94555",
      "country": "US",
      "lat": 37.5666441,
      "lng": -122.0444344
  },
  {
      "address1": "875 Latouche Street",
      "address2": "#APT 001010",
      "city": "Anchorage",
      "state": "AK",
      "postalCode": "99501",
      "country": "US",
      "lat": 61.2132529,
      "lng": -149.8608243
  },
  {
      "address1": "4940 Fuller Road",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36110",
      "country": "US",
      "lat": 32.42936,
      "lng": -86.21683519999999
  },
  {
      "address1": "5754 Belleau Drive",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36117",
      "country": "US",
      "lat": 32.394398,
      "lng": -86.203138
  },
  {
      "address1": "1403 Lincoln Street",
      "address2": "",
      "city": "Savannah",
      "state": "GA",
      "postalCode": "31401",
      "country": "US",
      "lat": 32.0613716,
      "lng": -81.09482249999999
  },
  {
      "address1": "140 South Hill Avenue",
      "address2": "#305",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72701",
      "country": "US",
      "lat": 36.0618737,
      "lng": -94.16920189999999
  },
  {
      "address1": "642 South 2nd Street",
      "address2": "#608",
      "city": "Louisville",
      "state": "KY",
      "postalCode": "40202",
      "country": "US",
      "lat": 38.2472593,
      "lng": -85.7549195
  },
  {
      "address1": "6473 Zephyr Street",
      "address2": "",
      "city": "Arvada",
      "state": "CO",
      "postalCode": "80004",
      "country": "US",
      "lat": 39.814341,
      "lng": -105.085116
  },
  {
      "address1": "4250 North Valley Lake Drive",
      "address2": "#8",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72703",
      "country": "US",
      "lat": 36.1279064,
      "lng": -94.12180719999999
  },
  {
      "address1": "565 North Lakeshore Drive",
      "address2": "",
      "city": "Panama City Beach",
      "state": "FL",
      "postalCode": "32413",
      "country": "US",
      "lat": 30.246868,
      "lng": -85.918511
  },
  {
      "address1": "5514 West Wedington Drive",
      "address2": "#3",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72704",
      "country": "US",
      "lat": 36.079411,
      "lng": -94.240031
  },
  {
      "address1": "1909 Wainwright Avenue",
      "address2": "",
      "city": "Panama City",
      "state": "FL",
      "postalCode": "32405",
      "country": "US",
      "lat": 30.183868,
      "lng": -85.722174
  },
  {
      "address1": "4525 West Frier Drive",
      "address2": "",
      "city": "Glendale",
      "state": "AZ",
      "postalCode": "85301",
      "country": "US",
      "lat": 33.5488732,
      "lng": -112.1565998
  },
  {
      "address1": "201 West Montgomery Cross Road",
      "address2": "#170",
      "city": "Savannah",
      "state": "GA",
      "postalCode": "31406",
      "country": "US",
      "lat": 31.9996137,
      "lng": -81.13121
  },
  {
      "address1": "915 Heath Drive",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36108",
      "country": "US",
      "lat": 32.363883,
      "lng": -86.333247
  },
  {
      "address1": "95 Briarwood Drive",
      "address2": "",
      "city": "Manchester",
      "state": "CT",
      "postalCode": "06040",
      "country": "US",
      "lat": 41.745751,
      "lng": -72.542544
  },
  {
      "address1": "69 Washington Street",
      "address2": "",
      "city": "Manchester",
      "state": "CT",
      "postalCode": "06042",
      "country": "US",
      "lat": 41.78712489999999,
      "lng": -72.52083069999999
  },
  {
      "address1": "2900 North Western Avenue",
      "address2": "",
      "city": "Edmond",
      "state": "OK",
      "postalCode": "73012",
      "country": "US",
      "lat": 35.687568,
      "lng": -97.53227299999999
  },
  {
      "address1": "7841 West Kristal Way",
      "address2": "",
      "city": "Glendale",
      "state": "AZ",
      "postalCode": "85308",
      "country": "US",
      "lat": 33.658804,
      "lng": -112.228834
  },
  {
      "address1": "361 Parmley Lane",
      "address2": "",
      "city": "Nashville",
      "state": "TN",
      "postalCode": "37207",
      "country": "US",
      "lat": 36.2446128,
      "lng": -86.8197718
  },
  {
      "address1": "6120 Southeast 84th Street",
      "address2": "",
      "city": "Oklahoma City",
      "state": "OK",
      "postalCode": "73135",
      "country": "US",
      "lat": 35.380836,
      "lng": -97.41582
  },
  {
      "address1": "9428 North 65th Drive",
      "address2": "",
      "city": "Glendale",
      "state": "AZ",
      "postalCode": "85302",
      "country": "US",
      "lat": 33.571222,
      "lng": -112.20045
  },
  {
      "address1": "11 Meeting Place Circle",
      "address2": "",
      "city": "Boxford",
      "state": "MA",
      "postalCode": "01921",
      "country": "US",
      "lat": 42.6946519,
      "lng": -71.0008529
  },
  {
      "address1": "4438 Maine Avenue",
      "address2": "",
      "city": "Baldwin Park",
      "state": "CA",
      "postalCode": "91706",
      "country": "US",
      "lat": 34.093409,
      "lng": -117.959953
  },
  {
      "address1": "65 Jones Lane",
      "address2": "",
      "city": "Montevallo",
      "state": "AL",
      "postalCode": "35115",
      "country": "US",
      "lat": 33.096851,
      "lng": -86.846577
  },
  {
      "address1": "3140 Commander Drive",
      "address2": "",
      "city": "Louisville",
      "state": "KY",
      "postalCode": "40220",
      "country": "US",
      "lat": 38.215781,    
      "lng": -85.653981
  },
  {
      "address1": "107 Guaymas Place",
      "address2": "",
      "city": "Davis",
      "state": "CA",
      "postalCode": "95616",
      "country": "US",
      "lat": 38.567048,
      "lng": -121.746046
  },
  {
      "address1": "6114 West Glenn Drive",
      "address2": "#1",
      "city": "Glendale",
      "state": "AZ",
      "postalCode": "85301",
      "country": "US",
      "lat": 33.5401454,
      "lng": -112.1912722
  },
  {
      "address1": "622 Thomas Street",
      "address2": "",
      "city": "Woodland",
      "state": "CA",
      "postalCode": "95776",
      "country": "US",
      "lat": 38.672731,
      "lng": -121.76065
  },
  {
      "address1": "127 Grand Heron Drive",
      "address2": "",
      "city": "Panama City",
      "state": "FL",
      "postalCode": "32407",
      "country": "US",
      "lat": 30.189702,
      "lng": -85.80841099999999
  },
  {
      "address1": "3504 East 16th Avenue",
      "address2": "",
      "city": "Anchorage",
      "state": "AK",
      "postalCode": "99508",
      "country": "US",
      "lat": 61.2058945,
      "lng": -149.8158624
  },
  {
      "address1": "1230 Stafford Drive",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36117",
      "country": "US",
      "lat": 32.32403,
      "lng": -86.14840099999999
  },
  {
      "address1": "6007 Yarrow Street",
      "address2": "H",
      "city": "Arvada",
      "state": "CO",
      "postalCode": "80004",
      "country": "US",
      "lat": 39.806211,
      "lng": -105.084446
  },
  {
      "address1": "632 Belmar Drive",
      "address2": "",
      "city": "Edmond",
      "state": "OK",
      "postalCode": "73025",
      "country": "US",
      "lat": 35.7016024,
      "lng": -97.4912627
  },
  {
      "address1": "1515 Chandlee Avenue",
      "address2": "",
      "city": "Panama City",
      "state": "FL",
      "postalCode": "32405",
      "country": "US",
      "lat": 30.176365,
      "lng": -85.666253
  },
  {
      "address1": "10632 Admiral Court",
      "address2": "",
      "city": "Oklahoma City",
      "state": "OK",
      "postalCode": "73162",
      "country": "US",
      "lat": 35.57886200000001,
      "lng": -97.6270728
  },
  {
      "address1": "11655 West 81st Avenue",
      "address2": "",
      "city": "Arvada",
      "state": "CO",
      "postalCode": "80005",
      "country": "US",
      "lat": 39.84356820000001,
      "lng": -105.1297584
  },
  {
      "address1": "3500 Blanchard Drive Southwest",
      "address2": "",
      "city": "Washington",
      "state": "DC",
      "postalCode": "20032",
      "country": "US",
      "lat": 38.8388931,
      "lng": -77.02011139999999
  },
  {
      "address1": "2755 Country Drive",
      "address2": "#244",
      "city": "Fremont",
      "state": "CA",
      "postalCode": "94536",
      "country": "US",
      "lat": 37.557882,
      "lng": -121.986823
  },
  {
      "address1": "1850 Berryhill Place",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36117",
      "country": "US",
      "lat": 32.3527548,
      "lng": -86.16858669999999
  },
  {
      "address1": "58 North U.S.A Drive",
      "address2": "",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72701",
      "country": "US",
      "lat": 35.994914,
      "lng": -94.185867
  },
  {
      "address1": "8785 Ellis Court",
      "address2": "",
      "city": "Arvada",
      "state": "CO",
      "postalCode": "80005",
      "country": "US",
      "lat": 39.853725,
      "lng": -105.158861
  },
  {
      "address1": "1636 Briarview Court",
      "address2": "",
      "city": "Severn",
      "state": "MD",
      "postalCode": "21144",
      "country": "US",
      "lat": 39.12539599999999,
      "lng": -76.704015
  },
  {
      "address1": "12 Knox Street",
      "address2": "",
      "city": "Manchester",
      "state": "CT",
      "postalCode": "06040",
      "country": "US",
      "lat": 41.774166,
      "lng": -72.527697
  },
  {
      "address1": "425 Middle Turnpike East",
      "address2": "",
      "city": "Manchester",
      "state": "CT",
      "postalCode": "06040",
      "country": "US",
      "lat": 41.7847772,
      "lng": -72.50354829999999
  },
  {
      "address1": "2017 North Hartford Drive",
      "address2": "",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72701",
      "country": "US",
      "lat": 36.08820499999999,
      "lng": -94.1074905
  },
  {
      "address1": "5900 Upland Road",
      "address2": "",
      "city": "Brooklyn Park",
      "state": "MD",
      "postalCode": "21225",
      "country": "US",
      "lat": 39.213888,
      "lng": -76.61925099999999
  },
  {
      "address1": "9331 Edison Road",
      "address2": "",
      "city": "Lithia",
      "state": "FL",
      "postalCode": "33547",
      "country": "US",
      "lat": 27.86851,
      "lng": -82.07391199999999
  },
  {
      "address1": "1810 Orchard Place",
      "address2": "",
      "city": "Anchorage",
      "state": "AK",
      "postalCode": "99502",
      "country": "US",
      "lat": 61.145912,
      "lng": -149.9134259
  },
  {
      "address1": "145 Grau Drive",
      "address2": "",
      "city": "Fremont",
      "state": "CA",
      "postalCode": "94536",
      "country": "US",
      "lat": 37.582453,
      "lng": -121.994476
  },
  {
      "address1": "3959 Fairlands Drive",
      "address2": "",
      "city": "Pleasanton",
      "state": "CA",
      "postalCode": "94588",
      "country": "US",
      "lat": 37.6992001,
      "lng": -121.8703701
  },
  {
      "address1": "3613 East 18th Avenue",
      "address2": "",
      "city": "Anchorage",
      "state": "AK",
      "postalCode": "99508",
      "country": "US",
      "lat": 61.20485339999999,
      "lng": -149.8135521
  },
  {
      "address1": "1275 South Holland Drive",
      "address2": "",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72704",
      "country": "US",
      "lat": 36.051782,
      "lng": -94.226855
  },
  {
      "address1": "109 Cambridge Station Road",
      "address2": "",
      "city": "Louisville",
      "state": "KY",
      "postalCode": "40223",
      "country": "US",
      "lat": 38.244527,
      "lng": -85.56912799999999
  },
  {
      "address1": "2107 Elfen Glen",
      "address2": "Apt B",
      "city": "Van Buren",
      "state": "AR",
      "postalCode": "72956",
      "country": "US",
      "lat": 35.469752,
      "lng": -94.364987
  },
  {
      "address1": "8522 Ingalls Circle",
      "address2": "",
      "city": "Arvada",
      "state": "CO",
      "postalCode": "80003",
      "country": "US",
      "lat": 39.8528593,
      "lng": -105.0629778
  },
  {
      "address1": "1809 Cedar Drive",
      "address2": "",
      "city": "Severn",
      "state": "MD",
      "postalCode": "21144",
      "country": "US",
      "lat": 39.139311,
      "lng": -76.72028999999999
  },
  {
      "address1": "1376 Oakland Avenue",
      "address2": "#1",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72703",
      "country": "US",
      "lat": 36.080981,
      "lng": -94.172549
  },
  {
      "address1": "4306 Bylsma Circle",
      "address2": "",
      "city": "Panama City",
      "state": "FL",
      "postalCode": "32404",
      "country": "US",
      "lat": 30.223294,
      "lng": -85.589715
  },
  {
      "address1": "233 Buckland Hills Drive",
      "address2": "",
      "city": "Manchester",
      "state": "CT",
      "postalCode": "06042",
      "country": "US",
      "lat": 41.8100683,
      "lng": -72.5453665
  },
  {
      "address1": "7701 Southwest 104th Street",
      "address2": "",
      "city": "Oklahoma City",
      "state": "OK",
      "postalCode": "73169",
      "country": "US",
      "lat": 35.3641983,
      "lng": -97.6475346
  },
  {
      "address1": "14003 Crossbranch Court",
      "address2": "",
      "city": "Louisville",
      "state": "KY",
      "postalCode": "40245",
      "country": "US",
      "lat": 38.242033,
      "lng": -85.489885
  },
  {
      "address1": "19590 East Batavia Drive",
      "address2": "",
      "city": "Aurora",
      "state": "CO",
      "postalCode": "80011",
      "country": "US",
      "lat": 39.7420886,
      "lng": -104.7581149
  },
  {
      "address1": "6424 Simms Street",
      "address2": "#71",
      "city": "Arvada",
      "state": "CO",
      "postalCode": "80004",
      "country": "US",
      "lat": 39.8133443,
      "lng": -105.1283237
  },
  {
      "address1": "718 Dutchmans Court",
      "address2": "",
      "city": "Nashville",
      "state": "TN",
      "postalCode": "37076",
      "country": "US",
      "lat": 36.2048851,
      "lng": -86.5994752
  },
  {
      "address1": "8496 Isles Court",
      "address2": "",
      "city": "Pasadena",
      "state": "MD",
      "postalCode": "21122",
      "country": "US",
      "lat": 39.111297,
      "lng": -76.467049
  },
  {
      "address1": "100 East Joyce Boulevard",
      "address2": "#110",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72703",
      "country": "US",
      "lat": 36.1253411,
      "lng": -94.1551631
  },
  {
      "address1": "9036 Calico Court",
      "address2": "",
      "city": "Hesperia",
      "state": "CA",
      "postalCode": "92344",
      "country": "US",
      "lat": 34.414491,
      "lng": -117.375403
  },
  {
      "address1": "2723 East Joyce Boulevard",
      "address2": "",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72703",
      "country": "US",
      "lat": 36.119414,
      "lng": -94.12229500000001
  },
  {
      "address1": "90 Via Verde",
      "address2": "",
      "city": "San Lorenzo",
      "state": "CA",
      "postalCode": "94580",
      "country": "US",
      "lat": 37.67869,    
      "lng": -122.117142
  },
  {
      "address1": "1015 Castle Road",
      "address2": "",
      "city": "Edmond",
      "state": "OK",
      "postalCode": "73034",
      "country": "US",
      "lat": 35.665019,
      "lng": -97.466045
  },
  {
      "address1": "2787 West Blackstone Crossing",
      "address2": "",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72704",
      "country": "US",
      "lat": 36.0608984,
      "lng": -94.1993461
  },
  {
      "address1": "3555 Alamosa Drive",
      "address2": "",
      "city": "Anchorage",
      "state": "AK",
      "postalCode": "99502",
      "country": "US",
      "lat": 61.142316,
      "lng": -149.9454749
  },
  {
      "address1": "6231 North 59th Avenue",
      "address2": "#35",
      "city": "Glendale",
      "state": "AZ",
      "postalCode": "85301",
      "country": "US",
      "lat": 33.5285304,
      "lng": -112.1860744
  },
  {
      "address1": "311 South Panama Street",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36107",
      "country": "US",
      "lat": 32.376833,
      "lng": -86.27416099999999
  },
  {
      "address1": "3313 Daisy Trail",
      "address2": "",
      "city": "Nashville",
      "state": "TN",
      "postalCode": "37013",
      "country": "US",
      "lat": 36.076186,
      "lng": -86.60113799999999
  },
  {
      "address1": "5436 Dorbrandt Street",
      "address2": "#APT 000002",
      "city": "Anchorage",
      "state": "AK",
      "postalCode": "99518",
      "country": "US",
      "lat": 61.17090200000001,
      "lng": -149.904782
  },
  {
      "address1": "553 South Arlington Road",
      "address2": "",
      "city": "Orange",
      "state": "CA",
      "postalCode": "92869",
      "country": "US",
      "lat": 33.7794839,
      "lng": -117.820383
  },
  {
      "address1": "615 Q Street Northwest",
      "address2": "",
      "city": "Washington",
      "state": "DC",
      "postalCode": "20001",
      "country": "US",
      "lat": 38.9113118,
      "lng": -77.0206808
  },
  {
      "address1": "457 Mountain Village Boulevard",
      "address2": "#320-3",
      "city": "Mountain Village",
      "state": "CO",
      "postalCode": "81435",
      "country": "US",
      "lat": 37.93323040000001,
      "lng": -107.8515732
  },
  {
      "address1": "144 Lauderdale Street",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36116",
      "country": "US",
      "lat": 32.309978,
      "lng": -86.259716
  },
  {
      "address1": "2 Ambelwood Way",
      "address2": "",
      "city": "Savannah",
      "state": "GA",
      "postalCode": "31411",
      "country": "US",
      "lat": 31.9138389,
      "lng": -81.07297989999999
  },
  {
      "address1": "4113 Holiday Drive",
      "address2": "",
      "city": "Panama City",
      "state": "FL",
      "postalCode": "32408",
      "country": "US",
      "lat": 30.1548681,
      "lng": -85.7709976
  },
  {
      "address1": "2001 Van Hoose Drive",
      "address2": "",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72701",
      "country": "US",
      "lat": 36.039421,
      "lng": -94.065534
  },
  {
      "address1": "9457 Winfield Place",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36117",
      "country": "US",
      "lat": 32.341347,
      "lng": -86.14867799999999
  },
  {
      "address1": "1120 Mitchell Young Road",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36108",
      "country": "US",
      "lat": 32.327464,
      "lng": -86.44011599999999
  },
  {
      "address1": "12816 West 65th Way",
      "address2": "",
      "city": "Arvada",
      "state": "CO",
      "postalCode": "80004",
      "country": "US",
      "lat": 39.8141779,
      "lng": -105.1426275
  },
  {
      "address1": "10 Erick Road",
      "address2": "#47",
      "city": "Mansfield",
      "state": "MA",
      "postalCode": "02048",
      "country": "US",
      "lat": 42.032505,
      "lng": -71.17718599999999
  },
  {
      "address1": "481 East Redbud Lane",
      "address2": "",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72703",
      "country": "US",
      "lat": 36.103899,
      "lng": -94.151128
  },
  {
      "address1": "320 Northwest 22nd Street",
      "address2": "",
      "city": "Oklahoma City",
      "state": "OK",
      "postalCode": "73103",
      "country": "US",
      "lat": 35.491908,
      "lng": -97.51843099999999
  },
  {
      "address1": "33 South Hill Avenue",
      "address2": "#306",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72701",
      "country": "US",
      "lat": 36.0619602,
      "lng": -94.16977700000001
  },
  {
      "address1": "355 Gillette Road",
      "address2": "",
      "city": "Nashville",
      "state": "TN",
      "postalCode": "37211",
      "country": "US",
      "lat": 36.061143,
      "lng": -86.70823299999999
  },
  {
      "address1": "151 Main Street",
      "address2": "",
      "city": "Savannah",
      "state": "GA",
      "postalCode": "31408",
      "country": "US",
      "lat": 32.113199,
      "lng": -81.148934
  },
  {
      "address1": "545 Tracey Drive",
      "address2": "",
      "city": "Panama City",
      "state": "FL",
      "postalCode": "32404",
      "country": "US",
      "lat": 30.1354251,
      "lng": -85.5573034
  },
  {
      "address1": "3 Southerberry Drive",
      "address2": "",
      "city": "Milton",
      "state": "VT",
      "postalCode": "05468",
      "country": "US",
      "lat": 44.62322460000001,
      "lng": -73.1326629
  },
  {
      "address1": "736 Sicard Street Southeast",
      "address2": "",
      "city": "Washington",
      "state": "DC",
      "postalCode": "20003",
      "country": "US",
      "lat": 38.8729038,
      "lng": -76.9949528
  },
  {
      "address1": "6214 Herzog Street",
      "address2": "",
      "city": "Oakland",
      "state": "CA",
      "postalCode": "94608",
      "country": "US",
      "lat": 37.84557849999999,
      "lng": -122.2825201
  },
  {
      "address1": "1160 North College Avenue",
      "address2": "#2",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72703",
      "country": "US",
      "lat": 36.0785477,
      "lng": -94.1566273
  },
  {
      "address1": "5843 West McLellan Road",
      "address2": "",
      "city": "Glendale",
      "state": "AZ",
      "postalCode": "85301",
      "country": "US",
      "lat": 33.5330898,
      "lng": -112.1857087
  },
  {
      "address1": "1452 55th Avenue",
      "address2": "B",
      "city": "Oakland",
      "state": "CA",
      "postalCode": "94621",
      "country": "US",
      "lat": 37.767671,
      "lng": -122.202326
  },
  {
      "address1": "4255 Tanager Common",
      "address2": "",
      "city": "Fremont",
      "state": "CA",
      "postalCode": "94555",
      "country": "US",
      "lat": 37.5738888,
      "lng": -122.0460256
  },
  {
      "address1": "13426 West Rovey Avenue",
      "address2": "",
      "city": "Litchfield Park",
      "state": "AZ",
      "postalCode": "85340",
      "country": "US",
      "lat": 33.522973,
      "lng": -112.34802
  },
  {
      "address1": "195 Nursery Street",
      "address2": "#D10",
      "city": "Springfield",
      "state": "MA",
      "postalCode": "01104",
      "country": "US",
      "lat": 42.1178409,
      "lng": -72.5892289
  },
  {
      "address1": "126 Marjorie Lane",
      "address2": "C",
      "city": "Manchester",
      "state": "CT",
      "postalCode": "06042",
      "country": "US",
      "lat": 41.8073257,
      "lng": -72.5188292
  },
  {
      "address1": "22 Charnock Street",
      "address2": "#2",
      "city": "Beverly",
      "state": "MA",
      "postalCode": "01915",
      "country": "US",
      "lat": 42.55227,
      "lng": -70.876549
  },
  {
      "address1": "817 25th Street Northwest",
      "address2": "",
      "city": "Washington",
      "state": "DC",
      "postalCode": "20037",
      "country": "US",
      "lat": 38.900077,
      "lng": -77.053066
  },
  {
      "address1": "2552 Massachusetts Avenue Northwest",
      "address2": "",
      "city": "Washington",
      "state": "DC",
      "postalCode": "20008",
      "country": "US",
      "lat": 38.9165459,
      "lng": -77.057323
  },
  {
      "address1": "1711 Lore Road",
      "address2": "#APT 000106",
      "city": "Anchorage",
      "state": "AK",
      "postalCode": "99507",
      "country": "US",
      "lat": 61.15195259999999,
      "lng": -149.8511487
  },
  {
      "address1": "19091 Northeast 23rd Street",
      "address2": "",
      "city": "Harrah",
      "state": "OK",
      "postalCode": "73045",
      "country": "US",
      "lat": 35.493447,
      "lng": -97.193078
  },
  {
      "address1": "8318 North 57th Drive",
      "address2": "",
      "city": "Glendale",
      "state": "AZ",
      "postalCode": "85302",
      "country": "US",
      "lat": 33.557537,
      "lng": -112.183238
  },
  {
      "address1": "7256 West 84th Way",
      "address2": "#918",
      "city": "Arvada",
      "state": "CO",
      "postalCode": "80003",
      "country": "US",
      "lat": 39.8506912,
      "lng": -105.0767393
  },
  {
      "address1": "706 Seagrove Road",
      "address2": "",
      "city": "Glen Burnie",
      "state": "MD",
      "postalCode": "21060",
      "country": "US",
      "lat": 39.163384,
      "lng": -76.609205
  },
  {
      "address1": "2318 Camryns Crossing",
      "address2": "",
      "city": "Panama City",
      "state": "FL",
      "postalCode": "32405",
      "country": "US",
      "lat": 30.221926,
      "lng": -85.62420000000002
  },
  {
      "address1": "968 Virginia Avenue",
      "address2": "",
      "city": "Olivehurst",
      "state": "CA",
      "postalCode": "95961",
      "country": "US",
      "lat": 39.1022419,
      "lng": -121.581218
  },
  {
      "address1": "416 South University Boulevard",
      "address2": "",
      "city": "Norman",
      "state": "OK",
      "postalCode": "73069",
      "country": "US",
      "lat": 35.215351,
      "lng": -97.446319
  },
  {
      "address1": "137 Gazebo East Drive",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36117",
      "country": "US",
      "lat": 32.3793507,
      "lng": -86.20407399999999
  },
  {
      "address1": "10723 Colonial Woods Court",
      "address2": "",
      "city": "Louisville",
      "state": "KY",
      "postalCode": "40223",
      "country": "US",
      "lat": 38.2496439,
      "lng": -85.55717709999999
  },
  {
      "address1": "119 Matthew Lane",
      "address2": "",
      "city": "Nashville",
      "state": "TN",
      "postalCode": "37215",
      "country": "US",
      "lat": 36.11663619999999,
      "lng": -86.80955829999999
  },
  {
      "address1": "3142 West Finger Road",
      "address2": "",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72701",
      "country": "US",
      "lat": 36.042837,
      "lng": -94.205309
  },
  {
      "address1": "4 Elm Street",
      "address2": "",
      "city": "Windsor",
      "state": "VT",
      "postalCode": "05089",
      "country": "US",
      "lat": 43.476997,
      "lng": -72.398925
  },
  {
      "address1": "78 School Street",
      "address2": "",
      "city": "Woburn",
      "state": "MA",
      "postalCode": "01801",
      "country": "US",
      "lat": 42.506877,
      "lng": -71.15299
  },
  {
      "address1": "19020 North 68th Avenue",
      "address2": "",
      "city": "Glendale",
      "state": "AZ",
      "postalCode": "85308",
      "country": "US",
      "lat": 33.6574037,
      "lng": -112.2062039
  },
  {
      "address1": "2849 Quail Drive",
      "address2": "",
      "city": "Fayetteville",
      "state": "AR",
      "postalCode": "72704",
      "country": "US",
      "lat": 36.095294,
      "lng": -94.20036300000001
  },
  {
      "address1": "2456 22nd Avenue",
      "address2": "",
      "city": "Greeley",
      "state": "CO",
      "postalCode": "80631",
      "country": "US",
      "lat": 40.397153,
      "lng": -104.713982
  },
  {
      "address1": "200 Boulder Road",
      "address2": "",
      "city": "Manchester",
      "state": "CT",
      "postalCode": "06040",
      "country": "US",
      "lat": 41.7792079,
      "lng": -72.494963
  },
  {
      "address1": "11150 Sun Valley Drive",
      "address2": "",
      "city": "Oakland",
      "state": "CA",
      "postalCode": "94605",
      "country": "US",
      "lat": 37.752039,
      "lng": -122.11822
  },
  {
      "address1": "505 Southeast 32nd Street",
      "address2": "",
      "city": "Oklahoma City",
      "state": "OK",
      "postalCode": "73129",
      "country": "US",
      "lat": 35.4325058,
      "lng": -97.5032743
  },
  {
      "address1": "1025 West 19th Street",
      "address2": "#UNIT 1-C",
      "city": "Panama City",
      "state": "FL",
      "postalCode": "32405",
      "country": "US",
      "lat": 30.18252889999999,
      "lng": -85.676771
  },
  {
      "address1": "6725 Pamela Court",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36116",
      "country": "US",
      "lat": 32.334546,
      "lng": -86.20349999999999
  },
  {
      "address1": "4714 Narrow Lane Road",
      "address2": "",
      "city": "Montgomery",
      "state": "AL",
      "postalCode": "36116",
      "country": "US",
      "lat": 32.3140725,
      "lng": -86.2819674
  },
  {
      "address1": "11 Proctor Circle",
      "address2": "",
      "city": "Peabody",
      "state": "MA",
      "postalCode": "01960",
      "country": "US",
      "lat": 42.535503,
      "lng": -70.953384
  },
  {
      "address1": "10508 Kovats Court",
      "address2": "",
      "city": "Louisville",
      "state": "KY",
      "postalCode": "40223",
      "country": "US",
      "lat": 38.2330381,
      "lng": -85.5695464
  },
  {
      "address1": "3179 18th Street Northwest",
      "address2": "",
      "city": "Washington",
      "state": "DC",
      "postalCode": "20010",
      "country": "US",
      "lat": 38.9312712,
      "lng": -77.0412983
  },
  {
      "address1": "3194 Bladensburg Road Northeast",
      "address2": "",
      "city": "Washington",
      "state": "DC",
      "postalCode": "20018",
      "country": "US",
      "lat": 38.930136,
      "lng": -76.95929799999999
  },
  {
      "address1": "260 Rio Del Mar Boulevard",
      "address2": "##14",
      "city": "Aptos",
      "state": "CA",
      "postalCode": "95003",
      "country": "US",
      "lat": 36.967915,
      "lng": -121.902513
  },
  {
      "address1": "1040 West 27th Avenue",
      "address2": "#APT 000401",
      "city": "Anchorage",
      "state": "AK",
      "postalCode": "99503",
      "country": "US",
      "lat": 61.195892,
      "lng": -149.901984
  },
  {
      "address1": "42 Lake Lane",
      "address2": "",
      "city": "Westmore",
      "state": "VT",
      "postalCode": "05860",
      "country": "US",
      "lat": 44.77954099999999,
      "lng": -72.0682889
  },
  {
      "address1": "3718 Bay Tree Road",
      "address2": "",
      "city": "Lynn Haven",
      "state": "FL",
      "postalCode": "32444",
      "country": "US",
      "lat": 30.205726,
      "lng": -85.63441999999999
  },
  {
      "address1": "3408 Bellisima Place",
      "address2": "#204",
      "city": "Louisville",
      "state": "KY",
      "postalCode": "40245",
      "country": "US",
      "lat": 38.2857023,
      "lng": -85.5023064
  },
  {
      "address1": "4109 General Bate Drive",
      "address2": "",
      "city": "Nashville",
      "state": "TN",
      "postalCode": "37204",
      "country": "US",
      "lat": 36.099427,
      "lng": -86.787756
  },
  {
      "address1": "5329 A Street",
      "address2": "",
      "city": "Greeley",
      "state": "CO",
      "postalCode": "80634",
      "country": "US",
      "lat": 40.4347001,
      "lng": -104.7702805
  },
  {
      "address1": "88 Shute Street",
      "address2": "#1",
      "city": "Everett",
      "state": "MA",
      "postalCode": "02149",
      "country": "US",
      "lat": 42.4192568,
      "lng": -71.0469179
  },
]
typeChosen = ["Billing", "Shipping", "Home", "Business"]
statusChosen = ["Active", "Inactive"]
entity_type = ["Building", "Customer"]
address_list.each do |a|
  dateCreated = Faker::Date.between(from: '2018-09-01', to: '2021-02-20')
  address = Address.create!(
    type_of_address: typeChosen.sample,
    status: statusChosen.sample, 
    entity: entity_type.sample,
    number_and_street: a[:address1],
    suite_and_apartment: a[:address2],
    city: a[:city],
    postal_code: a[:postalCode],
    country: a[:country],
    notes: "",
    latitude: a[:lat],
    longitude: a[:lng]
    )
end

#Auxiliary Address variables
# type_of_address = ["Billing", "Shipping", "Home", "Business"]
# status_type = ["Active", "Inactive"]
# entity_type = ["Building", "Customer"]


# CSV.foreach(Rails.root.join('db', 'Address.csv'), headers: true) do |row|
#     Address.create!(
#       type_of_address: type_of_address.sample, 
#       status: status_type.sample, 
#       entity: entity_type.sample, 
#       number_and_street: row['number_and_street'], 
#       suite_and_apartment: nil, 
#       city: row['city'],
#       postal_code: row['postal_code'], 
#       country: row['country'], 
#       notes: nil,
#       latitude: row['lat'],
#       longitude: row['lng'])
# end


# Select addresses according to the entity
addressListBuilding = []
addressListCustomer = []

Address.all.each do |address|

  if address.entity == "Building"
    addressListBuilding << (address.id)
  end
  if address.entity == "Customer"
    addressListCustomer << (address.id)
  end

end


#-----------------------------------------------### Seed Quote ###-------------------------------------------------
puts "Seed Quote"

#---------------------------### Residential ###---------------------------
75.times do 

  num_of_floors = Faker::Number.between(from: 2, to: 60)
  num_of_apartments = Faker::Number.between(from: 5, to: 150)
  product_line = ['Standard', 'Premium', 'Excelium'].sample

  numShaftsRes = ((num_of_apartments / num_of_floors.to_f) / 6).ceil
  numColumnsRes = (num_of_floors / 20.to_f).ceil
  numTotalShaftsRes = (numShaftsRes * numColumnsRes)
  
  if product_line == 'Standard'
    value = 7565
    fee = 0.10
  elsif product_line == 'Premium'
    value = 12345
    fee = 0.13
  elsif product_line == 'Excelium'
    value = 15400
    fee = 0.16   
  end
  
  costTotalShafts = (value * numTotalShaftsRes)
  costInstallation = (fee * costTotalShafts).round(2)
  costTotal = (costTotalShafts + costInstallation)

  Quote.create!({
    company_name: Faker::Company.unique.name,
    contact_name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    product_line: product_line,
    installation_fee: costInstallation,
    sub_total: costTotalShafts,
    total: costTotal,
    building_type: "Residential",
    num_of_floors: num_of_floors,
    num_of_apartments: num_of_apartments,
    num_of_basements: Faker::Number.between(from: 1, to: 6),
    num_of_parking_spots: 0,
    num_of_distinct_businesses: 0,
    num_of_elevator_cages: 0,
    num_of_occupants_per_Floor: 0,
    num_of_activity_hours_per_day: 0,
    required_columns: numColumnsRes,
    required_shafts: numTotalShaftsRes,
    created_at: Faker::Date.between(from: '2018-02-23', to: '2021-02-23')
  })
end
#---------------------------### Commercial ###---------------------------
75.times do

  num_of_floors = Faker::Number.between(from: 2, to: 60)
  num_of_elevator_cages = Faker::Number.between(from: 1, to: 20)
  product_line = ['Standard', 'Premium', 'Excelium'].sample

  numColumns = (num_of_floors / 20.to_f).ceil
  
  if product_line == 'Standard'
    value = 7565
    fee = 0.10
  elsif product_line == 'Premium'
    value = 12345
    fee = 0.13
  elsif product_line == 'Excelium'
    value = 15400
    fee = 0.16   
  end
  
  costTotalShafts = (value * num_of_elevator_cages)
  costInstallation = (fee * costTotalShafts).round(2)
  costTotal = (costTotalShafts + costInstallation)

  Quote.create!({
    company_name: Faker::Company.unique.name,
    contact_name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    product_line: product_line,
    installation_fee: costInstallation,
    sub_total: costTotalShafts,
    total: costTotal,
    building_type: "Commercial",
    num_of_floors: num_of_floors,
    num_of_apartments: 0,
    num_of_basements: Faker::Number.between(from: 3, to: 6),
    num_of_parking_spots: Faker::Number.between(from: 10, to: 250),
    num_of_distinct_businesses: Faker::Number.between(from: 1, to: 10),
    num_of_elevator_cages: num_of_elevator_cages,
    num_of_occupants_per_Floor: 0,
    num_of_activity_hours_per_day: 0,
    required_columns: numColumns,
    required_shafts: num_of_elevator_cages,
    created_at: Faker::Date.between(from: '2018-02-23', to: '2021-02-23')
  })
end
#---------------------------### Corporate/Hybrid ###---------------------------
150.times do

  num_of_floors = Faker::Number.between(from: 2, to: 60)
  num_of_basements = Faker::Number.between(from: 2, to: 6)
  num_of_occupants_per_Floor = Faker::Number.between(from: 10, to: 150)
  product_line = ['Standard', 'Premium', 'Excelium'].sample


  totalOccupantsCorHybr= (num_of_occupants_per_Floor * (num_of_floors + num_of_basements))
  numShaftsRequired= (totalOccupantsCorHybr / 1000.to_f).ceil
  numColumnsCorHybr= ((num_of_floors + num_of_basements) / 20.to_f).ceil
  numShaftsColumm= (numShaftsRequired / numColumnsCorHybr.to_f).ceil
  numTotalShaftsCorHybr= (numShaftsColumm * numColumnsCorHybr)

  
  if product_line == 'Standard'
    value = 7565
    fee = 0.10
  elsif product_line == 'Premium'
    value = 12345
    fee = 0.13
  elsif product_line == 'Excelium'
    value = 15400
    fee = 0.16   
  end
  
  costTotalShafts = (value * numTotalShaftsCorHybr)
  costInstallation = (fee * costTotalShafts).round(2)
  costTotal = (costTotalShafts + costInstallation)

  Quote.create!({
    company_name: Faker::Company.unique.name,
    contact_name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    product_line: product_line,
    installation_fee: costInstallation,
    sub_total: costTotalShafts,
    total: costTotal,
    building_type: [:Corporate, :Hybrid].sample,
    num_of_floors: num_of_floors,
    num_of_apartments: 0,
    num_of_basements: num_of_basements,
    num_of_parking_spots: Faker::Number.between(from: 10, to: 250),
    num_of_distinct_businesses: Faker::Number.between(from: 1, to: 10),
    num_of_elevator_cages: 0,
    num_of_occupants_per_Floor: num_of_occupants_per_Floor,
    num_of_activity_hours_per_day: Faker::Number.between(from: 8, to: 24),
    required_columns: numColumnsCorHybr,
    required_shafts: numTotalShaftsCorHybr,
    created_at: Faker::Date.between(from: '2018-02-23', to: '2021-02-23')
  })
end
#-----------------------------------------------### END Seed Quote ###-------------------------------------------------


puts "Seed User, Lead, Customer, Building, BuildingDetail, Battery, Column and Elevator"

#Auxiliary BuildingDetail variables
typeList = ["Residential", "Commercial", "Corporate", "Hybrid"]
typeArchitecture = ["Neoclassical", "Victorian", "Modern", "Neofuturist"]


50.times do 
#-----------------------------------------------### Seed User ###-------------------------------------------------
    current_user = User.create!({
      email: Faker::Internet.unique.email, 
      password: 'password'
    })
    
#-----------------------------------------------### Seed Customer ###-------------------------------------------------
    current_customer = Customer.create!({
      user_id: current_user.id,
      address_id: addressListCustomer.sample,
      customers_creation_date: Faker::Date.between(from: '1976-02-23', to: '2021-02-23'),
      company_name: Faker::Company.unique.name,
      full_name_of_company_contact: Faker::Name.unique.name,
      company_contact_phone: Faker::PhoneNumber.unique.cell_phone,
      email_of_company_contact: Faker::Internet.unique.email,
      company_description: Faker::Lorem.unique.paragraph,
      full_name_of_service_technical_authority: Faker::Name.unique.name,
      technical_authority_phone_for_service_: Faker::PhoneNumber.unique.cell_phone,
      technical_manager_email_for_service: Faker::Internet.unique.email
    })

#-----------------------------------------------### Seed Building ###-------------------------------------------------
    current_building = Building.create!({
      customer_id: current_customer.id,
      address_id: addressListBuilding.sample,
      full_name_of_the_building_administrator: Faker::Name.unique.name,
      email_of_the_administrator_of_the_building: Faker::Internet.unique.email,
      phone_number_of_the_building_administrator: Faker::PhoneNumber.unique.cell_phone,
      full_name_of_the_technical_contact_for_the_building: Faker::Name.unique.name,
      technical_contact_email_for_the_building: Faker::Internet.unique.email,
      technical_contact_phone_for_the_building: Faker::PhoneNumber.unique.cell_phone,
    })

#-----------------------------------------------### Seed BuildingDetail ###-------------------------------------------------
    BuildingDetail.create!(
        information_key: "Type",
        value: typeList.sample,
        building_id: current_building.id
    )
    BuildingDetail.create!(
        information_key: "Construction Year",
        value: Faker::Date.between(from: '1950-01-01', to: '2020-02-25'),
        building_id: current_building.id
    )
    BuildingDetail.create!(
        information_key: "Architecture",
        value: typeArchitecture.sample,
        building_id: current_building.id
    )
    BuildingDetail.create!(
        information_key: "Last Renovation Year",
        value: Faker::Date.between(from: '1991-09-23', to: '2010-09-25'),
        building_id: current_building.id
    )
    BuildingDetail.create!(
        information_key: "Number of Floors",
        value: Faker::Number.between(from: 3, to: 60),
        building_id: current_building.id
    )

#-----------------------------------------------### Seed Battery ###-------------------------------------------------
    current_battery = Battery.create!({
      building_id: current_building.id,
      building_type: [:Residential, :Commercial, :Corporate, :Hybrid].sample,
      status: [:Active, :intervation, :Inactive].sample,
      employee_id: Employee.order('rand()').limit(1).first.id,
      date_of_commissioning: Faker::Date.between(from: '2018-02-23', to: '2021-02-23'),
      date_of_last_inspection: Faker::Date.between(from: '2018-02-23', to: '2021-02-23'),
      certificate_of_operations: Faker::Alphanumeric.unique.alphanumeric(number: 10),
      information: Faker::Lorem.sentence(word_count: 3),
      notes: Faker::Lorem.unique.paragraph
    })

#-----------------------------------------------### Seed Column ###-------------------------------------------------
    numRand = rand(1..3)
    numRand.times do 
      current_column = Column.create!({
        battery_id: current_battery.id,
        building_type: current_battery.building_type,
        number_of_floors_served: Faker::Number.between(from: 2, to: 60),
        status: [:Active, :Intervention, :Inactive].sample,
        information: Faker::Lorem.sentence(word_count: 3),
        notes: Faker::Lorem.unique.paragraph
      })

#-----------------------------------------------### Seed Elevator ###-------------------------------------------------
        rand(1..3).times do
          Elevator.create!({
            column_id: current_column.id,
            serial_number: Faker::Alphanumeric.unique.alphanumeric(number: 15),
            model: [:Standard, :Premium, :Excelium].sample,
            building_type: current_battery.building_type,
            status: [:Active, :Intervention, :Inactive].sample,
            date_of_commissioning: Faker::Date.between(from: '2018-02-23', to: '2021-02-23'),
            date_of_last_inspection: Faker::Date.between(from: '2018-02-23', to: '2021-02-23'),
            certificate_of_inspection: Faker::Alphanumeric.unique.alphanumeric(number: 15),
            information: Faker::Lorem.sentence(word_count: 3),
            notes: Faker::Lorem.unique.paragraph
          })
        end
    end
end

#####################################################

#-----------------------------------------------### Seed Interventions ###-------------------------------------------------
puts "Seed Interventions"

40.times do
  FactIntervention.create!({
    employee_id: Faker::Number.between(from: 1, to: 7),
    building_id: Faker::Number.between(from: 1, to: 50),
    battery_id: Faker::Number.between(from: 1, to: 50),
    column_id: Faker::Number.between(from: 1, to: 110),
    elevator_id: Faker::Number.between(from: 1, to: 190),
    start_date: Faker::Date.between(from: '2020-03-23', to: '2020-06-23'),
    end_date: Faker::Date.between(from: '2020-06-24', to: '2020-09-23'),
    result: [:Success, :Failure, :Incomplete].sample,
    report: Faker::Lorem.unique.paragraph,
    status: [:Pending, :InProgress, :Interrupted, :Resumed, :Complete].sample
  })
end

#-----------------------------------------------### Seed Lead ###-------------------------------------------------
puts "Seed Lead"

ext = ['zip', 'pdf', 'jpg', 'png', 'txt']

300.times do

  isCustomer = Faker::Boolean.boolean(true_ratio: 0.3)

  customers_id = nil

  if isCustomer
    customers_id = Faker::Number.between(from: 1, to: 50)
  end

  Lead.create!({
    full_name_of_contact: Faker::Name.name,
    company_name: Faker::Company.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.unique.cell_phone,
    project_name: Faker::Lorem.sentence(word_count: 2),
    project_description: Faker::Lorem.unique.sentence,
    department_in_charge_of_elevators: [:Sales, :Support, :Administration].sample,
    message: Faker::Lorem.unique.paragraph,
    file_name: Faker::File.file_name(dir: 'foo/bar', name: 'contact', ext: ext.sample),
    created_at: Faker::Date.between(from: '2018-02-23', to: '2021-02-23'),
    customer_id: customers_id 
  })
end

puts "Interventions Seeded"
puts "Seed Ended"