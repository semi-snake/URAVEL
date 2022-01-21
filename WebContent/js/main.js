function clickArticle(travelno) {
	window.location.href = "TravelController?command=areadetail&travelno=" + travelno;
}
function clickHistory(historyno) {
	window.location.href = "history/history_Controller?command=desc&historyno=" + historyno;
}
function clickBlogdata(url) {
	window.open(url, "_blank");
}

function checkEmpty() {
	let message = document.getElementsByName("keyword")[0];
	if (message.value == '' || message.value.length < 1) {
		alert("메세지를 입력하세요!");
		return false;
	}
	return true;
}

function search(keyword) {
	var apiUrl = 'https://dapi.kakao.com/v2/search/blog?query='
	$.ajax(
		{
			url: apiUrl + '서울 여행' + keyword + ' 리뷰',
			headers: {
				'Authorization': 'KakaoAK 4d9c0dc7983c0e5bdd587a579080c69f'
			},
			type: 'GET'
		})
		.done(function(data) {
			$.each(data,
				function(key, val) {
					if (key == 'documents') {
						var list = val;
						for (var i = 0; i < list.length; i++) {
							$('#naver_review').append('<article onclick="clickBlogdata(\'' + list[i].url + '\')">' +
								'<section>' + '<img src="' + list[i].thumbnail + '" alt="' + list[i].title + '">' + '</section>' +
								'<section>' +
								'<span class="result-list-title">' + list[i].title + '</span>' +
								'<span class="result-list-content">' + list[i].contents + '</span>' +
								'<span class="result-list-content">' + list[i].blogname + '</span>' +
								'</section>' + '</article>');
						}
					}
				});
		});
}