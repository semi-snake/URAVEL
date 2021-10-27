DROP TABLE HISTORY;
CREATE TABLE HISTORY (
  "HISTORYNO" NUMBER NOT NULL,
  "TRAVELNO" NUMBER REFERENCES TRAVEL(TRAVELNO),
  "TRAVELNAME" VARCHAR2(500) NOT NULL,
  "DESCRIPTION" VARCHAR2(4000) NOT NULL,
  "URL_PIC1" VARCHAR2(500) NOT NULL,
  "URL_PIC2" VARCHAR2(500),
  "SOURCE" VARCHAR2(1000),
  PRIMARY KEY ("HISTORYNO")
);
CREATE SEQUENCE HISTORYSEQ START WITH 20 NOCACHE;

SELECT * FROM HISTORY;

INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (1,6,'선정릉(선릉과 정릉)','  선릉은 9대 성종과 부인 정현왕후의 무덤이다.
  성종은 유교사상을 정착하여 왕도정치를 실현하고자 사림을 성장시켜 훈구세력을 견제하고, 정치기반을 조성함으로써 조선 초기의 전반적인 체제를 안정시켰다.
  선릉은 왕릉과 비릉이 각각 다른 산등성이에 있는 동원이강의 형식으로 비릉에는 병풍석을 세우지 않았고, 다른 석물들은 왕릉과 같으며 『국조오례의』를 따르고 있다. 왕릉에는 12면의 병풍석을 세우고 그안에 동물의 머리에 사람의 모습을 한 십이지신상을 새겼다. 난간석은 12칸이며 그 밖에 양석·호석·망주석·문석인 등의 석물이 있다. 
  정릉은 11대 중종의 무덤이다.
  중종은 연산군의 잘못된 정치를 바로 잡기위해 노력하였으나, 개혁파와 공신파의 정치적 논쟁이 끊이지 않아 조정이 안정되지 못하였다.
  정릉은 원래 중종의 두번째 왕비(제1계비) 장경왕후의 무덤인 희릉의 오른쪽 언덕에 있었으나 세번째 왕비(제2계비)인 문정왕후 윤씨가 풍수지리상 불길하다고 하여 현재의 자리로 옮겼다. 무덤 주변의 석물은 선릉의 석물제도를 본떴다. 조선왕릉 중 왕만 단독으로 있는 무덤은 후대에 왕릉이 된 단종의 장릉을 제외하고 태조의 건원릉과 중종의 정릉뿐이다.
  임진왜란 때는 선·정릉의 양릉이 훼손되는 변을 겪게 된다. 재실(齋室)은 양릉의 사이에 있으며, 여름철의 침수를 피하기 위해 층단에 지었는데 이러한 예는 선릉·정릉 뿐이다.',
  'http://www.heritage.go.kr/unisearch/images/history_site/2021071211001301.jpg',
  'http://www.heritage.go.kr/unisearch/images/history_site/2021071211001302.jpg',
  'https://www.heritage.go.kr/heri/cul/culSelectDetail.do?culPageNo=1&region=2&searchCondition=%ec%84%a0%eb%a6%89&searchCondition2=&s_kdcd=00&s_ctcd=00&ccbaKdcd=13&ccbaAsno=01990000&ccbaCtcd=11&ccbaCpno=1331101990000&ccbaCndt=&ccbaLcto=&stCcbaAsno=&endCcbaAsno=&stCcbaAsdt=&endCcbaAsdt=&ccbaPcd1=99&chGubun=&header=view&returnUrl=%2fheri%2fcul%2fculSelectViewList.do&pageNo=1_1_1_1');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (2,14,'소악루','  소악루는 양천향교 뒷산인 궁산 기슭에 있는 정자이다. 예부터 소악루에서 바라보는 한강 변의 뛰어난 절경으로 문인들의 풍류의 장이었으며 겸재 정선이 그린 진경산수화를 토대로 한강을 조망할 수 있게 복원했다.
  1737년(영조 13) 동복현감을 지낸 이유(李楡, 1675~1757)가 경관과 풍류를 즐기기 위해 자신의 집 부근 옛 악양루 터에 지었다. ‘소악루’란 중국 동정호의 웨양루〔岳陽樓〕경치와 버금가는 곳이라 하여 붙인 이름이다.
  당초 가양동 세숫대바위 근처에 세운 원 건물은 화재로 소실되었다. 1994년 5월 구청에서 한강 변 경관 조성과 조망을 고려하여 현 위치에 신축했다. 건물은 정면 3칸 측면 2칸의 규모로서 화강석 8각 주춧돌에 민흘림 원기둥을 세운 5량집 겹처마 구조이다. 지붕은 단층 팔작지붕이며 주위에는 조망하기 좋게 난간을 둘러놓았다.',
  'https://mediahub.seoul.go.kr/wp-content/uploads/editor/images/000273/6_1.jpg',
  'https://mediahub.seoul.go.kr/wp-content/uploads/editor/images/000273/1_3.jpg',
  'https://www.gangseo.seoul.kr/site/munhwa/c2/sightsee_popup6.jsp');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (3,30,'태강릉(태릉과 강릉)','  태릉은 조선 제11대 중종(재위 1506∼1544)의 세번째 왕비인 문정왕후 윤씨(1501∼1565)의 무덤이다.
  본관은 파평으로 중종의 두번째 왕비인 장경왕후가 1515년 죽자 1517년에 17세의 나이로 왕비가 되었다. 중종이 있는 정릉에 묻히려 하였으나 장마철 침수로 인하여 이곳에 묻히게 되었다. 무덤은 십이지신과 구름무늬가 새겨진 12면으로 된 병풍석이 둘러져 있다. 무덤 앞에는 상석·망주석 등이 『국조오례의』에 따라 제작되었다.
  무덤 아래에는 한국 전쟁시 훼손되었다가 1995년 다시 지은 정자각이 있다. 사람모양의 돌조각상(석인)은 4등신으로 입체감이 표현되지 않았는데, 당시 석인의 특징을 보여준다.
  강릉은 조선 제13대 명종(재위 1545∼1567)과 그의 부인인 인순왕후 심씨(1532∼1575)의 무덤이다.  태릉과 같은 병풍석이 둘러져 있다.',
  'http://www.heritage.go.kr/unisearch/images/history_site/2021071308524003.jpg',
  'http://www.heritage.go.kr/unisearch/images/history_site/2021071308524500.jpg',
  'https://www.heritage.go.kr/heri/cul/culSelectDetail.do?culPageNo=1&region=2&searchCondition=%ed%83%9c%eb%a6%89&searchCondition2=&s_kdcd=00&s_ctcd=00&ccbaKdcd=13&ccbaAsno=02010000&ccbaCtcd=11&ccbaCpno=1331102010000&ccbaCndt=&ccbaLcto=&stCcbaAsno=&endCcbaAsno=&stCcbaAsdt=&endCcbaAsdt=&ccbaPcd1=99&chGubun=&header=view&returnUrl=%2fheri%2fcul%2fculSelectViewList.do&pageNo=1_1_1_1');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (4,35,'서울약령시 한의약박물관','우리나라 최대 한약 유통시장인 약령시에 있는 한의약 박물관은 한의약의 계승과 발전을 위해 다양한 자료를 수집 및 관리, 보존하고 있다. 또한, 한의약의 역사를 비롯해 여러 한약재의 실물 전시를 마련해 한의약에 대한 정보 제공 및 이해를 돕고 있다.  ',
'https://cdn.sisanews.kr/news/photo/202007/51380_37058_016.jpg',
'https://www.ktsketch.co.kr/news/photo/201905/3799_12712_3354.jpg',
'https://museum.ddm.go.kr/');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (5,41,'문화비축기지','  마포구 서울월드컵경기장 인근 매봉산에 에워싸인 ‘문화비축기지’는 일반인의 접근과 이용이 철저히 통제됐던 산업화시대 유산인 마포 석유비축기지가 도시재생을 통해 시민 품으로 돌아오게 된 문화공원이다.
  1973년 석유파동 이후 76~78년에 5개 탱크를 건설해 당시 서울시민이 한 달 정도 소비할 수 있는 양인 6,907만 리터의 석유를 보관했던 마포석유비축기지는 2002년 월드컵을 앞두고 안전상의 이유로 폐쇄됐는데, 10년 넘게 활용방안을 찾지 못하다가 지난 2013년 시민아이디어공모를 통해 문화비축기지로의 변신을 결정했다.
  당시 석유를 보관하던 탱크들은 석유 대신 매일 색다른 문화를 창출하는 문화탱크로 역할이 바뀌었다. 기존 5개의 탱크는 열린 문화 공간으로 탈바꿈하였고, 해체된 탱크의 철판을 활용해 만들어진 T6는 시민들의 커뮤니티 공간이 되었다. 비어있던 야외 공간은 아이들이 뛰어놀 수 있는 문화 마당으로 만들었다. 부지에 남아있던 수림은 최대한 보존하고 다양한 종류의 꽃과 나무를 심어 공원으로 조성했다. 매봉산으로 이어지는 산책로에서는 종종 산토끼와 청설모도 만날 수 있다.',
  'https://flexible.img.hani.co.kr/flexible/normal/715/536/imgdb/original/2020/0212/20200212503109.jpg',
  'https://img6.yna.co.kr/etc/inner/KR/2017/08/24/AKR20170824062000004_01_i_P4.jpg',
  'https://parks.seoul.go.kr/template/sub/culturetank.do');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (6,46,'한국영상자료원','  한국영상자료원은 국내외 영화 필름과 함께 다양한 비필름 자료들(비디오물, 오디오물, 포스터, 스틸, 시나리오, 도서, 정기간행물, 의상, 소품, 영화인 애장품)를 포함하여 모든 영상자료를 수집하고 있다. 영화 필름은 극영화와 함께 뉴스릴, 기록물 등의 비극영화까지, 다양한 규격의 필름부터 최근 디지털 파일까지 모두 수집 대상이 된다. 한국영상자료원은 국내 뿐 아니라 해외에 산재되어있는 영상자료들 역시 적극적으로 발굴, 수집하고 있으며, 최근에는 이규환 감독의 <해연>(1948)을 일본 고베영화자료관에서 복사 수집한 바 있다.',
'http://cdn.econovill.com/news/photo/201809/346849_221454_448.jpg',
'http://cdn.econovill.com/news/photo/201809/346849_221456_449.jpg',
'https://www.koreafilm.or.kr/main#none');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (7,48,'(구)서대문형무소','  일본이 우리나라에 대한 침략을 본격화하기 위해 1907년 인왕산 기슭에 일본인이 설계하여 건립한 근대적인 감옥이다.
  약 500여 명을 수용할 수 있는 560여 평의 목조건물을 짓고 ‘경성감옥’이라 불렀다. 종로의 감옥에서 500여 명을 데려와 수용하고 광복을 맞이하는 1945년까지 독립운동가들을 가두고 고문과 박해를 하고 심지어 목숨을 빼앗은 곳이다. 애국인사들이 늘어나자 1912년 일제는 마포구 공덕동에 감옥을 또 지어 경성감옥이라 하고, 원래의 경성감옥은 서대문감옥이라 불렀다. 1923년 서대문감옥은 서대문형무소로 바뀌었고 1944년에는 2,890명이 수용되었다. 18세 미만의 소녀들과 10년 이상을 선고받은 자, 그리고 무기수까지 수용하였으며, 김구선생·강우규·유관순 열사 등이 이곳에 수감되었었다.  유관순 열사는 이 곳에서 목숨을 다하였다.
  1946년 광복 직후에는 경성형무소·서울형무소로 바뀌고, 반민족행위자와 친일세력들이 수용되었다. 1961년에는 서울교도소로, 1967년에는 서울구치소로 바뀌었고, 4·19혁명과  5·16군사쿠데타와 같은 정치적 변동으로 인해 많은 시국사범들이 수감되었다. 1988년에 사적지로 지정되었다. 
  일제강점기에는 민족독립의 역사를 지니며 그후로는 민주화와 정치적 변화의 모습을 간직한 곳으로서 후손들에게 민족의 자존과 자주정신을 일깨워주는 산 교육장으로 매우 뜻깊은 곳이다.',
  'http://www.heritage.go.kr/unisearch/images/history_site/202104151023470a.JPG',
  'http://www.heritage.go.kr/unisearch/images/history_site/2021041510234705.JPG',
  'https://www.heritage.go.kr/heri/cul/culSelectDetail.do?culPageNo=1&region=2&searchCondition=%ec%84%9c%eb%8c%80%eb%ac%b8%ed%98%95%eb%ac%b4%ec%86%8c&searchCondition2=&s_kdcd=00&s_ctcd=11&ccbaKdcd=13&ccbaAsno=03240000&ccbaCtcd=11&ccbaCpno=1331103240000&ccbaCndt=&ccbaLcto=00&stCcbaAsno=&endCcbaAsno=&stCcbaAsdt=&endCcbaAsdt=&ccbaPcd1=99&chGubun=&header=view&returnUrl=%2fheri%2fcul%2fculSelectViewList.do&pageNo=1_1_1_1');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (8,54,'헌인릉(헌릉과 인릉)','  헌릉은 조선 3대 태종(재위 1400∼1418)과 원경왕후 민씨(1365∼1420)의 무덤이다.
  태조 이성계의 다섯번째 아들로서 아버지를 도와 조선왕조를 세웠다. 1·2차 왕자의 난을 진압하고 정종 2년(1400)에 왕위를 물려받았다. 토지와 조세제도를 정비하고 군사제도도 개혁하였으며, 유교를 숭상하고 불교를 억압하는 등 국정전반에 대한 개혁을 단행하여, 조선 초기의 민생안정을 이룩하였다. 태종의 부인인 원경왕후 민씨는 여흥부원군 민제의 딸이며, 태종이 왕위에 오르기까지 큰 힘이 되었다.
  헌릉은 쌍릉으로 무덤 아랫부분이 병풍석으로 둘러있으며, 무덤의 형식은 태조의 건원릉을 따랐다. 각 무덤에 12칸의 난간석을 둘러서 서로 연결하였고 무덤 앞에는 양석과 호석·문석인·마석을 배치하였다. 무덤 앞의 석물은 고려시대의 현릉·정릉, 조선시대의 후릉과 같이 망주석을 제외하고는 각각 하나씩을 더 갖추었다. 언덕 아래에는 정자각이 있고 비각을 세웠다. 
  인릉은 23대 순조(재위 1800∼1834)와 순원왕후 김씨(1789∼1857)의 무덤이다. 순조는 11세에 왕위에 올랐으나 나이가 어려서 대왕대비인 정순왕후 김씨에게 정치를 돌보게 됨으로써 외척에 의한 정치가 극에 달하였고, 사회가 혼란했다.
  인릉은 무덤에 병풍석을 세우지 않았고, 12칸의 난간석을 둘렀으며 양석과 마석·상석·망주석을 세웠다. 언덕 아래에는 2개의 비석을 세웠다.',
  'http://www.heritage.go.kr/unisearch/images/history_site/2021070714551501.jpg',
  'http://www.heritage.go.kr/unisearch/images/history_site/2021070816265101.jpg',
  'https://www.heritage.go.kr/heri/cul/culSelectDetail.do?culPageNo=1&region=2&searchCondition=%ed%97%8c%eb%a6%89&searchCondition2=&s_kdcd=00&s_ctcd=00&ccbaKdcd=13&ccbaAsno=01940000&ccbaCtcd=11&ccbaCpno=1331101940000&ccbaCndt=&ccbaLcto=&stCcbaAsno=&endCcbaAsno=&stCcbaAsdt=&endCcbaAsdt=&ccbaPcd1=99&chGubun=&header=view&returnUrl=%2fheri%2fcul%2fculSelectViewList.do&pageNo=1_1_1_1');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (9,58,'길상사','  길상사는 1997년 12월에 창건해 20년 남짓 된 사찰이다. 역사는 짧지만 길상사를 찾는 이들에게 전해지는 이야기가 많다.
  길상사는 원래 대원각이라는 요정이었다. 고급 요릿집이 절집으로 탈바꿈한 데는 법정 스님과 김영한의 이야기가 있다. 법정 스님은 1932년 전남 해남에서 태어나 1956년 효봉 스님의 제자로 출가했으며, 2010년 길상사에서 입적했다.',
  'https://cdn.ilyoseoul.co.kr/news/photo/202108/456307_375351_4051.jpg',
  'https://cdn.ilyoseoul.co.kr/news/photo/202108/456307_375349_3935.jpg',
  'https://korean.visitkorea.or.kr/detail/rem_detail.do?cotid=49dbf1fe-788b-4ed6-8e04-dcf09d35da5d');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (10,59,'정릉','  조선 1대 태조의 두 번째 왕비 신덕황후 강씨(?~1396)의 능이다.
  신덕황후는 강윤성의 딸로 고려의 풍습에 따라 태조의 경처(서울에서 결혼한 부인)가 되었다가, 1392년 조선 건국 후 최초의 왕비(현비)로 책봉되었다. 둘째아들 방석을 왕세자로 책봉시켜 정치적 기반을 닦았으나 이 일로 왕자의 난이 일어나 정치적으로 혼란하였다. 태조는 신덕황후가 세상을 떠나자 현 서울 중구 정동에 조성하였으나, 태종이 왕위에 오른 후 1409년(태종 9) 도성 안에 능이 있다는 이유로 도성 밖 현재의 자리에 옮겼고, 남아있던 목재와 석물을 태평관太平館과 청계천 광통교 복구에 사용하였으며, 태조의 왕비로 인정하지 않았다. 1669년(현종 10) 송시열 등의 상소로 신주를 종묘에 모시고, 정릉을 현재의 모습으로 다시 조성하였다.
  능침은 추존된 왕비의 능제에 맞게 조성되어 병풍석과 난간석, 무석인을 생략하고 문석인과 석양, 석호 등을 배치하였다. 장명등과 혼유석을 받치는 고석만 옛 정릉에서 옮겨온 석물이고 나머지 석물들은 현종대에 다시 조성하였다. 이후 1899년(광무 3) 신덕고황후로 추존되었다.',
  'http://www.heritage.go.kr/unisearch/images/history_site/2020081411085900.jpg',
  'http://www.heritage.go.kr/unisearch/images/history_site/2021070715063000.jpg',
  'https://www.heritage.go.kr/heri/cul/culSelectDetail.do?culPageNo=1&region=2&searchCondition=%ec%a0%95%eb%a6%89&searchCondition2=&s_kdcd=00&s_ctcd=00&ccbaKdcd=13&ccbaAsno=02080000&ccbaCtcd=11&ccbaCpno=1331102080000&ccbaCndt=&ccbaLcto=&stCcbaAsno=&endCcbaAsno=&stCcbaAsdt=&endCcbaAsdt=&ccbaPcd1=99&chGubun=&header=view&returnUrl=%2fheri%2fcul%2fculSelectViewList.do&pageNo=1_1_1_1');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (11,61,'백제고분군','  서울 방이동 일대에 있는 백제전기(4C초∼475)의 무덤들이다.
  제1호 무덤은 봉토의 지름이 12m, 높이 2.2m로 널길(연도)과 널방(현실)을 가진 굴식돌방무덤(횡혈식석실분)이다. 도굴로 인해 남아 있는 유물이 없었으나, 주민에 의해 3접의 토기가 수습되었다. 4호 무덤은 아치형천장(궁륭식천장)을 한 굴식돌방무덤으로, 자연적으로 유약이 입혀진 회청색경질 굽다리접시(고배)와 굽다리접시뚜껑을 비롯한 토기류와 철제류가 출토되었다.
  6호 무덤에서 나온 회청색경질 굽다리접시의 경우 굽구멍(투창)이 전형적인 신라토기에서 볼 수 있는 형식이다. 이는 6세기 이후 한강유역이 신라영토로 되었을 때 만들어진 신라무덤일 가능성도 있다.
  방이동 고분군은 백제의 수도가 한성에 있을 때 만들어진 전기 무덤으로 가락동·석촌동무덤과 함께 한성백제의 문화를 알 수 있는 유적이다.',
  'http://www.heritage.go.kr/unisearch/images/history_site/1624838.jpg',
  'http://www.heritage.go.kr/unisearch/images/history_site/1624840.jpg',
  'https://www.heritage.go.kr/heri/cul/culSelectDetail.do?culPageNo=1&region=2&searchCondition=%eb%b0%b1%ec%a0%9c%ea%b3%a0%eb%b6%84&searchCondition2=&s_kdcd=00&s_ctcd=11&ccbaKdcd=13&ccbaAsno=02700000&ccbaCtcd=11&ccbaCpno=1331102700000&ccbaCndt=&ccbaLcto=00&stCcbaAsno=&endCcbaAsno=&stCcbaAsdt=&endCcbaAsdt=&ccbaPcd1=99&chGubun=&header=view&returnUrl=%2fheri%2fcul%2fculSelectViewList.do&pageNo=1_1_1_1');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (12,76,'국립중앙박물관','시대와 주제별로 제시된 6개의 상설전시관, 다양한 내용을 선보이는 특별전시관, 관람의 이해를 돕는 전시해설 프로그램, 오감으로 즐기고 배우는 어린이박물관, 다채로운 교육 프로그램, 첨단기술을 활용한 실감콘텐츠 등을 마음껏 누리고 즐길 수 있다.',
'http://www.heritage.go.kr/unisearch/images/national_treasure/2021092813404100.jpg',
'http://sbook.allabout.co.kr/magazine/sm-content/upload/museum/magazine/36/459/24-790-84kaid94zc.png',
'https://www.museum.go.kr/site/main/home');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (13,87,'경복궁','  경복궁은 조선 왕조 제일의 법궁이다. 북으로 북악산을 기대어 자리 잡았고 정문인 광화문 앞으로는 넓은 육조거리(지금의 세종로)가 펼쳐져, 왕도인 한양(서울) 도시 계획의 중심이기도 하다. 1395년 태조 이성계가 창건하였고, 1592년 임진 왜란으로 불타 없어졌다가, 고종 때인 1867년 중건 되었다. 흥선대원군이 주도한 중건 경복궁은 500여 동의 건물들이 미로같이 빼곡히 들어선 웅장한 모습 이었다.
  궁궐 안에는 왕과 관리들의 정무 시설, 왕족들의 생활 공간, 휴식을 위한 후원 공간이 조성되었다. 또한 왕비의 중궁, 세자의 동궁, 고종이 만든 건청궁 등 궁궐안에 다시 여러 작은 궁들이 복잡하게 모인 곳이기도 하다. 그러나 일제 강점기에 거의 대부분의 건물들을 철거하여 근정전 등 극히 일부 중심 건물만 남았고, 조선 총독부 청사를 지어 궁궐 자체를 가려버렸다. 
  다행히 1990년부터 본격적인 복원 사업이 추진되어 총독부 건물을 철거하고 흥례문 일원을 복원하였으며, 왕과 왕비의 침전, 동궁, 건청궁, 태원전 일원의 모습을 되찾고 있다.광화문 - 흥례문 - 근정문 - 근정전 - 사정전 - 강녕전 - 교태전을 잇는 중심 부분은 궁궐의 핵심 공간이며, 기하학적 질서에 따라 대칭적으로 건축 되었다. 
  그러나 중심부를 제외한 건축물들은 비대칭적으로 배치되어 변화와 통일의 아름다움을 함께 갖추었다. 수도 서울의 중심이고 조선의 으뜸 궁궐인 경복궁에서 격조 높고 품위 있는 왕실 문화의 진수를 느껴보자.
  경복궁의 명칭 : 경복궁은 조선 왕조가 세워지고 3년 지난 후 완공되었다. 완공된 지 며칠 후에 개국공신 정도전은 태조의명에 따라 경복궁이라는 궁궐 이름을 비롯해 강녕전, 교태전, 연생전, 경성전, 사정전, 근정전 등 주요 전각의 이름을 지었다. 경복궁이라는 이름에는 ‘새 왕조가 큰 복을 누려 번영할 것’이라는 의미가 담겨 있다.',
  'http://www.heritage.go.kr/unisearch/images/national_treasure/2021062917265903.jpg',
  'http://www.heritage.go.kr/unisearch/images/national_treasure/1611714.jpg',
  'https://www.heritage.go.kr/heri/html/HtmlPage.do?pg=/palaces/palacesRoyalInfo.jsp&pageNo=2_1_1_0');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (14,101,'종묘','  종묘는 조선왕조 역대 왕과 왕비 및 추존된 왕과 왕비의 신주를 모신 유교사당으로서 가장 정제되고 장엄한 건축물 중의 하나이다.
  야트막한 산과 숲에 둘러싸여 있으며, 역대 왕과 왕비의 신주를 모신 정전과 영녕전, 제례 준비에 필요한 몇몇 부속 전각으로 이루어졌다. 전각은 최소한의 색만 사용하고 화려한 단청을 하지 않았으며 장식과 기교를 최대한 절제하였다. 이는 종묘가 조상신의 영혼을 모신 엄숙하고 경건한 공간이기 때문이다.
  태조 3년(1394) 10월 조선 왕조가 한양으로 도읍을 옮긴 그해 12월에 착공하여 이듬해 9월에 완공 하였으며, 곧이어 개성으로부터 태조의 4대조인 목조, 익조, 도조, 환조의 신주를 모셨다. 현재 정전에는 19실에 49위, 영녕전에는 16실에 34위의 신위가 모셔져 있고, 정전 뜰앞에 있는 공신당에는 조선시대 공신 83위가 모셔져 있다.',
  'http://www.heritage.go.kr/unisearch/images/national_treasure/2021063016361203.jpg',
  'http://www.heritage.go.kr/unisearch/images/treasure/2021070117175901.jpg',
  'https://www.heritage.go.kr/heri/html/HtmlPage.do?pg=/palaces/palacesJmInfo.jsp&pageNo=2_5_1_0');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (15,102,'창경궁','  창경궁은 경복궁, 창덕궁에 이어 세 번째로 지어진 조선시대 궁궐이다. 조선 왕조는 건국 초기부터 경복궁을 법궁으로, 창덕궁을 보조 궁궐로 사용하는 양궐 체제를 이어왔다. 그러나 역대 왕들은 경복궁보다는 창덕궁에 거처하는 것을 더 좋아하였고, 왕실 가족이 늘어나면서 차츰 창덕궁의 생활 공간도 비좁아졌다. 이에 성종이 왕실의 웃어른인 세조 비 정희왕후, 예종 비 안순왕후, 덕종 비 소혜왕후 등 세 분의 대비가 편히 지낼 수 있도록 창덕궁 이웃에 마련한 궁궐이 창경궁이다.
  창경궁은 왕이 정사를 돌보기 위해 지은 것이 아니라 생활 공간을 넓힐 목적으로 세워졌고, 또한 애초 궁궐로서 계획된 것이 아니라 태종이 세종에게 왕위를 물려준 뒤 살았던 수강궁에 몇몇 전각을 보태어 세운 궁궐이다. 따라서 경복궁이나 창덕궁과 비교해볼 때 그 규모나 배치 등에 다른 점이 많다.
  우선 창경궁은 전각의 수가 많지 않고 규모가 아담하다. 공간의 구조와 배치도 경복궁처럼 평지에 일직선의 축을 이루도록 구획된 것이 아니라 창덕궁처럼 높고 낮은 지세를 거스르지 않고 언덕과 평지를 따라가며 터를 잡아 필요한 전각을 지었기에 좀 더 자유로운 분위기이다. 정조가 어머니 혜경궁 홍씨를 위해 지은 자경전도 언덕에 지어졌다.
  창경궁의 또 다른 독특함은 조선시대 다른 궁궐과 주요 전각들이 남향으로 지어진 것과 달리 동쪽을 바라보고 있는 점이다. 창경궁의 경우 정문인 홍화문과 정전인 명정전은 동쪽을 향하고, 관청 건물인 궐내각사와 내전의 주요 전각들은 남쪽을 향해 있다. 남·서·북쪽이 구릉이고, 동쪽이 평지인 지세라서 이를 거스르지 않았기 때문인 것으로 짐작된다.',
  'http://www.heritage.go.kr/unisearch/images/national_treasure/1611760.jpg',
  'http://www.heritage.go.kr/unisearch/images/national_treasure/2021063016231203.jpg',
  'https://www.heritage.go.kr/heri/html/HtmlPage.do?pg=/palaces/palacesCggInfo.jsp&pageNo=2_4_1_0');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (16,103,'창덕궁','  창덕궁은 1405년 (태종5년) 조선왕조의 이궁으로 지어진 궁궐이다.
  경복궁의 동쪽에 자리한 창덕궁은 창경궁과 더불어 동궐이라 불리기도 했다. 임진왜란으로 모든 궁궐이 불에 타자 선조는 경복궁이 아닌 창덕궁의 복구를 선조 40년(1607)에 시작하였으며, 창덕궁은 광해군 2년(1610)에 중건이 마무리 되었다.
  그 후 창덕궁은 1623년 3월 인조반정으로 인정전을 제외하고 또다시 불에 타는 시련을 겪는다. 인조 25년(1647)에 복구되었으나 크고 작은 화재가 이후에도 여러 차례 반복되었다. 특히 1917년 대조전을 중심으로 내전 일곽이 손실되는 대화재가 일어났다. 이때 창덕궁을 복구하기 위하여 경복궁 내의 교태전을 비롯한 강녕전 동·서행각 등의 건물이 해체 전용되었다.
  창덕궁은 1610년 광해군때부터 1868년 고종이 경복궁을 중건할 때가지 총 258년 동안 조선의 궁궐 중 가장 오랜 기간 동안 임금들이 거처하며 정사를 편 궁궐이다.
  조선시대의 뛰어난 조경을 보여주는 창덕궁의 후원을 통해 궁궐의 조경양식을 알 수 있다. 후원에는 160여 종의 나무들이 있으며, 그 중에는 300년이 넘는 나무도 있어 원형이 비교적 충실히 보존되어 있음을 알 수 있다. 창덕궁은 조선시대의 조경이 훼손되지 않고 지금까지 잘 보존되어 있는 귀중한 장소이다.',
  'http://www.heritage.go.kr/unisearch/images/history_site/2021070616362901.jpg',
  'http://www.heritage.go.kr/unisearch/images/history_site/2021070616363002.jpg',
  'https://www.heritage.go.kr/heri/html/HtmlPage.do?pg=/palaces/palacesCdgInfo.jsp&pageNo=2_2_1_0');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (17,108,'남산골 한옥마을','  남산 북쪽 기슭 한옥마을이 들어선 필동(筆洞)은 조선시대 흐르는 계곡이 있어 여름철 피서를 겸한 풍류생활로 이름난 곳이었다. 서울시는 시내에 산재되어 있던 민속문화재 한옥 다섯 채를 이전 · 복원하여 1998년 4월 18일 남산골한옥마을을 조성하고, 선조들의 생활모습을 재조명할 수 있는 전통문화 예술공간으로 꾸몄다. 한옥의 공간적 가치를 살려 시민과 관광객들이 전통문화를 체험할 수 있는 다양한 행사와 프로그램을 진행하고 있다. 
  또한 훼손되었던 남산의 옛 자연지형을 전통정원으로 복원하여 남산의 자연식생인 전통 수종을 심고, 계곡을 만들어 물이 흐르게 하였다. 연못과 정자도 복원되어 선조들이 유유자적하였던 남산의 옛 정취를 한껏 느낄 수 있다. 1994년에 서울을 도읍으로 정한 ‘서울 정도(定都) 600년’을 맞이하여, 서울의 모습과 시민들의 생활을 대표하는 문물 600점을 보신각종 모양의 캡슐에 담아 전통정원 남쪽에 매장하였다, 서울천년타임캡슐은 정도(定都) 1,000년이 되는 2394년 11월 29일에 개봉될 예정이다.',
  'http://www.heritage.go.kr/unisearch/images/folklore_material/1658059.jpg',
  'http://www.heritage.go.kr/unisearch/images/folklore_material/2016012510460300.JPG',
  'https://news.seoul.go.kr/culture/archives/66%5C');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (18,109,'숭례문','  조선시대 한양도성의 정문으로 남쪽에 있다고 해서 남대문이라고도 불렀다. 현재 서울에 남아 있는 목조 건물 중 가장 오래된 것으로 태조 5년(1396)에 짓기 시작하여 태조 7년(1398)에 완성하였다. 이 건물은 세종 30년(1448)에 고쳐 지은 것인데 1961∼1963년 해체·수리 때 성종 10년(1479)에도 큰 공사가 있었다는 사실이 밝혀졌다. 이후, 2008년 2월 10일 숭례문 방화 화재로 누각 2층 지붕이 붕괴되고 1층 지붕도 일부 소실되는 등 큰 피해를 입었으며, 5년 2개월에 걸친 복원공사 끝에 2013년 5월 4일 준공되어 일반에 공개되고 있다.
  이 문은 돌을 높이 쌓아 만든 석축 가운데에 무지개 모양의 홍예문을 두고, 그 위에 앞면 5칸·옆면 2칸 크기로 지은 누각형 2층 건물이다. 지붕은 앞면에서 볼 때 사다리꼴 형태를 하고 있는데, 이러한 지붕을 우진각지붕이라 한다. 지붕 처마를 받치기 위해 기둥 위부분에 장식하여 짠 구조가 기둥 위뿐만 아니라 기둥 사이에도 있는 다포 양식으로, 그 형태가 곡이 심하지 않고 짜임도 건실해 조선 전기의 특징을 잘 보여주고 있다.
   『지봉유설』의 기록에는 ‘숭례문’이라고 쓴 현판을 양녕대군이 썼다고 한다. 지어진 연대를 정확히 알 수 있는 서울 성곽 중에서 제일 오래된 목조 건축물이다.
  ㅇ 숭례문 방화 화재(2008.2.10)
  - 2008년 숭례문 방화 사건(崇禮門放火事件)은 2008년 2월 10일 ~ 2월 11일 숭례문 건물이 방화로 타 무너진 사건이다. 화재는 2008년 2월 10일 오후 8시 40분 전후에 발생하여 다음날인 2008년 2월 11일 오전 0시 40분경 숭례문의 누각 2층 지붕이 붕괴하였고 이어 1층에도 불이 붙어 화재 5시간 만인 오전 1시 55분쯤 석축을 제외한 건물이 훼손되었다.',
  'http://www.heritage.go.kr/unisearch/images/national_treasure/2021042017434802.JPG',
  'http://www.heritage.go.kr/unisearch/images/national_treasure/2685703.jpg',
  'https://www.heritage.go.kr/heri/cul/culSelectDetail.do?culPageNo=1&region=2&searchCondition=%ec%88%ad%eb%a1%80%eb%ac%b8&searchCondition2=&s_kdcd=00&s_ctcd=00&ccbaKdcd=11&ccbaAsno=00010000&ccbaCtcd=11&ccbaCpno=1111100010000&ccbaCndt=&ccbaLcto=&stCcbaAsno=&endCcbaAsno=&stCcbaAsdt=&endCcbaAsdt=&ccbaPcd1=99&chGubun=&header=view&returnUrl=%2fheri%2fcul%2fculSelectViewList.do&pageNo=1_1_1_1');
INSERT INTO HISTORY (HISTORYNO,TRAVELNO,TRAVELNAME,DESCRIPTION,URL_PIC1,URL_PIC2,SOURCE) 
VALUES (19,112,'덕수궁','  덕수궁은 조선시대를 통틀어 크게 두 차례 궁궐로 사용되었다. 덕수궁이 처음 궁궐로 사용 된 것은 임진왜란 때 피난 갔다 돌아온 선조가 머물 궁궐이 마땅치 않아 월산대군의 집이었던 이곳을 임시 궁궐(정릉동 행궁)로 삼으면서 부터이다. 이후 광해군이 창덕궁으로 옮겨가면서 정릉동 행궁에 새 이름을 붙여 경운궁이라고 불렀다. 경운궁이 다시 궁궐로 사용된 것은 조선 말기 러시아 공사관에 있던 고종이 이곳으로 옮겨 오면서부터이다.
  덕수궁의 독특한 건물은 다수 남아 있다. 함녕전 뒤편에 있는 정관헌은 전통식 지붕 구조와 서양식 기둥 양식이 절충된 건물이다. 석조전은 내부와 외부가 모두 서양식으로 꾸며진 건물이다. 이처럼 덕수궁에 여러 서양식 건물이 남아 있는 것을 통해 고종이 서구 문물을 적극적으로 도입한 점을 알 수 있다.
  현재 덕수궁 권역은 고종 당시의 궁궐 면모에는 크게 못 미치지만, 덕수궁에는 저마다 사연을 안은 유서 깊은 전각들이 오순도순 자리하고 있다. 석어당에서 석조전에 이르는 뒤쪽에는 도심의 번잡함을 잊게 하는 호젓한 산책로도 있다. 파란만장한 근대사의 자취를 기억하는 덕수궁은 서울에서 손꼽히는 산책로인 정동길과 더불어 도심의 직장인과 연인들에게 사랑받고 있다.',
  'http://www.heritage.go.kr/unisearch/images/history_site/2021070809303201.jpg',
  'http://www.heritage.go.kr/unisearch/images/history_site/2021070809303502.jpg',
  'https://www.heritage.go.kr/heri/html/HtmlPage.do?pg=/palaces/palacesDeokInfo.jsp&pageNo=2_3_1_0');
  