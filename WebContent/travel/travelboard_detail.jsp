<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dto.TravelListDto"%>
<%@ page
	import="java.util.*, com.dto.TravelDetailDto, com.dto.MemberDto"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>

<%
TravelDetailDto travelDetail = (TravelDetailDto) request.getAttribute("travelDetail");
int likeYn = (int) request.getAttribute("likeYn");
int travelno = (int) request.getAttribute("travelno");

int userno = 0;
MemberDto mem = (MemberDto) session.getAttribute("userInfo");
if (mem != null) {
	userno = mem.getUserno();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=travelDetail.getTravelName()%></title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/travelboard_detail.css">

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=078e401a64f63ae93818c494f7f8ac99&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<style>
#mainImgWrap {
	width: 100%;
	height: 402px;
	margin: 0 auto;
	background: #fff;
	position: relative;
	background-size: cover;
}

.slidePhotoWrap {
	width: 99%;
	height: 150px;
	margin: 0 auto;
	position: relative;
	top: 10px;
}

.sub_wrap {
	width: 100%;
	margin: 0 auto;
	height: 100%;
}

.arrowBtn {
	user-select: none;
	display: inline-block;
	width: 24px;
	height: 100%;
	position: relative;
	text-align: center;
	top: -135px;
}

#slideImgWrap {
	width: calc(100% - 60px);
	height: 100%;
	background: #fff;
	display: inline-block;
	overflow: hidden;
	border: 1px solid #dcdcdc;
}

#slideImgWrap ul {
	overflow: hidden;
	height: 100%;
	width: max-content;
	margin: 0;
	padding: 0;
}

#slideImgWrap li {
	height: 100%;
	list-style: none;
	display: inline-block;
	width: 172.2px;
	float: left;
	overflow: hidden;
	position: relative;
}

#slideImgWrap li .imgs {
	width: 100%;
	height: 100%;
	background-size: cover;
}

.arrowIcon {
	position: relative;
	top: 70px;
}

.photoWrap {
	width: 100%;
	height: 100%;
	background: #fff;
}

.likeYnBtn img {
	width: 25px;
	height: 25px;
	position: relative;
	top: 6px;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<div class="page_title" style="position: relative;">
			<h1><%=travelDetail.getTravelName()%></h1>
		</div>

		<div class="all_box">
			<div class="top_box">
				<div class="info_box">
					<div
						style="background-color: rgb(68, 138, 255, 0.1); position: relative;">
						<div class="map_name" style="margin-top: 15px;">
							<img
								src="http://drive.google.com/uc?export=view&id=1i9JyxxltWWcXP8cea-KpeXSaOelUfUq0"
								style="width: 16px; height: 16px;"> <span
								class="travel_name">여행지 이름</span> <span
								class="travel_name_detail" style="font-size: 24px"> <%=travelDetail.getTravelName()%>
							</span>
						</div>
						<div class="total_review" style="margin-left: 23px;">
							<div style="margin-top: 15px;">
								<span class="likeYnBtn"> <%
 if (likeYn == 0) {
 %> <img
									src="http://drive.google.com/uc?export=view&id=19AZ8l-EmcsbKY-Hbbrf-S3R8INyjgJsk">
									<%
									} else {
									%> <img
									src="http://drive.google.com/uc?export=view&id=1M02zu8VFmPDcmMnUeixkmHNXIIqWM1N0">
									<%
									}
									%>
								</span> <span class="total_review_num"><span><%=travelDetail.getLike_count()%></span>개의
									좋아요</span>
							</div>

						</div>
						<div class="map_address" style="margin-top: 15px;">
							<img
								src="http://drive.google.com/uc?export=view&id=1i9JyxxltWWcXP8cea-KpeXSaOelUfUq0"
								style="width: 16px; height: 16px;"> <span
								class="travel_address">주소</span> <span
								class="travel_address_detail">: <%=travelDetail.getTravelAddress()%></span>
						</div>
					</div>
					<div class="map_box1">
						<div id="map" style="width: 100%; height: 100%;"></div>
					</div>

					<div class="review">
						<div class="comment_box"
							style="background-color: rgb(68, 138, 255, 0.1); height: 150px; text-align: center;">
							<a href="${pageContext.request.contextPath }/ReviewController?command=writeform&travelno=<%=travelno%>">리뷰 작성하러 가기!</a>
						</div>
					</div>
				</div>
				<!-- 포토박스 시작 -->
				<div class="photo_box">
					<div class="photoWrap">
						<div id="mainImgWrap"></div>
						<div class="slidePhotoWrap">
							<div class="sub_wrap">
								<div data-type="prev" class="arrowBtn">
									<span>&#9194;</span>
								</div>
								<div id="slideImgWrap">
									<ul>
										<!--이미지가 들어갈자리-->
									</ul>
								</div>
								<div data-type="next" class="arrowBtn">
									<span>&#9193;</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 포토박스 끝 -->
			</div>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
<script type="text/javascript">

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//주소로 좌표를 검색합니다
	geocoder.addressSearch('<%= travelDetail.getTravelAddress() %>', function(result, status) {
	
	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {
	
	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });
	
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+'<%=travelDetail.getTravelName() %>'+'</div>'
	    });
	    infowindow.open(map, marker);
	
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
	}); 
	
	$("#detailViewBtn").click(function(){
		var open = $(".comment").css("overflow")
		if(open=="hidden"){ 
			$(".comment").css("overflow","auto")
		}else{ 
			$(".comment").css("overflow","hidden")
		}
	});
	
	//이미지 슬라이드
	var url_arr = "<%= travelDetail.getUrl_pic() %>".split(",");
	var html = "";
    //- 초기 slide set
    for(var i = 0; i < url_arr.length; i++) {
        if(i === 0) $("#mainImgWrap").css({backgroundImage:("url(" + url_arr[0] + ")")});
        html += "<li><div class='imgs' style='background-image:url(" + url_arr[i] + ")'></div></li>";
    } 
    $("#slideImgWrap ul").html(html);
    
    //- click
    $("#slideImgWrap ul li").click(function(e) {
        var url = $(this).find(".imgs").css("backgroundImage");
        if(url === undefined) return;
        $("#mainImgWrap").css({"backgroundImage":url});
    });

    //- btn click
    $(".arrowBtn").click(function(e) {
        var target = $("#slideImgWrap li"); 
        var pos = Number(target.css("left").replace("px",""));
        var DEFAULT_SIZE = 172.2;
        switch($(this).data("type")) {
            case "prev" :
                if(pos === 0) break; 
                pos += DEFAULT_SIZE; break;
            case "next" : 
                if(((target.length-4) * DEFAULT_SIZE) <= Math.abs(pos)) break;
                pos -= DEFAULT_SIZE; break;
        }
        target.css({left:pos+"px"}); 
    });	
    
    
   	var likeYn = "<%=likeYn%>";
   	
    $(".likeYnBtn").click(function(e) {
	    	//- 좋아요 취소 로직 0이면 좋아요하기, 1이면 좋아요 삭제하기
	    	var travelno = "<%=travelno%>";
	    	var userno = "<%=userno%>";
	    	if(userno == 0) {
	    		alert("로그인을 해주세요.");
	    		return;
	    	}
	    	$.ajax({
	    		type: "POST",
	    		url:"http://localhost:8787/Uravel/TravelController",
	    		dataType:"text",				//return type
	    		data : {						// parameter(매개변수)
	    			likeYn : likeYn,
	    			travelno: travelno,
	    			command: "likeYn",
	    			userno: userno
	    		},
	    		success : function(result) {	//성공시
	    			//- 좋아요
	    			if(likeYn == "0") {
	    				alert("좋아요 되었습니다.");
	    				$(".likeYnBtn img").attr("src","http://drive.google.com/uc?export=view&id=1M02zu8VFmPDcmMnUeixkmHNXIIqWM1N0");
	    				var count = Number($(".total_review_num span").text()) + 1;
	    				$(".total_review_num span").text(String(count));
	    				likeYn = "1";
	    			} 
	    			//- 좋아요 취소
	    			else {
	    				alert("좋아요 취소 되었습니다.");
	    				$(".likeYnBtn img").attr("src","http://drive.google.com/uc?export=view&id=19AZ8l-EmcsbKY-Hbbrf-S3R8INyjgJsk");
	    				var count = Number($(".total_review_num span").text()) - 1;
	    				$(".total_review_num span").text(String(count));
	    				likeYn = "0";
	    			}
	    		},
	    		error : function() {		//실패시
	    			alert("세션이 만료되었거나 오류가 발생하였습니다.")
	    		}
	    	});
    	});
</script>
</html>