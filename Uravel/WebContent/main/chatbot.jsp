<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>URAVEL CHATBOT</title>
<script type="text/javascript" src="js/chatbot.js"></script>
<script>
	var ProjectPath = "${pageContext.request.contextPath}";
</script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/chatbot.css">
</head>
<body>
	<div class="chatbot-area">
		<!-- 서버와 메시지를 주고 받는 콘솔 텍스트 영역 -->
		<table id="chatting-area">
			<thead></thead>
			<tbody>
			</tbody>
			<tfoot>
				<tr>
					<td>
						<!-- 채팅 영역 -->
						<form>
							<!-- 텍스트 박스에 채팅의 내용을 작성한다. -->
							<input id="textMessage" type="text" onkeydown="return enter()">
							<!-- 서버로 메시지를 전송하는 버튼 -->
							<input onclick="sendMessage()" value="전송" type="button">
						</form>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<div class="visible-chatbot">
		<a href="javascript:clickChatbot();"><img
			src="https://i.ibb.co/4tjStNZ/chatbot.png" alt="chatbot" border="0"></a>
	</div>
</body>
</html>