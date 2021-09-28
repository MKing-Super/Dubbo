<%--
  Created by IntelliJ IDEA.
  User: MK
  Date: 2021/9/12
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/template-web.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.js"></script>
</head>
<body>
<h1>${test}</h1>
<h2>${nowdate}</h2>
<input type="button" id="tt">
</body>
<script type="text/javascript">
    const index = {};

    index.initButton = function (){
        $("#downloadTxt").click(function () {
            $.ajax({
                //请求方式
                type : "POST",
                //请求的媒体类型
                contentType: "application/json;charset=UTF-8",
                //请求地址
                url : "/zk/downloadTxt",
                //数据，json字符串
                data : "",
                //请求成功
                success : function(result) {
                    alert(result)
                },
                //请求失败，包含具体的错误信息
                error : function(){
                    alert("返回信息失败！！！")
                }
            });
        });

        $("#tt").click(function () {
            alert("6666");
        });
    };

    index.initOnload = function () {

    };

    $(function(){
        index.initButton();
        index.initOnload();
    });
</script>
</html>
