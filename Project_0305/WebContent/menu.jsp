<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>公告欄</title>
<link href="css/bootstrap-4.2.1.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>


<body>

<!-- 此為登入使用者在右上角顯示為管理者 -->
<div class="userInfo">
管理者: ${user}<form name="form1" action="Logout.action" method="post"><input type="submit" value="登出"></form>

</div>

<div class="container">
<!-- 以下是頁面的最上端有三個可以導入不同的頁面 -->
  <div class="row">
    <div class="col-6">
      <a href="BulletinBoard.jsp"><button type="button" class="btn btn-lg">公告欄</button></a>
    </div>
    <div class="col-3">
      <a href="add.jsp"><button type="button" class="btn btn-lg">新增留言</button></a>
    </div>
    <div class="col-3">
      <a href="edit.jsp"><button type="button" class="btn btn-lg">編輯留言</button></a>
    </div> 
    
  </div>
  
  <!-- 以下是網頁的中間內容 -->
  <div class="content1">
    <h2>使用方法</h2>
    <div class="list-group"> <a href="BulletinBoard.jsp" class="list-group-item active">
      <h5 class="mb-1">公告欄</h5>
      <p class="mb-1">可觀看可否有新訊息</p></a>
      </a> <a href="add.jsp" class="list-group-item">
      <h5 class="mb-1">新增留言</h5>
      <p class="mb-1">可以張貼新的留言到公告欄上</p>
      </a> <a href="edit.jsp" class="list-group-item ">
      <h5 class="mb-1">編輯留言</h5>
      <p class="mb-1">可將公告欄上的留言編輯或刪除</p>
      </a> </div>
  </div>
</div>
</body>
</html>