-- What are the namses of the players that signed up for the most services? 

SELECT 
	CONCAT(first_name, " ", last_name) as "Player name", 
    COUNT(service_player_id) "Services"
FROM service_player 
	JOIN players ON players.player_id = service_player.player_id
GROUP BY CONCAT(first_name, " ", last_name)
ORDER BY COUNT(service_player_id) desc
LIMIT 5;

-- What are the names of coach who are the most active?  

SELECT 
	CONCAT(first_name, " ", last_name) as "Coach name",
    COUNT(service_player_id) as "Services"
FROM coaches 
	JOIN services ON coaches.coach_id = services.coach_id
    JOIN service_player ON services.service_id = service_player.service_id
GROUP BY CONCAT(first_name, " ", last_name)
ORDER BY COUNT(service_player_id) desc
LIMIT 5;

-- What is a total income from each service ? 
    
SELECT
	service_character as "Service name",
    COUNT(service_player_id) as "Number of services",
	SUM(price) as Price
FROM services
	JOIN service_player ON services.service_id = service_player.service_id
GROUP BY service_character
ORDER BY SUM(price) desc;


