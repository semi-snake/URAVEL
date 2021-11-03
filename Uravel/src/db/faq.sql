DROP SEQUENCE FATSEQ;
DROP TABLE FAQ;

CREATE SEQUENCE FAQSEQ NOCACHE;

CREATE TABLE "FAQ" (
   "FAQNO" NUMBER,
   "TITLE" VARCHAR2(100) NOT NULL,
   "CONTENT" VARCHAR2(4000) NOT NULL,
   PRIMARY KEY ("FAQNO")
);

INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'자주 하는 질문 제목','자주 하는 질문에 대한 답변을 길게 작성하면 이렇게 뜰것이다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'자주 하는 질문 제목','자주 하는 질문에 대한 답변을 길게 작성하면 이렇게 뜰것이다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'자주 하는 질문 제목','자주 하는 질문에 대한 답변을 길게 작성하면 이렇게 뜰것이다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'자주 하는 질문 제목','자주 하는 질문에 대한 답변을 길게 작성하면 이렇게 뜰것이다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'자주 하는 질문 제목','자주 하는 질문에 대한 답변을 길게 작성하면 이렇게 뜰것이다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'자주 하는 질문 제목','자주 하는 질문에 대한 답변을 길게 작성하면 이렇게 뜰것이다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'자주 하는 질문 제목','자주 하는 질문에 대한 답변을 길게 작성하면 이렇게 뜰것이다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'자주 하는 질문 제목','자주 하는 질문에 대한 답변을 길게 작성하면 이렇게 뜰것이다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'자주 하는 질문 제목','자주 하는 질문에 대한 답변을 길게 작성하면 이렇게 뜰것이다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'자주 하는 질문 제목','자주 하는 질문에 대한 답변을 길게 작성하면 이렇게 뜰것이다.');

SELECT * FROM FAQ;