<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/lecture/lecture_detail.css">
</head>
<body>
<div id="wrap">
<%--    <a href="/lecture_list">목록으로</a>
    <a href="/lecture_update/${dto.lectureNo}">수정하기</a>
    <a href="/lecture_delete/${dto.lectureNo}">삭제하기</a>--%>

    <header>
        <h2>${dto.lectureName}</h2>
        <%-- 관리자만 볼 수 있도록 수정 --%>
        <a href="/lecture_update/${dto.lectureNo}">수정하기</a>
    </header>
    <div class="line"></div>
    <section>
        <article>
            <div id="mainInfo">
                <img src="/getImage/${dto.thumbnail}" alt="${dto.thumbnail}">
                <h3>${dto.lectureName}</h3>
                <ul>
                    <li>
                        <span>과목</span>
                        <span>${dto.subjectName}</span>
                    </li>
                    <li>
                        <span>선생님</span>
                        <span>${dto.teacher}</span>
                    </li>
                    <li>
                        <span>가격</span>
                        <span><fmt:formatNumber value="${dto.price}" pattern="#,###" /></span>
                    </li>
                    <li>
                        <span>수강대상</span>
                        <span>${dto.target}</span>
                    </li>
                    <li>
                        <span>개강일</span>
                        <span>${dto.startDate}</span>
                    </li>
                </ul>
            </div>
            <ul>
                <li>
                    <a href="#">바로결제</a>
                    <a href="#">찜하기</a>
                </li>
            </ul>
        </article>
    </section>
</div>
</body>
</html>
