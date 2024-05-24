<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/user/user_mypage.css">
</head>
<body>
<jsp:include page="../main/top.jsp"/>
<div id="mypage">
    <section class="myinfo">
        <h3>${user.userId}님의 마이 페이지</h3>
        <div class="link">
            <a href="/index">메인 화면</a>
            <a href="/user_update">내정보 수정</a>
        </div>
    </section>
    <ul class="lecture_list">
        <li class="mylecture">
            <h4>수강중인 강의 목록</h4>
            <div class="lecture_detail">
                <c:forEach var="item" items="${lecturelist}">
                    <div class="lect">
                        <a href="/lecture_detail/${item.lectureNo}">
                            <img src="/getImage/${item.thumbnail}" alt="썸네일" class="thumbnail">
                        </a>
                        <p>${item.lectureName}</p>
                    </div>
                </c:forEach>
            </div>
        </li>
        <li class="wishlist">
            <h4>내가 찜한 목록</h4>
            <div class="lecture_wish">
                <c:forEach var="wish" items="${wishlist}">
                    <div class="lect">
                        <a href="/lecture_detail/${wish.lectureNo}">
                            <img src="/getImage/${wish.thumbnail}" alt="썸네일" class="thumbnail">
                        </a>
                        <p>${wish.lectureName}</p>
                    </div>
                </c:forEach>
            </div>
        </li>
    </ul>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
