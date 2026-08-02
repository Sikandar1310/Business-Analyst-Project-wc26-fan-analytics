SELECT venue_name,city,h.team_name,a.team_name,team1_score,team2_score
FROM matches
JOIN venues ON matches.venue_id=venues.venue_id
JOIN teams h
ON matches.team1_id=h.team_id
Join teams a
ON matches.team2_id=a.team_id;


