<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/js/user/findaddr.js"></script>
</head>
<body>
<form method="post" action="updateresult">
    <ul>
        <li>
            <input type="text" name="userNo" value="${user.userNo}" readonly>
        </li>
        <li>
            <input type="hidden" name="password" value="${user.password}">
        </li>
        <li>
            <input type="text" name="userId" value="${user.userId}" readonly>
        </li>
        <li>
            <input type="text" name="userName" id="userName" value="${user.userName}">
        </li>
        <li>
            <input type="text" name="address" value="${user.addr}">
        </li>
        <li>
            <div><input type="text" id="addr" onclick="findAddr()">주소 입력하기</div>
        </li>
        <li>
            <input type="text" name="postcode" id="postcode" placeholder="우편번호" readonly>
        </li>
        <li>
            <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소" readonly>
        </li>
        <li>
            <input type="text" name="jibunAddress" id="jibunAddress" placeholder="지번주소" readonly>
        </li>
        <li>
            <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목" readonly>
        </li>
        <li>
            <span class="detail_addr">상세 주소를 입력해 주세요.</span>
            <input type="text" name="detailAddress" id="detailAddress" placeholder="상세 주소">
        </li>
        <li>
            <button type="submit">수정완료</button>
            <button type="reset">취소</button>
        </li>
    </ul>

</form>
</body>
</html>