window.onload = function() {
	var doc = document.getElementsByName("description")[0];
	resize(doc);
};
function resize(obj) {
	obj.style.height = "1px";
	obj.style.height = (1 + obj.scrollHeight) + "px";
}