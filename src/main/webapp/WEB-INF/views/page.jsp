<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html>
<head>
    <title>Boot에서 JSP 쓰기</title>
</head>
<body>
<h1>JSP!</h1>
<p>${data}</p>
<div>
    <c:forEach items="${data}" var="item">
        <p>${item}</p>
    </c:forEach>
</div>
</body>
</html>