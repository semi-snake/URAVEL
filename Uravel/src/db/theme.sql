CREATE TABLE "THEME" (
  "THEMECODE" NUMBER,
  "THEMENAME" VARCHAR2(20) UNIQUE NOT NULL,
  PRIMARY KEY ("THEMECODE")
);

 
DROP TABLE THEME;

INSERT INTO THEME (THEMECODE,THEMENAME) VALUES (1,'공원');
INSERT INTO THEME (THEMECODE,THEMENAME) VALUES (2,'등산');
INSERT INTO THEME (THEMECODE,THEMENAME) VALUES (3,'맛집');
INSERT INTO THEME (THEMECODE,THEMENAME) VALUES (4,'산책');
INSERT INTO THEME (THEMECODE,THEMENAME) VALUES (5,'야경');
INSERT INTO THEME (THEMECODE,THEMENAME) VALUES (6,'역사/문화');
INSERT INTO THEME (THEMECODE,THEMENAME) VALUES (7,'책방');
INSERT INTO THEME (THEMECODE,THEMENAME) VALUES (8,'카페');
INSERT INTO THEME (THEMECODE,THEMENAME) VALUES (9,'캠핑');
INSERT INTO THEME (THEMECODE,THEMENAME) VALUES (10,'호캉스');