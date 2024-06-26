<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>결재 양식 목록</title>

        <!--파비콘-->
        <link rel="icon" href="/img/logo.png" type="image/png">

        <link rel="stylesheet" href="/css/document/list.css">
        <script defer src="/js/document/list.js"></script>
 <!-- jQuery 라이브러리 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/document/aside.jsp" %>
<main>
<h2>결재 양식 목록</h2>
<a href="/template/add"><button type="button">작성</button></a>
 <c:forEach var="template" items="${templateList}">
          <div class="approval-lines-box template-div" data-template-no="${template.templateNo}">
              <div class="approval-lines">
                 <span class="approval-title">카테고리 : ${template.categoryName}</span>
                 <br>
                 <span class="approval-title">양식명 : ${template.title}</span>
                 <br>
                 <span class="approval-enroll">생성날짜 : ${template.enrollDate}</span>
                 <hr>
                 <a class="approval-lines-btn" onclick="openModal()">
                     <img class="edit_img" src="/img/edit.png" alt="수정 아이콘">
                 </a>
                 <a class="approval-lines-btn delete-btn"data-template-no="${template.templateNo}">
                     <img class="delete_img" src="/img/delete.png" alt="삭제 아이콘">
                 </a>
             </div>
         </div>
     </c:forEach>
     </main>


</body>
</html>
