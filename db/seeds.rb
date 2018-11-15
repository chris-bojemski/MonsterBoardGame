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
t1 = Team.create(name:'Pallet Town Pwners')
pikac = Monster.find_by(name: 'pikachu')
charm = Monster.find_by(name: 'charmander')
squir = Monster.find_by(name: 'squirtle')
pidge = Monster.find_by(name: 'pidgeotto')
ratic = Monster.find_by(name: 'raticate')
venus = Monster.find_by(name: 'venusaur')
t1.monsters << pikac
t1.monsters << charm
t1.monsters << squir
t1.monsters << pidge
t1.monsters << ratic
t1.monsters << venus

t2 = Team.create(name:"Lance's Sea Monsters")
drati = Monster.find_by(name: 'dratini')
drago = Monster.find_by(name: 'dragonair')
aerod = Monster.find_by(name: 'aerodactyl')
gyara = Monster.find_by(name: 'gyarados')
warto = Monster.find_by(name: 'wartortle')
dnite = Monster.find_by(name: 'dragonite')
t2.monsters << drati
t2.monsters << drago
t2.monsters << aerod
t2.monsters << gyara
t2.monsters << warto
t2.monsters << dnite


t3 = Team.create(name:'Pokemon Tower Ghouls')
geodu = Monster.find_by(name: 'geodude')
zubat = Monster.find_by(name: 'zubat')
gastl = Monster.find_by(name: 'gastly')
marow = Monster.find_by(name: 'marowak')
haunt = Monster.find_by(name: 'haunter')
genga = Monster.find_by(name: 'gengar')
t3.monsters << geodu
t3.monsters << zubat
t3.monsters << gastl
t3.monsters << marow
t3.monsters << haunt
t3.monsters << genga

t4 = Team.create(name:'Safari Zone Hunters')
ekans = Monster.find_by(name: 'ekans')
cater = Monster.find_by(name: 'caterpie')
cubon = Monster.find_by(name: 'cubone')
nidor = Monster.find_by(name: 'nidorina')
raich = Monster.find_by(name: 'raichu')
nidok = Monster.find_by(name: 'nidoking')
t4.monsters << ekans
t4.monsters << cater
t4.monsters << cubon
t4.monsters << nidor
t4.monsters << raich
t4.monsters << nidok

puts '👍  Done seeding.'
