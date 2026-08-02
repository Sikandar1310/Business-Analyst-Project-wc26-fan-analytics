SELECT match_date, stage, venue_name
FROM matches
JOIN venues ON matches.venue_id = venues.venue_id;