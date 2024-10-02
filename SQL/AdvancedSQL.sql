/*SQL Server does not use AUTOINCREMENT to auto-generate values for primary keys. 
In SQL Server, we should use the IDENTITY keyword instead of AUTOINCREMENT*/

CREATE TABLE Exercise_logs (Id INT PRIMARY KEY IDENTITY(1,1),
                           Type TEXT,
						   Minutes INT,
						   Calories INT,
						   Heart_rate INT)
INSERT INTO Exercise_logs(Type,Minutes,Calories,Heart_rate) VALUES 
('Biking',30,100,110)
INSERT INTO Exercise_logs(Type,Minutes,Calories,Heart_rate) VALUES
('Walking',30,30,105)
INSERT INTO Exercise_logs(Type,Minutes,Calories,Heart_rate) VALUES
('Dancing',15,200,120)

SELECT*FROM Exercise_logs
SELECT*FROM Exercise_logs WHERE Calories>50 ORDER BY Calories
/* AND */
SELECT*FROM Exercise_logs WHERE Heart_rate>100 AND Minutes<30

/*Challange 1
Ever sung karaoke? 
It's a place where you sing songs with your friends, and it's a lot of fun. 
We've created a table with songs, and in this challenge, you'll use queries to decide what songs to sing. 
For the first step, select all the song titles.*/

CREATE TABLE SongsList (
    SongId INTEGER PRIMARY KEY IDENTITY(1,1),
    SongTitle TEXT,
    SongArtist TEXT,
    Mood TEXT,
    Duration INTEGER,
    Released INTEGER)

INSERT INTO SongsList (SongTitle,SongArtist, Mood, Duration, Released)
    VALUES ('Bohemian Rhapsody', 'Queen', 'epic', 60, 1975)
INSERT INTO SongsList (SongTitle, SongArtist, Mood, Duration, Released)
    VALUES ('Let it go', 'Idina Menzel', 'epic', 227, 2013)
INSERT INTO SongsList (SongTitle, SongArtist, Mood, Duration, Released)
    VALUES ('I will survive', 'Gloria Gaynor', 'epic', 198, 1978)
INSERT INTO SongsList (SongTitle, SongArtist, Mood, Duration, Released)
    VALUES ('Twist and Shout', 'The Beatles', 'happy', 152, 1963)
INSERT INTO SongsList (SongTitle, SongArtist, Mood, Duration, Released)
    VALUES ('La Bamba', 'Ritchie Valens', 'happy', 166, 1958)
INSERT INTO SongsList (SongTitle, SongArtist, Mood, Duration, Released)
    VALUES ('I will always love you', 'Whitney Houston', 'epic', 273, 1992)
INSERT INTO SongsList (SongTitle, SongArtist, Mood, Duration, Released)
    VALUES ('Sweet Caroline', 'Neil Diamond', 'happy', 201, 1969)
INSERT INTO SongsList (SongTitle, SongArtist, Mood, Duration, Released)
    VALUES ('Call me maybe', 'Carly Rae Jepsen', 'happy', 193, 2011)

SELECT SongTitle FROM SongsList

/*Maybe your friends only like singing either recent songs or truly epic songs. 
Add another SELECT that uses OR to show the titles of the songs that have an 'epic' mood 
or a release date after 1990.*/

ALTER TABLE SongsList ALTER COLUMN Mood VARCHAR(255) /*text to varchar bc cannot be compared using equality*/
ALTER TABLE SongsList ALTER COLUMN SongTitle VARCHAR(255)
SELECT SongTitle FROM SongsList WHERE Mood='epic' OR Released>1990
SELECT SongTitle FROM SongsList WHERE Mood='epic' AND Released>1990 AND Duration<240

INSERT INTO Exercise_logs(Type, Minutes, Calories, Heart_rate) VALUES ('Tree climbing', 30, 70, 90)
INSERT INTO Exercise_logs(Type, Minutes, Calories, Heart_rate) VALUES ('Tree climbing', 25, 72, 80)
INSERT INTO Exercise_logs(Type, Minutes, Calories, Heart_rate) VALUES ('Rowing', 30, 70, 90)
INSERT INTO Exercise_logs(Type, Minutes, Calories, Heart_rate) VALUES ('Hiking', 60, 80, 85)

ALTER TABLE Exercise_logs ALTER COLUMN Type VARCHAR(255)

SELECT * FROM Exercise_logs WHERE Type = 'Biking' OR Type = 'Hiking' OR Type = 'Tree climbing' OR Type = 'Rowing'
/* IN */
SELECT * FROM Exercise_logs WHERE Type IN ('Biking','Hiking','Tree climbing','Rowing')

SELECT Type, SUM(Calories) AS Total_Cal FROM Exercise_logs GROUP BY Type

/* HAVING 
The HAVING command in SQL is used to filter the results of a GROUP BY clause. 
It works similarly to the WHERE clause, but instead of filtering rows before the grouping, 
it filters groups after the aggregation has been applied.*/

SELECT Type, SUM(Calories) AS Total_Cal FROM Exercise_logs
GROUP BY Type
HAVING SUM(Calories) > 150
    
SELECT COUNT(*) FROM Exercise_logs WHERE Heart_rate > 200

/* CASE */
SELECT Type, Heart_rate,
    CASE 
        WHEN Heart_rate > 220-30 THEN 'above max'
        WHEN Heart_rate > ROUND(0.90 * (220-30),0) THEN 'above target'
        WHEN Heart_rate > ROUND(0.50 * (220-30),0) THEN 'within target'
        ELSE 'below target'
    END as 'HR_zone'
FROM Exercise_logs