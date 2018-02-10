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
                    <td>${note.done} </td>
                    <td>
                        <button class="btn btn-outline-primary note-update"
                                id="<c:url value='note-update-${note.id}'/>"><i
                                class="fa fa-pencil"></i> Update
                        </button>
                    </td>
                    <td><a class="btn btn-outline-danger" href="<c:url value='/delete/${note.id}'/>"><i
                            class="fa fa-trash"></i> Delete</a></td>
                </tr>
            </c:forEach>
            <tr>
                <td></td>
                <td colspan="3">
                    <p><b>Add a note</b></p>
                    <c:url var="createAction" value="/notes/create"/>
                    <form:form action="${createAction}" commandName="note">
                        <div class="form-group">
                            <form:textarea path="noteText" class="form-control" rows="2" placeholder="Note text"/>
                        </div>
                        <button type="submit" class="btn btn-primary">Add note</button>
                    </form:form>
                </td>
                <td></td>
                <td></td>
            </tr>
            </tbody>
            <!-- paginator row will be here -->
            <tfoot>
            <tr>
                <td colspan="6">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">

                            <c:set var="p" value="${paging.get('current')}" /> <%-- current page (1-based) --%>
                            <c:set var="l" value="5" /> <%-- amount of page links to be displayed --%>
                            <c:set var="r" value="${l / 2}" /> <%-- minimum link range ahead/behind --%>
                            <c:set var="n" value="${paging.get('total')}" /> <%-- total amount of notes --%>
                            <c:set var="s" value="${paging.get('size')}" /> <%-- notes per page --%>
                            <c:set var="t" value="${paging.get('pages')}" /> <%-- total amount of pages --%>

                            <li class="page-item <c:if test="${p == 1}">disabled</c:if>"><a class="page-link" href="/notes/${p - 1}/${s}"><i class="fa fa-chevron-left"></i> Prev</a></li>
                            <c:set var="begin" value="${((p - r) > 0 ? ((p - r) < (t - l + 1) ? (p - r) : (t - l)) : 0) + 1}" />
                            <c:set var="end" value="${(p + r) < t ? ((p + r) > l ? (p + r) : l) : t}" />
                            <c:forEach begin="${begin}" end="${end}" var="page">
                                <li class="page-item <c:if test="${p == page}">active</c:if>"><a class="page-link" href="/notes/${page}/${s}">${page}</a></li>
                            </c:forEach>


                            <li class="page-item <c:if test="${p == t}">disabled</c:if>"><a class="page-link" href="/notes/${1 + p}/${s}">Next <i class="fa fa-chevron-right"></i></a></li>
                        </ul>
                    </nav>


                </td>
            </tr>
            </tfoot>
        </table>
    </c:if>
</div>

<div class="modal fade" id="note-update" tabindex="-1" role="dialog" aria-labelledby="note-update-label"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="note-update-label">Update note</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ...
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script>
    $('.note-update').on('click', function () {
        var noteId = $(this).attr('id').split('-')[2];
        $.get('/read/' + noteId, function (r) {
            $('#note-update').find('.modal-body').html(r);
            $('#note-update').modal();
        });
    })
</script>
</body>
</html>
