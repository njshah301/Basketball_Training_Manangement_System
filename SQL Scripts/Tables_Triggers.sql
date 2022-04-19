DDL.txt
Last year
Nov 17, 2021

SANGHAVI KATHAN BHAVINKUMAR renamed an item
Text
DDL.txt
DDL (2).txt
Nov 17, 2021

SANGHAVI KATHAN BHAVINKUMAR uploaded an item
Text
DDL (2).txt
﻿CREATE TABLE IF NOT EXISTS "Sports_Training"."Contact_Information"
(
    "Mail_ID" character varying(40) ,
    "Address" character varying(200),
    "Mobile_Number1" character varying(20),
    "Mobile_Number2" character varying(20),
    "Designation" character varying(20) NOT NULL,
    PRIMARY KEY ("Mail_ID"),
    CHECK("Designation" = 'Player' or "Designation" = 'Trainer' or "Designation" = 'Court_Supervisor')
);


ALTER TABLE "Sports_Training"."Contact_Information"
    OWNER to postgres;




CREATE TABLE IF NOT EXISTS "Sports_Training"."Salary_Structure"
(
    "Salary_Structure_ID" character varying(20),
    "Salary_Per_Session_Type" json NOT NULL,
    PRIMARY KEY ("Salary_Structure_ID")
);


ALTER TABLE "Sports_Training"."Salary_Structure"
    OWNER to postgres;




CREATE TABLE IF NOT EXISTS "Sports_Training"."Fee_Structure"
(
    "Fee_Structure_ID" character varying(20),
    "Fee_Per_Session_Type" json NOT NULL,
    PRIMARY KEY ("Fee_Structure_ID")
);


ALTER TABLE "Sports_Training"."Fee_Structure"
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS "Sports_Training"."Trainer"
(
    "Trainer_ID" character varying(20),
    "Mail_ID" character varying(40) NOT NULL UNIQUE,
    "Salary_Structure_ID" character varying(20) NOT NULL,
    "Name" character varying(30) NOT NULL,
    "Password" character varying(20) NOT NULL,
    "Attendance" numeric(5, 2) NOT NULL,
    PRIMARY KEY ("Trainer_ID"),
    CONSTRAINT "FK1" FOREIGN KEY ("Mail_ID")
        REFERENCES "Sports_Training"."Contact_Information" ("Mail_ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
        NOT VALID,
    CONSTRAINT "FK2" FOREIGN KEY ("Salary_Structure_ID")
        REFERENCES "Sports_Training"."Salary_Structure" ("Salary_Structure_ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
        NOT VALID
);


ALTER TABLE "Sports_Training"."Trainer"
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS "Sports_Training"."Court"
(
    "Court_Number" integer,
    "Supervisor_Mail_ID" character varying(40) NOT NULL,
    PRIMARY KEY ("Court_Number"),
    CONSTRAINT "FK1" FOREIGN KEY ("Supervisor_Mail_ID")
        REFERENCES "Sports_Training"."Contact_Information" ("Mail_ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
        NOT VALID
);


ALTER TABLE "Sports_Training"."Court"
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS "Sports_Training"."Training_Session"
(
    "Session_ID" character varying(20),
    "Court_Number" integer NOT NULL,
    "Start_Time" time without time zone NOT NULL,
    "Session_Type" character varying(20) NOT NULL,
    "Date" date NOT NULL,
    PRIMARY KEY ("Session_ID"),
    CONSTRAINT "FK1" FOREIGN KEY ("Court_Number")
        REFERENCES "Sports_Training"."Court" ("Court_Number") MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
        NOT VALID
);


ALTER TABLE "Sports_Training"."Training_Session"
    OWNER to postgres;




CREATE TABLE IF NOT EXISTS "Sports_Training"."Player"
(
    "Player_ID" character varying(20),
    "Fee_Structure_ID" character varying(20) NOT NULL,
    "Mail_ID" character varying(40) NOT NULL UNIQUE,
    "Height" numeric(5, 2) NOT NULL,
    "Name" character varying(20) NOT NULL,
    "Position" character varying(20) NOT NULL,
    "Birth_Date" date NOT NULL,
    "Password" character varying(20) NOT NULL,
    "Attendance" numeric(5, 2) NOT NULL,
    "Player_Status" character varying(20) NOT NULL,
    "Age" integer,
    PRIMARY KEY ("Player_ID"),
    CONSTRAINT "Fk1" FOREIGN KEY ("Fee_Structure_ID")
        REFERENCES "Sports_Training"."Fee_Structure" ("Fee_Structure_ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
        NOT VALID,
    CONSTRAINT "FK2" FOREIGN KEY ("Mail_ID")
        REFERENCES "Sports_Training"."Contact_Information" ("Mail_ID") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
        NOT VALID,
   CHECK("Player_Status" = 'Active' or "Player_Status" = 'Inactive' or "Player_Status" = 'Injured')
);


ALTER TABLE "Sports_Training"."Player"
    OWNER to postgres;




CREATE TABLE IF NOT EXISTS "Sports_Training"."Team"
(
    "Team_ID" character varying(20),
    "Team_Name" character varying(20) NOT NULL,
    "Team_Matches" integer NOT NULL,
    "Team_Points" integer NOT NULL,
    PRIMARY KEY ("Team_ID")
);


ALTER TABLE "Sports_Training"."Team"
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS "Sports_Training"."Head_Coach"
(
    "Name" character varying(20) NOT NULL,
    "Mobile_Number1" character varying(20),
    "Mobile_Number2" character varying(20),
     "Joining_Date" date NOT NULL,
    "Leaving_Date" date
);


ALTER TABLE "Sports_Training"."Head_Coach"
    OWNER to postgres;










CREATE TABLE IF NOT EXISTS "Sports_Training"."Admin"
(
    "Name" character varying(20) NOT NULL,
    "Mobile_Number1" character varying(20),
    "Mobile_Number2" character varying(20),
    "Joining_Date" date NOT NULL,
    "Leaving_Date" date 
);


ALTER TABLE "Sports_Training"."Admin"
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS "Sports_Training"."Grade_Card"
(
    "Grade_Card_ID" character varying(20) NOT NULL,
    "Player_ID" character varying(20) NOT NULL,
    "Shooting" numeric(5, 2),
    "Defence" numeric(5, 2),
    "Rebounding" numeric(5, 2),
    "Passing" numeric(5, 2),
    "Match_Power" numeric(5, 2),
    "Fitness" numeric(5, 2),
    "Dribbling" numeric(5, 2),
    PRIMARY KEY ("Grade_Card_ID", "Player_ID"),
    CONSTRAINT "FK1" FOREIGN KEY ("Player_ID")
        REFERENCES "Sports_Training"."Player" ("Player_ID") MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE CASCADE
        NOT VALID
);


ALTER TABLE "Sports_Training"."Grade_Card"
    OWNER to postgres;




CREATE TABLE IF NOT EXISTS "Sports_Training"."Grades"
(
    "Player_ID" character varying(20) NOT NULL,
    "Training_ID" character varying(20) NOT NULL,
    CONSTRAINT "FK1" FOREIGN KEY ("Player_ID")
        REFERENCES "Sports_Training"."Player" ("Player_ID") MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT "FK2" FOREIGN KEY ("Training_ID")
        REFERENCES "Sports_Training"."Trainer" ("Trainer_ID") MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE CASCADE
        NOT VALID
);


ALTER TABLE "Sports_Training"."Grades"
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS "Sports_Training"."Matches"
(
    "Session_ID" character varying(20),
    "Winning_Team_Name" character varying(20) NOT NULL,
    PRIMARY KEY ("Session_ID"),
    CONSTRAINT "FK1" FOREIGN KEY ("Session_ID")
        REFERENCES "Sports_Training"."Training_Session" ("Session_ID") MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE CASCADE
        NOT VALID
);


ALTER TABLE "Sports_Training"."Matches"
    OWNER to postgres;




CREATE TABLE IF NOT EXISTS "Sports_Training"."Schedule_Trainer"
(
    "Trainer_ID" character varying(20) NOT NULL,
    "Session_ID" character varying(20) NOT NULL,
    PRIMARY KEY ("Trainer_ID", "Session_ID"),
    CONSTRAINT "FK1" FOREIGN KEY ("Trainer_ID")
        REFERENCES "Sports_Training"."Trainer" ("Trainer_ID") MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE CASCADE
        NOT VALID,
         CONSTRAINT "FK2" FOREIGN KEY ("Session_ID")
            REFERENCES "Sports_Training"."Training_Session" ("Session_ID")
            ON UPDATE RESTRICT
            ON DELETE CASCADE
            NOT VALID
);


ALTER TABLE "Sports_Training"."Schedule_Trainer"
    OWNER to postgres;












CREATE TABLE IF NOT EXISTS "Sports_Training"."Team_Match"
(
    "Session_ID" character varying(20) NOT NULL,
    "Team_ID" character varying(20) NOT NULL,
    CONSTRAINT "FK1" FOREIGN KEY ("Session_ID")
        REFERENCES "Sports_Training"."Matches" ("Session_ID") MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT "FK2" FOREIGN KEY ("Team_ID")
        REFERENCES "Sports_Training"."Team" ("Team_ID") MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE CASCADE
        NOT VALID
);


ALTER TABLE "Sports_Training"."Team_Match"
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS "Sports_Training"."Schedule_Player"
(
    "Player_ID" character varying(20) NOT NULL,
    "Session_ID" character varying(20) NOT NULL,
    PRIMARY KEY ("Player_ID", "Session_ID"),
    CONSTRAINT "FK1" FOREIGN KEY ("Player_ID")
        REFERENCES "Sports_Training"."Player" ("Player_ID") MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT "FK2" FOREIGN KEY ("Session_ID")
        REFERENCES "Sports_Training"."Training_Session" ("Session_ID")
        ON UPDATE RESTRICT
        ON DELETE CASCADE
        NOT VALID
);


ALTER TABLE "Sports_Training"."Schedule_Player"
    OWNER to postgres;




  CREATE TABLE IF NOT EXISTS "Sports_Training"."Association"
(
    "Player_ID" character varying(20) NOT NULL,
    "Team_ID" character varying(20) NOT NULL,
    "Joining_Year" integer NOT NULL,
    "Matches_Played" integer,
    "Status" character varying(20) NOT NULL,
    PRIMARY KEY ("Player_ID", "Team_ID"),
    CONSTRAINT "FK1" FOREIGN KEY ("Player_ID")
        REFERENCES "Sports_Training"."Player" ("Player_ID") MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT "FK2" FOREIGN KEY ("Team_ID")
        REFERENCES "Sports_Training"."Team" ("Team_ID") MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE CASCADE
        NOT VALID
);


ALTER TABLE "Sports_Training"."Association"
    OWNER to postgres;


CREATE OR REPLACE FUNCTION "Sports_Training".age_1()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    VOLATILE
    COST 100
AS $BODY$
Declare
Begin
NEW."Age" := (Current_Date - NEW."Birth_Date")/365;
return new; 
END
$BODY$;




CREATE TRIGGER age_1
    BEFORE INSERT OR UPDATE 
    ON "Sports_Training"."Player"
    FOR EACH ROW 
    EXECUTE FUNCTION "Sports_Training".age_1();