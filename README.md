# What is it? #
A Sinatra-based soccer rotation automator, designed for AYSO-style "everyone plays everywhere" strategy. Currently it only works for a six-position (2 - 1 - 2 plus keeper) team over a six-game half-season, since that's what my son plays. :-)

# How does it work? #
The algorithm rotates each player through all the positions and the bench in a way that they are regularly paired with different players on offense and defense and constantly rotated between offense and defense. The sequence is: Left Forward, Left Defender, Left Bench, Midfielder, Keeper, Middle Bench, Right Forward, Right Defender, Right Bench, then starting again.

For a 9-player roster, in order to guarantee equal playing time, every 3rd game a player will have to sit out 2 quarters. The remaining games every player will play the AYSO-recommended 3 quarters, with no player ever playing all 4 quarters. This can be manually-adjusted on game day when some players don't show up. For 6, 7 and 8-player rosters, players will not sit as often and sometimes play all 4 quarters.
