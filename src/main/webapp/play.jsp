<%@ page import="util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 残数の更新処理(残数の取得、更新、保存など)    
String num = request.getParameter("num");
String player;
int totalNum;

if (session.getAttribute("player") == null) {
	session.setAttribute("player", "A");
}

if (session.getAttribute("totalNum") == null) {
	session.setAttribute("totalNum", 25);
}

player = (String) session.getAttribute("player");

totalNum = (int) session.getAttribute("totalNum");

// 残数が0以下の場合、結果ページへ遷移
if (totalNum <= 0) {
	response.sendRedirect("finish.jsp");
}

if (!Utility.isNullOrEmpty(num)) {
	if (num.equals("1")) {
		totalNum -= 1;
		session.setAttribute("totalNum", totalNum);

	} else if (num.equals("2")) {
		totalNum -= 2;
		session.setAttribute("totalNum", totalNum);

	} else if (num.equals("3")) {
		totalNum -= 3;
		session.setAttribute("totalNum", totalNum);
	}
}

if (player.equals("A")) {

	session.setAttribute("player", "B");

} else if (player.equals("B")) {

	session.setAttribute("player", "A");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java基礎課題</title>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
	<h1>石取りゲーム</h1>

	<div class="info">
		<h2>
			残り：<%=totalNum%>個
		</h2>
		<p class="stone">
			<%
			out.print(Utility.getStoneDisplayHtml(totalNum));
			%>
		</p>
	</div>
	<div class="info">
		<h2>
			プレイヤー<%=player%>の番
		</h2>

		<form action="play.jsp">
			<p>
				石を <input type="number" name="num" min="1" max="3"> 個取る<br>
				※1度に3個取れます。
			</p>
			<button class="btn" type="submit">決定</button>
		</form>
	</div>
</body>
</html>

