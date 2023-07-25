
-- First target is a good ballplaying goalkeeper --
-- Selecting GK with good attributes --

SELECT Name, Nationality, Passing, Composure, Vision, Decision, Salary
FROM FM2023.attributes
WHERE Position = 'GK'  AND 
Passing >= 10 AND
Composure >= 10 AND
Vision >= 10 AND
Decision >= 10;

-- Too many results --
-- Let's restrict the search to cheaper players, as we are a lower division club --
-- And British players, as they are more likely to get a work permit --

SELECT Name, Nationality, Passing, Composure, Vision, Decision, Salary
FROM (SELECT Name, Nationality, Passing, Composure, Vision, Decision, Salary
FROM FM2023.attributes
WHERE Position = 'GK'  AND 
Passing >= 10 AND
Composure >= 10 AND
Vision >= 10 AND
Decision >= 10)
WHERE Nationality = 'England'OR
Nationality = "Scotland" OR
Nationality = 'Wales' OR
Nationality = 'Northern Ireland' AND
Salary <= 20000
ORDER BY Salary ASC;

-- Next target is a strong but technical striker--
-- We want him to be at least 180cm tall--

SELECT Name, Nationality, Finishing, Heading, Strength, Height
FROM FM2023.attributes
WHERE Position = 'S' AND
Height >= 180 AND
Finishing >= 10 AND 
Heading >= 10 AND
Strength >= 10;

-- We will apply the cheap British player filter again --

SELECT Name, Nationality, Salary, Finishing, Heading, Strength, Height
FROM (SELECT Name, Nationality, Finishing, Heading, Strength, Height, Salary
FROM FM2023.attributes
WHERE Position = 'S' AND
Height >= 180 AND
Finishing >= 10 AND 
Heading >= 10 AND
Strength >= 10)
WHERE Nationality = 'England'OR
Nationality = "Scotland" OR
Nationality = 'Wales' OR
Nationality = 'Northern Ireland' AND
Salary <= 20000
ORDER BY Salary ASC;

-- Now we will search for a fullback with elite delivery -- 
-- We will now apply the cheap and British filter directly --

SELECT Name, Nationality, Salary, Crossing
FROM (SELECT Name, Nationality, Salary, Crossing
FROM FM2023.attributes
WHERE Crossing >= 10 AND
DL >= 15 OR DR >= 15 AND Crossing >= 10)
WHERE Nationality = 'England'OR
Nationality = "Scotland" OR
Nationality = 'Wales' OR
Nationality = 'Northern Ireland' AND
Salary <= 20000
ORDER BY Salary ASC;

-- Lastly we are searching for the teams new captain --
-- We will pay a premium for him and search abroad aswell -- 
-- As we are looking for a player with higher reputation --

SELECT Name, Age, Nationality, Leadership
FROM FM2023.attributes
WHERE Age >= 30 AND
Leadership >= 15 AND
Salary <= 30000
ORDER BY Leadership DESC