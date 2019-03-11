<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>公告欄-留言區</title>
<link href="css/bootstrap-4.2.1.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="css/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$(".topic").click(function(){
		$(this).parent().find(".message_info").slideToggle();	
		})
    });
	
	</script>
</head>

<body>
<!-- 此為登入使用者在右上角顯示為管理者 -->
<div class="userInfo">
管理者: ${user}
</div>

<div class="container">
  <div class="row">
    <div class="col-6" style="border-right:2px solid black">
      <button type="button" class="btn btn-lg">公告欄</button>
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
    <h2>留言區</h2>
    	
    		<c:choose>
    			<c:when test="${model != null}">
    				<c:forEach var="item" items="${model}">
    				    <div class="board">
    					<div class="topic">${item.id} topic: ${item.topic}<span class="edit">修改</span></div>
    					<div class="message_info"  style="display: none;" >
    					name: ${item.name }<br>
    					發佈日期: ${item.releaseDate }<br>
    					截止日期: ${item.dateline }<br>
    					內文: ${item.content }<br>
    					</div>
    					</div>
    				</c:forEach>
    			</c:when>
    		</c:choose>
    	
    <p><a href="menu.jsp">回到首頁</a></p>
   
  </div>


</body>
</html>