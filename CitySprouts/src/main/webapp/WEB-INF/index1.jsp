<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
<a href="getDrivers.do"> Get People</a>
<c:if test="${not empty users }">
<c:forEach var="user" items="${users}">
<ul>
<li>${user.firstName}
</ul>
</c:forEach>
</c:if>




</body>
</html>