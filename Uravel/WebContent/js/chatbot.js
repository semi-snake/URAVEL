/**
 * 
 */
var ServerPath = "ws://localhost:8787";
var webSocket;

var ServerEmoji = " &#128013; ";
var MyEmoji = " &#128540; ";

///////////// 서버로부터 메세지 보내기 //////////////
function sendMessage() {
	let message = document.getElementById("textMessage");
	if (message.value == '' || message.value.length < 1) {
		alert("메세지를 입력하세요!");
		return false;
	}
	$("#chatting-area tbody").append(
		"<tr><td align='right' class='chat-user-message'>"
		+ message.value + MyEmoji + "</td></tr>");
	webSocket.send(message.value);
	message.value = "";
}

function enter() {
	if (event.keyCode === 13) {
		sendMessage();
		return false;
	}
	return true;
}

function clickChatbot() {
	if ($('.chatbot-area:visible').length == 0) {
		$('.visible-chatbot').css("right", "400px");
		$(".chatbot-area").show();
		webSocket = new WebSocket(ServerPath + ProjectPath + "/broadsocket");
		///////////// 서버로부터 메세지 받기 //////////////
		webSocket.onopen = function(message) {
			$("#chatting-area thead").append(
				"<tr><th>대화에 연결되었습니다.</th></tr>");
		};
		webSocket.onerror = function(message) {
			$("#chatting-area thead").append(
				"<tr><td align='center'>대화 연결에 실패하였습니다.</td></tr>");
		};
		webSocket.onmessage = function(message) {
			var messageData = message.data.replace("(chat)", "&#128064;");
			messageData = messageData.replace("(/chat)", "&#128069;");
			$("#chatting-area tbody").append(
				"<tr><td align='left' class='chat-server-message'>"
				+ ServerEmoji + messageData + "</td></tr>");
		};

		$(".chatbot-area input[type='text']").focus();

	} else {
		$('.visible-chatbot').css("right", "0");
		$(".chatbot-area thead").children().remove();
		$(".chatbot-area tbody").children().remove();
		$(".chatbot-area").hide();

	}
}
