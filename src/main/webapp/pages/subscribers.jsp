<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
int a=1;
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="pages/static/table.css">
    <title>καιρός - Subscribed Users</title>
</head>
<body>
    <div class="container">
        <h1>Subscribed Users</h1>
        <button type="submit" onclick="document.location='/admin-logout'">Logout</button>
        <form name="f" method="get" action="searchplace">
		Search place:<input type="text" name="place">
		<input type="submit" value="search">
		</form>
        <table class="rwd-table">
            <tbody>
            <tr>
				<th>S.No.</th>
				<th>Full Name</th>
				<th>Email</th>
				<th>Place</th>
				<th>Phone No.</th>
				<th>Action</th>
            </tr>
            <c:forEach var="sub" items="${subscriber}">
            <tr>
                <td data-th="S.No.">
                <%=a %>
                <%a++; %>
                </td>
                <td data-th="Full name">
                ${sub.getUser_name() }
                </td>
                <td data-th="Email">
                ${sub.getEmail() }
                </td>
                <td data-th="Place">
                ${sub.getPlace() }
                </td>
                <td data-th="Phone">
                ${sub.getPhone_number() }
                </td>
                <td data-th="Action">
                <a href="http://127.0.0.1:8080/unsubscribe?id=${sub.getUser_id() }">Delete</a>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>