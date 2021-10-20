CREATE TABLE "INQUIRY" (
   "INQNO" NUMBER NOT NULL,
   "GROUPNO" NUMBER NOT NULL,
   "USERNO" NUMBER NOT NULL,
   "QUE_TYPE" VARCHAR2(500) NOT NULL,
   "TITLE" VARCHAR2(1000) NOT NULL,
   "CONTENT" VARCHAR2(2000) NOT NULL,
   "POSTDATE" DATE,
   PRIMARY KEY ("INQNO")
);

SELECT * FROM "INQUIRY";