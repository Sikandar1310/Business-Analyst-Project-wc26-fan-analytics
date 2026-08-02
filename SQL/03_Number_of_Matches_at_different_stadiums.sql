SELECT venue_name,city,COUNT(matches.venue_id) 
FROM matches
JOIN venues ON matches.venue_id=venues.venue_id
GROUP BY venue_name;
