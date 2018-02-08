<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Notes list</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://opensource.keycdn.com/fontawesome/4.7.0/font-awesome.min.css">
</head>
<body>
<div class="container">
    <a href="../../index.jsp">Main page</a>
    <h1>Note list</h1>

    <c:if test="${!empty listNotes}">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Text</th>
                <th>Created Date</th>
                <th>Is Done</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listNotes}" var="note">
                <tr>
                    <td>${note.id}</td>
                    <td>${note.noteText}</td>
                    <td>${note.createdDate}</td>
                    <td>
                        <c:choose>
                            <c:when test="${note.done} == true">
                                <i class="fa fa-check"></i> Done
                            </c:when>
                            <c:otherwise>
                                <a class="btn btn-outline-primary" href="<c:url value='/done/${note.id}'/>">Do it!</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td><a class="btn btn-outline-primary" href="<c:url value='/update/${note.id}'/>"><i
                            class="fa fa-pencil"></i> Update</a></td>
                    <td><a class="btn btn-outline-danger" href="<c:url value='/delete/${note.id}'/>"><i
                            class="fa fa-trash"></i> Delete</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <h2>Add a note</h2>
    <c:url var="createAction" value="/notes/create"/>
    <form:form action="${createAction}" commandName="note">
        <c:if test="${note.id} > 0">
            <form:hidden path="id"/>
            <form:hidden path="done"/>
            <form:hidden path="createdDate"/>
        </c:if>
        <div class="form-group">
            <form:textarea path="noteText" class="form-control" rows="3" placeholder="Note text"/>
        </div>
        <c:if test="${!empty note.noteText}">
            <button type="submit" class="btn btn-primary">Edit note</button>
        </c:if>
        <c:if test="${empty note.noteText}">
            <button type="submit" class="btn btn-primary">Add note</button>
        </c:if>
    </form:form>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</body>
</html>
