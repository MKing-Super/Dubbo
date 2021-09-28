<%--
  Created by IntelliJ IDEA.
  User: kun.ma
  Date: 2021/9/28
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>标准jsp页面</title>
    <script src="${pageContext.request.contextPath}/static/js/template-web.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.js"></script>
</head>
<body>
<h1>${test}</h1>
<h2>${nowdate}</h2>
<input type="button" id="tt" value="点我">
</body>
<script src="${pageContext.request.contextPath}/static/js/standard/index.js"></script>
</html>
