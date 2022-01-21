<%@page import="com.dto.TravelDetailDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.dto.TravelListDto"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<%
String localName = (String) request.getAttribute("localName");
List<TravelListDto> travelList = (List<TravelListDto>) request.getAttribute("travelList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=localName%></title>
<script type="text/javascript">
	
</script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/travelboard.css">
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<%@ include file="./areatitle.jsp"%>
		<h1 style="text-align: center;"><%=localName%></h1>
		<div class="board_list">
			<table class="table table-striped"
				style="text-align: center; inline-block; border: 1px solid #dddddd">

				<colgroup>
					<col class="thumnail">
					<col class="number">
					<col class="tag">
					<col class="title">
					<col class="recommend">
				</colgroup>
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">이미지</th>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">태그</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">좋아요</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (int i = 0; i < travelList.size(); i++) {
					%>
					<tr>
						<td class="thumnail1"><img
							src="<%=travelList.get(i).getPic_arr()[0]%>" alt="사진없음"
							style="width: 100px; height: 100%;"></td>
						<td class="number1"><%=travelList.get(i).getTravelno()%></td>
						<td class="tag1"><%=travelList.get(i).getThemename()%></td>
						<td class="title1"><a
							href="http://localhost:8787/Uravel/TravelController?travelno=
									<%=travelList.get(i).getTravelno()%>&command=areadetail">
								<%=travelList.get(i).getTravelname()%></a></td>
						<td class="like_count"><%=travelList.get(i).getLike_count()%></td>
					</tr>
					<%
					}
					%>

				</tbody>
			</table>
		</div>
	</main>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>