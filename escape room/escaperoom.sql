CREATE DATABASE escape_room;

-- Escape Room Options -- 
CREATE TABLE esc_room (
    Room_ID INT PRIMARY KEY,
    Room_Name VARCHAR(50) NOT NULL,
    Description VARCHAR(255),
    Difficulty VARCHAR(10) NOT NULL,
    CHECK (Difficulty IN ('Easy' , 'Medium', 'Hard', 'Expert')),
    Theme VARCHAR(50),
    Max_Players INT,
    Duration INT
);

-- Cost Of Escape Room -- 
CREATE TABLE pricing (
    Room_ID INT PRIMARY KEY,
    Price_PP DECIMAL(5 , 2 ) NOT NULL,
    FOREIGN KEY (Room_ID)
        REFERENCES esc_room (Room_ID)
);

-- Players Personal Information -- 
CREATE TABLE players (
    Player_ID INT PRIMARY KEY,
    First_Name VARCHAR(25) NOT NULL,
    Last_Name VARCHAR(25) NOT NULL,
    Email_Address VARCHAR(75) NOT NULL,
    Phone_Number VARCHAR(15)
);

-- Game Session Details --
CREATE TABLE sessions (
    Session_ID INT PRIMARY KEY,
    Room_ID INT,
    Team_Name VARCHAR(25) NOT NULL,
    Start_Time DATETIME NOT NULL,
    End_Time DATETIME,
    Result VARCHAR(20) DEFAULT 'Pending',
    CHECK (RESULT IN ('Success' , 'Failed', 'Pending')),
    FOREIGN KEY (Room_ID)
        REFERENCES esc_room (Room_ID)
);

-- Tracks Players In Teams -- 
CREATE TABLE team_members (
    TeamMember_ID INT PRIMARY KEY,
    Session_ID INT,
    Player_ID INT,
    FOREIGN KEY (Session_ID)
        REFERENCES sessions (Session_ID),
    FOREIGN KEY (Player_ID)
        REFERENCES players (Player_ID)
);

-- Puzzles & Answers -- 
CREATE TABLE puzzles (
    Puzzle_ID INT PRIMARY KEY,
    Room_ID INT,
    PuzzleName VARCHAR(50) NOT NULL,
    Puzzle_Description VARCHAR(200),
    Puzzle_Difficulty VARCHAR(10) NOT NULL,
    CHECK (Puzzle_Difficulty IN ('Easy' , 'Medium', 'Hard', 'Very Hard')),
    Puzzle_Answer VARCHAR(200) NOT NULL,
    FOREIGN KEY (Room_ID)
        REFERENCES esc_room (Room_ID)
);

-- Puzzle Completion Time -- 
CREATE TABLE session_puzzles (
    SessionPuzzle_ID INT PRIMARY KEY,
    Session_ID INT,
    Puzzle_ID INT,
    Completion_Time INT,
    FOREIGN KEY (Session_ID)
        REFERENCES sessions (Session_ID),
    FOREIGN KEY (Puzzle_ID)
        REFERENCES puzzles (Puzzle_ID)
);



INSERT INTO esc_room
(Room_ID, Room_Name, Description, Difficulty, Theme, Max_Players, Duration)
VALUES
(1, 'The Detective Office','Solve a complex case in a private detective’s office.', 'MEDIUM', 'Mystery', 4,  60),
(2, 'The Bank Heist', 'Break into the vault and escape with the loot before the police arrive.', 'HARD' , 'Crime', 3, 60),
(3, 'The Prison Break', 'Stage a daring escape from a high-security prison.', 'EASY', 'Action', 2, 45),
(4, 'The Secret Laboratory', 'Escape from a secret laboratory by solving scientific puzzles and avoiding the dangerous experiments within.', 'EXPERT', 'Science Fiction', 5, 60);
 
 
 INSERT INTO pricing 
(Room_ID, Price_PP)
VALUES
(1, 20.00), -- Medium
(2, 25.00), -- Hard
(3, 15.00), -- Easy
(4, 25.00); -- Expert


 INSERT INTO players 
(Player_ID, First_Name, Last_Name, Email_Address, Phone_Number) 
VALUES
(1, 'Pete', 'Miller', 'pete.miller@hotmail.co.uk', '+44 7756 165803'),                       
(2, 'Samantha', 'Johnson', 'samantha.johnson@gmail.com', '+44 7745 132467'),    
(3, 'Robert', 'Smith', 'robert.smith@yahoo.com', '+44 7759 145678'),                
(4, 'Emily', 'Clark', 'emily.clark@outlook.com', '+44 7762 154890'),               
(5, 'Harrison', 'Bane', 'harrison.bane@gmail.com', '+44 7784 165932'),                 
(6, 'Bartholemew', 'Hew', 'bartholemew.hew@gmail.com', '+44 7723 145789'),    
(7, 'John', 'Davis', 'john.davis@yahoo.com', '+44 7732 154678'),                            
(8, 'Emily', 'Wilson', 'emily.wilson@outlook.com', '+44 7745 134569'),                      
(9, 'Michael', 'Anderson', 'michael.anderson@hotmail.co.uk', '+44 7754 126789'),    
(10, 'Olivia', 'Johnson', 'olivia.johnson@gmail.com', '+44 7761 145783'),                  
(11, 'David', 'Thomas', 'david.thomas@yahoo.com', '+44 7729 157483'),                      
(12, 'Sophia', 'Moore', 'sophia.moore@outlook.com', '+44 7736 149572'),                    
(13, 'Lowe', 'Cox', 'lowe.cox@hotmail.co.uk', '+44 7748 136582'),                            
(14, 'Isabella', 'Thompson', 'isabella.thompson@gmail.com', '+44 7753 145276'),    
(15, 'Anchovy','Belling', 'anchovy.belling@yahoo.com', '+44 7735 145679'),           
(16, 'Liam', 'Wilson', 'liam.wilson@gmail.com', '+44 7767 123456'),                            
(17, 'Ava', 'Thompson', 'ava.thompson@yahoo.com', '+44 7744 987654'),                     
(18, 'Noah', 'Harris', 'noah.harris@hotmail.co.uk', '+44 7799 246813'),                       
(19, 'Mia', 'Garcia', 'mia.garcia@gmail.com', '+44 7788 135792'),                              
(20, 'John', 'Martinez', 'john.martinez@outlook.com', '+44 7711 456789');     


INSERT INTO sessions 
(Session_ID, Room_ID, Team_Name, Start_Time, End_Time, Result) 
VALUES
(1, 1, 'The Sleuth Squad', '2024-05-01 10:00:00', '2024-05-01 10:49:00', 'Success'),
(2, 2, 'The Heist Crew', '2024-05-01 10:15:00', '2024-05-01 11:15:00', 'Failed'),
(3, 3, 'Jailbreak Junkies', '2024-05-01 14:00:00', '2024-05-01 14:43:00', 'Success'),
(4, 4, 'Labyrinth Legends', '2024-05-02 09:30:00', '2024-05-02 10:30:00', 'Failed'),
(5, 1, 'Mystery Mavericks', '2024-05-02 11:00:00', '2024-05-02 11:56:00', 'Success'),
(6, 2, 'Vault Vixens', '2024-05-02 11:30:00', '2024-05-02 12:30:00', 'Failed'),
(7, 3, 'Escape Enthusiasts', '2024-05-03 10:00:00', '2024-05-03 10:41:00', 'Success'),
(8, 4, 'Puzzle Pioneers', '2024-05-03 11:00:00', '2024-05-03 11:53:00', 'Success'),
(9, 1, 'Detective Dynamos', '2024-05-04 13:00:00', '2024-05-04 14:00:00', 'Failed'),
(10, 4, 'Mastermind Medics', '2024-05-04 14:30:00', '2024-05-04 15:18:00', 'Success');


INSERT INTO team_members
(TeamMember_ID, Session_ID, Player_ID) 
VALUES
(1, 1, 1), (2, 1, 2), (3, 1, 3), (4, 1, 4),
(5, 2, 5), (6, 2, 6), (7, 2, 7),
(8, 3, 8), (9, 3, 9),
(10, 4, 10), (11, 4, 11), (12, 4, 12),(13, 4, 13),
(14, 5, 14), (15, 5, 15), (16, 5, 1), (17, 5, 2),
(18, 6, 3), (19, 6, 4), (20, 6, 9),
(21, 7, 10), (22, 7, 11),
(23, 8, 7), (24, 8, 8), (25, 8, 15), (26, 8, 16), (27, 8, 17),
(28, 9, 8), (29, 9, 9), (30, 9, 17), (31, 9, 18),
(32, 10, 1), (33, 10, 3), (34, 10, 9), (35, 10, 19), (36, 10, 20);


INSERT INTO puzzles 
(Puzzle_ID, Room_ID, PuzzleName, Puzzle_Description, Puzzle_Difficulty, Puzzle_Answer) 
VALUES
-- Detective Office Puzzles —-
(1, 1, 'Murder Mystery', 'Investigate clues to solve the murder case of a prominent businessman.', 'MEDIUM','WHOISIT'),
(2, 1, 'Hidden Safe', 'Find the hidden safe behind the painting and crack the combination.', 'EASY', 'BLOODART123'),
(3, 1, 'Forgery Challenge', 'Analyse documents and find the forged signature to expose a fraud.', 'MEDIUM', 'SIGNATURE'),
(4, 1, 'Cipher Puzzle', 'Decode a message encrypted with a substitution cipher to uncover hidden information.', 'HARD', 'SUBSTITUTION'),

-- Bank Heist Puzzles —-
(5, 2, 'Security Camera Hack', 'Hack into the security camera system to disable surveillance temporarily.', 'HARD','CAMERA123'),
(6, 2, 'Vault Puzzle', 'Solve a series of mechanical puzzles to unlock the vault door.', 'HARD', 'MECHANISM'),
(7, 2, 'Alarm System Override', 'Override the alarm system by entering the correct override code.', 'HARD', 'OVERRIDE123'),
(8, 2, 'Money Bag Allocation', 'Determine the correct allocation of money bags according to given clues.', 'MEDIUM', 'ALLOCATE'),

-- Prison Break Puzzles —-
(9, 3, 'Cell Block Puzzle', 'Find a way to unlock the cell doors by solving a series of interconnected puzzles.', 'MEDIUM', 'FREEDOMNOW'),
(10, 3, 'Guard Key Theft', 'Steal the guard’s key to access restricted areas and find an escape route.', 'MEDIUM', 'KEYSTEAL'),
(11, 3, 'Tunnel Digging', 'Use clues to determine the correct tunnel route and tools to dig an escape tunnel.', 'EASY', 'ESCAPETUNNEL'),
(12, 3, 'Inmate Collaboration', 'Coordinate with other inmates to gather items and overcome prison obstacles.', 'EASY', 'TEAMWORK123'),

-- Secret Laboratory Puzzles —-
(13, 4, 'Biohazard Containment', 'Contain a dangerous virus outbreak by solving puzzles to seal the lab.', 'VERY HARD', 'VIRUSCONTAIN'),
(14, 4, 'Chemical Formulation', 'Mix chemicals to create an antidote to save a researcher from poisoning.', 'HARD', 'ANTIDOTE123'),
(15, 4, 'Robotics Calibration', 'Calibrate a malfunctioning robot to assist in accessing a secured area.', 'HARD', 'ROBOTCALIB'),
(16, 4, 'Genetic Sequencing', 'Sequence DNA samples to unlock access to restricted genetic research data.', 'VERY HARD', 'DNASEQUENCE');



INSERT INTO session_puzzles
(SessionPuzzle_ID, Session_ID, Puzzle_ID, Completion_Time)
VALUES
-- Session 1 Puzzles (Total: 49 minutes)
(1, 1, 1, 18),  
(2, 1, 2, 4),  
(3, 1, 3, 17),  
(4, 1, 4, 10),  
-- Session 2 Puzzles (Total: 60 minutes)
(5, 2, 5, 15),  
(6, 2, 6, 20),  
(7, 2, 7, 15),   
(8, 2, 8, 10),   
-- Session 3 Puzzles (Total: 43 minutes)
(9, 3, 9, 13),
(10, 3, 10, 13),
(11, 3, 11, 9),
(12, 3, 12, 8), 
-- Session 4 Puzzles (Total: 60 minutes)
(13, 4, 13, 25),
(14, 4, 14, 20), 
(15, 4, 15, 10), 
(16, 4, 16, 5),  
-- Session 5 Puzzles (Total: 56 minutes)
(17, 5, 1, 16), 
(18, 5, 2, 8), 
(19, 5, 3, 15),  
(20, 5, 4, 17),  
-- Session 6 Puzzles (Total: 60 minutes)
(21, 6, 5, 18),  
(22, 6, 6, 20),  
(23, 6, 7, 16),  
(24, 6, 8, 6),
-- Session 7 Puzzles (Total: 41 minutes)
(25, 7, 9, 15),  
(26, 7, 10, 12), 
(27, 7, 11, 10), 
(28, 7, 12, 4),  
-- Session 8 Puzzles (Total: 53 minutes)
(29, 8, 13, 17), 
(30, 8, 14, 14), 
(31, 8, 15, 10), 
(32, 8, 16, 12), 
-- Session 9 Puzzles (Total: 60 minutes)
(33, 9, 1, 18),  
(34, 9, 2, 10),  
(35, 9, 3, 20),  
(36, 9, 4, 12),  
-- Session 10 Puzzles (Total: 48 minutes)
(37, 10, 13, 16), 
(38, 10, 14, 8),
(39, 10, 15, 10), 
(40, 10, 16, 14); 

SELECT * FROM esc_room;
SELECT * FROM pricing;
SELECT * FROM players;
SELECT * FROM sessions;
SELECT * FROM team_members;
SELECT * FROM puzzles;
SELECT * FROM session_puzzles;
