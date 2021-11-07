DROP SEQUENCE FATSEQ;
DROP TABLE FAQ;

CREATE SEQUENCE FAQSEQ NOCACHE;

CREATE TABLE "FAQ" (
   "FAQNO" NUMBER,
   "TITLE" VARCHAR2(100) NOT NULL,
   "CONTENT" VARCHAR2(4000) NOT NULL,
   PRIMARY KEY ("FAQNO")
);

DELETE FROM FAQ;

INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'URAVEL은 무슨 사이트인가요?','URAVEL은 서울 여행에 관심있는 모든 관광객을 위해 서울 여행지 정보를 제공하는 사이트입니다. 역사, 문화와 관련된 관광명소/맛집/캠핑여행지 등 서울의 다양한 여행정보를 제공합니다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'외국인도 사이트 이용이 가능한가요?','URAVEL에서는 네이버의 파파고 번역API를 연동하여 영어, 일본어, 중국어로 번역된 내용을 제공합니다. 영어, 일본어, 중국어를 사용하신다면 편리하게 이용 가능합니다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'사이트에 있는 정보와  실제 정보가 달라요.','"고객센터" > "1:1 문의" 에 글을 남겨주시면 신속하게 수정 반영하도록 하겠습니다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'인기 여행지는 어떻게 정해지나요?','사용자의 좋아요 클릭 수가 가장 빈번했던 여행지를 순위별로 정렬하여 보여줍니다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'메인페이지의 통합검색은 어떤 서비스인가요?','통합검색은 내가 원하는 정보를 손쉽게 찾아볼 수 있도록 URAVEL에서 제공하는 기능입니다. 지역별 테마(산책, 야경, 맛집 등)별 검색결과를 확인할 수 있어 더욱 편리합니다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'서울시 관광안내소의 위치를 알려주세요.','서울 시내를 걷다보면 "관광안내소"를 발견하실 수 있습니다.
															인천공항, 김포공항, 강남, 명동, 서울글로벌문화체험센터, 인천공항 제2여객터미널, 용산역, 서울역, 서울로 7017안내소, 광화문, 남대문시장, DDP, 동대문, 삼일교, 시민청, 이태원 (역사 내), 이태원 (해밀턴 호텔 앞), 잠실, 홍대입구, 신촌역사 등 총 20군데의 관광정보센터가 운영중입니다.');
INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,'홍보 및 마케팅 제휴를 요청하고 싶습니다.','서울의 관광객을 대상으로 한 이벤트 제안은 무엇이든 환영합니다. 홈페이지 "고객센터" > "1:1 문의" 에 글을 남겨 주시면 검토하도록 하겠습니다.');


SELECT * FROM FAQ;