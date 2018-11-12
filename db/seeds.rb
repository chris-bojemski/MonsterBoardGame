require_relative '../app/models/api_handler'

api = ApiHandler.new

api.get_type_data_from_api
puts ''

api.make_type_data
puts ''

api.make_move_data
puts ''

api.get_pokemon_data
puts ''

api.eliminate_extra_urls
puts ''

offset = api.get_detailed_pokemon_offset

puts 'Retrieving detailed Pokemon information...'
puts 'Should take roughly 20+ min'
api.get_detailed_pokemon_data(offset, limit=151) #, limit=151
puts ''
puts 'Done.'
puts ''

api.make_pokemon_type_data
puts ''

api.make_available_moves
puts ''

puts 'Finding strongest move and attaching to Monster.'
puts '⚠️  WARNING  ⚠️'
puts 'Not all Monsters have moves in our dataset.'
api.link_strongest_attack
puts ''

print 'Getting evolution chain links.'
api.get_evolution_chain_links
puts ''

print 'Acquiring chain data and setting chains.'
api.set_evolution_chains
puts ''

puts "⚠️  Manual updates to Monsters that had baby pre-evolutions in later gens."
Monster.update(25, evo_level: 1)
Monster.update(26, evo_level: 2)
Monster.update(35, evo_level: 1)
Monster.update(36, evo_level: 2)
Monster.update(39, evo_level: 1)
Monster.update(40, evo_level: 1)
Monster.update(106, evo_level: 1)
Monster.update(107, evo_level: 1)
Monster.update(113, evo_level: 1)
Monster.update(122, evo_level: 1)
Monster.update(124, evo_level: 1)
Monster.update(125, evo_level: 1)
Monster.update(126, evo_level: 1)
Monster.update(143, evo_level: 1)
puts ''

puts 'Making Teams.'
t1 = Team.create(name:'Pallet Town')
pikac = Monster.find_by(name: 'pikachu')
charm = Monster.find_by(name: 'charmander')
squir = Monster.find_by(name: 'squirtle')
pidge = Monster.find_by(name: 'pidgeotto')
radic = Monster.find_by(name: 'radicate')
venus = Monster.find_by(name: 'venusaur')
t1.monsters << pikac
t1.monsters << charm
t1.monsters << squir
t1.monsters << pidge
t1.monsters << radic
t1.monsters << venus

t2 = Team.create(name:'Lance')
drati = Monster.find_by(name: 'dratini')
gyara = Monster.find_by(name: 'gyarados')
drago = Monster.find_by(name: 'dragonair')
dnite = Monster.find_by(name: 'dragonite')
aerod = Monster.find_by(name: 'aerodactyl')
czard = Monster.find_by(name: 'charizard')
t2.monsters << gyara
t2.monsters << drati
t2.monsters << drago
t2.monsters << dnite
t2.monsters << aerod
t2.monsters << czard

t3 = Team.create(name:'Weirdos')
jynx = Monster.find_by(name: 'jynx')
mrmim = Monster.find_by(name: 'mr-mime')
genga = Monster.find_by(name: 'gengar')
farfe = Monster.find_by(name: 'farfetchd')
poryg = Monster.find_by(name: 'porygon')
magik = Monster.find_by(name: 'magikarp')

t3.monsters << jynx
t3.monsters << mrmim
t3.monsters << genga
t3.monsters << farfe
t3.monsters << poryg
t3.monsters << magik


puts '👍  Done seeding.'