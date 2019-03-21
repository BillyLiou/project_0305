<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>公告欄-新增留言</title>
<link href="css/bootstrap-4.2.1.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<script type="text/javascript">
window.onload = function(){
	function getDate(){
	debugger;
	var today = new Date(); 
	/* var date; 
	date = (today.getFullYear()) +"-" + (today.getMonth() + 1 ) + "-" + today.getDate() + "-" + today.toLocaleTimeString(); 
	return date;
	} */
	window.setInterval(function(){
	document.getElementById("getTime").value=getDate();
	}, 1000);
	

</script>

<!-- 此為登入使用者在右上角顯示為管理者 -->
<div class="userInfo">
管理者: ${user}
</div>

<div class="container">
  <div class="row">
    <div class="col-6" style="border-right:2px solid black">
      <button type="button" class="btn btn-lg">新增留言</button>
    </div>
    <!--  
    <div class="col-3">
      <button type="button" class="btn btn-lg">新增留言</button>
    </div>
    <div class="col-3">
      <button type="button" class="btn btn-lg">編輯留言</button>
    </div>
   </div>
   -->
   </div>
  <div class="content1">
			<div class="content1_1">		
			<legend>編輯區</legend>
				<form name="form1" action="MessageAction.action" method="post">
					<label>標題:</label><input type="text" name="topic" placeholder="標題" required/><br>
					<label>發布者: </label><input type="text" name="name"
						placeholder="發佈者"  required/><br> <label>發布時間: </label><input
						type="date" name="releaseDate" id="getTime" required/><br> <label>截止時間: </label><input
						type="date" name="dateline" required/><br>
					<textarea rows="4" cols="50" placeholder="請輸入內文" name="content" required
					></textarea>
					<br> <input type="submit" value="新增">
				</form>
			</div>

			<p><a href="menu.jsp">回到首頁</a></p>
   
  </div>


</body>
</html>