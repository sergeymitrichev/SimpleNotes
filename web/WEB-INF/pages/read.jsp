<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <title>Read Note</title>


</head>
<body>
<h1>Book Details</h1>

<table class="table table hover">
    <tr>
        <th>ID</th>
        <th>Note</th>
        <th>Created Date</th>
        <th>Is done</th>
    </tr>
    <tr>
        <td>${note.id}</td>
        <td>${note.noteText}</td>
        <td>${note.createdDate}</td>
        <td>${note.done}</td>
    </tr>
</table>
</body>
</html>