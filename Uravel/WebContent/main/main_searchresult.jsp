<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<style>
#search-result h1 {
	padding: 100px;
	background-color: skyblue;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	
	$(function() {
	      $.ajax(
	               {
	                url : 'https://dapi.kakao.com/v2/search/blog?query=서촌 맛집',
	                headers : {
	                        'Authorization' : 'KakaoAK 4d9c0dc7983c0e5bdd587a579080c69f'
	                     },
	                     type : 'GET'
	        }).done(function(data) {
	             $.each(data,
             function(key, val) {
             if (key == 'documents') {
            var list = val;
          for (var i = 0; i < list.length; i++) {
           $('#result').append(list[i].blogname + '<br>'); 
           $('#result').append(list[i].contents + '<br>');
           $('#result').append(list[i].datetime + '<br>');
          $('#result').append(list[i].title +'<br>');
           $('#result').append('<img src="' + list[i].thumbnail + '">');
         }
        }
      });
	      console.log(data);
	   });
	   });

</script>
</head>
<body>


	<%@ include file="../common/header.jsp"%>
	<main>
		<!--검색 결과 표시-->
		<div id="search-result">
			<h1>
				'<%=request.getParameter("keyword")%>' 키워드에 대한 검색 결과입니다.
			</h1>
			<br>
			<h2>사이트 내 검색</h2>
			<br>
			<div class="info-list">
				<div class="image-list">
					<a href="#"> <img
						src="https://cdn.crowdpic.net/list-thumb/thumb_l_0FE32A6276E052E847372AD89788CDB1.jpeg"
						alt=""> <span>정보1</span>
					</a> <a href="#"> <img
						src="https://mblogthumb-phinf.pstatic.net/20150214_255/avnet75_1423874818667ysVFR_JPEG/008.JPG?type=w2"
						alt=""> <span>정보2</span>
					</a> <a href="#"> <img
						src="https://gwanghwamun.seoul.go.kr/mcms/upload/encoding/image/2021/08/MIG_PT_PH_00000608002.jpg"
						alt=""> <span>정보3</span>
					</a> <a href="#"> <img
						src="https://live.staticflickr.com/5598/15354504160_f0997ae50f_b.jpg"
						alt=""> <span>정보4</span>
					</a>
				</div>
			</div>
			<h2>외부 사이트 리뷰</h2>
			<br>
			<div class="review-list">
				<article>
					<a href="#">
						<section>
							<img
								src="https://live.staticflickr.com/5598/15354504160_f0997ae50f_b.jpg"
								alt="리뷰1">
						</section>
						<section>
							<h5>1번 리뷰</h5>
							<h6>1번 리뷰입니다.</h6>
						</section>
					</a>
				</article>
				<article>
					<a href="#">
						<section>
							<img
								src="https://live.staticflickr.com/5598/15354504160_f0997ae50f_b.jpg"
								alt="리뷰1">
						</section>
						<section>
							<h5>2번 리뷰</h5>
							<h6>2번 리뷰입니다.</h6>
						</section>
					</a>
				</article>
				<article>
					<a href="#">
						<section>
							<img
								src="https://live.staticflickr.com/5598/15354504160_f0997ae50f_b.jpg"
								alt="리뷰1">
						</section>
						<section>
							<h5>3번 리뷰</h5>
							<h6>3번 리뷰입니다.</h6>
						</section>
					</a>
				</article>
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>