<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<c:url var="updateAction" value="/update"/>
<form:form action="${updateAction}" commandName="note" class="form-row align-items-center">
    <form:hidden path="id" value="${note.id}"/>
    <div class="form-group col-sm-1">
        ID: ${note.id}

    </div>
    <div class="form-group col-sm-8">
        <form:textarea path="noteText" class="form-control" rows="2" placeholder="Note text"/>
    </div>
    <div class="form-group col-sm-2">
        Created: ${note.createdDate}
    </div>
    <div class="form-group col-sm-1">
        <form:checkbox path="done" value="${note.done}"/>
        <form:label path="done">Is done</form:label>
    </div>
    <div class="text-right col-sm-12">
        <button type="submit" class="btn btn-primary">Edit note</button>
    </div>
</form:form>