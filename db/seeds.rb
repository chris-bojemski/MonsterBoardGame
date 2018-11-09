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

puts '👍  Done seeding.'