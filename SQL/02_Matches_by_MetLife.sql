SELECT match_date,stage,venue_name,city
FROM matches
JOIN venues ON matches.venue_id=venues.venue_id
WHERE venue_name = 'MetLife Stadium';