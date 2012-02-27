class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  
  raise WrongNumberOfPlayersError unless game.length == 2
  
  game.each do |key, value| 
    raise NoSuchStrategyError if !['R','P','S'].include? value.upcase
  end
  
  case game[0][1]
    when "R"
      winner_index = 1 if game[1][1] == "P"
      winner_index = 0 if game[1][1] == "S"
      winner_index = 0 if game[1][1] == "R"
    when "P"
      winner_index = 1 if game[1][1] == "S"
      winner_index = 0 if game[1][1] == "R"
      winner_index = 0 if game[1][1] == "P"
    when "S"
      winner_index = 1 if game[1][1] == "R"
      winner_index = 0 if game[1][1] == "P"
      winner_index = 0 if game[1][1] == "S"
  end
  
  return game[winner_index.to_i]
  
end

# p rps_game_winner([ ["Armando", "R"], ["Dave", "R"] ])

def rps_tournament_winner(bracket)
  
  if bracket[0][0].class == String
    return rps_game_winner(bracket)
  else
    return rps_tournament_winner([rps_tournament_winner(bracket[0]), rps_tournament_winner(bracket[1])])
  end
  
end

=begin
p rps_tournament_winner(
[
[
[ ["Armando", "P"], ["Dave", "S"] ],
[ ["Richard", "R"],  ["Michael", "S"] ],
],
[ 
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
]
]
)
=end