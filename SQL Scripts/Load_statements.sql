SET SEARCH_PATH TO Sports_Training;

COPY "Sports_Training"."Contact_Information" FROM 'D:/Project/Contact_Information1 - Sheet1.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Salary_Structure" FROM 'D:/Project/Salary_Structure - Salary_Structure.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Fee_Structure" FROM 'D:/Project/Fee structure.xlsx - Sheet1.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Trainer" FROM 'D:/Project/Trainer - Trainer.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Court" FROM 'D:/Project/Court.xlsx - Sheet1.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Training_Session" FROM 'D:/Project/Training_session.xlsx - Sheet1.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Player" FROM 'D:/Project/Player - Player.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Team" FROM 'D:/Project/Team.xlsx - Sheet1.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Head_Coach" FROM 'D:/Project/Head Coach.xlsx - Sheet1.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Admin" FROM 'D:/Project/Admin - Admin.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Grade_Card" FROM 'D:/Project/Grade_Card - Sheet1.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Grades" FROM 'D:/Project/Grades - Sheet1.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Matches" FROM 'D:/Project/Matches - Sheet1.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Schedule_Trainer" FROM 'D:/Project/Schedule_Trainer - Sheet1.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Team_Match" FROM 'D:/Project/Team_Match - Sheet1.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Schedule_Player" FROM 'D:/Project/Schedule_Player - Sheet1.csv'
DELIMITER ',' CSV HEADER;

COPY "Sports_Training"."Association" FROM 'D:/Project/Association - Sheet1.csv'
DELIMITER ',' CSV HEADER;
