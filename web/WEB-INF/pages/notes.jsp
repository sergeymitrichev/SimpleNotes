<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ page contentType="text/html;charset=utf-8" %>

<c:set var="p" value="${criteria.get('current')}"/> <%-- current page (1-based) --%>
<c:set var="l" value="5"/> <%-- amount of page links to be displayed --%>
<c:set var="r" value="${l / 2}"/> <%-- minimum link range ahead/behind --%>
<c:set var="n" value="${criteria.get('total')}"/> <%-- total amount of notes --%>
<c:set var="s" value="${criteria.get('size')}"/> <%-- notes per page --%>
<c:set var="t" value="${criteria.get('pages')}"/> <%-- total amount of pages --%>
<c:set var="filter" value="${criteria.get('filter')}"/>
<c:set var="sort" value="${criteria.get('sort')}"/>

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
    <div class="float-left">
        <c:if test="${filter.equals(\"1\")}">
            <span class="btn btn-primary">Выполненные</span>
        </c:if>
        <c:if test="${!filter.equals(\"1\")}">
            <a class="btn btn-outline-primary"
               href="/notes?page=${criteria.get("page")}&done=1&created=${criteria.get("sort")}">Выполненные</a>
        </c:if>

        <c:if test="${filter.equals(\"0\")}">
            <span class="btn btn-primary">Невыполненные</span>
        </c:if>
        <c:if test="${!filter.equals(\"0\")}">
            <a class="btn btn-outline-primary"
               href="/notes?page=${criteria.get("page")}&done=0&created=${criteria.get("sort")}">Невыполненные</a>
        </c:if>

        <c:if test="${filter.equals(\"all\")}">
            <span class="btn btn-primary">Все</span>
        </c:if>
        <c:if test="${!filter.equals(\"all\")}">
            <a class="btn btn-outline-primary"
               href="/notes?page=${criteria.get("page")}&created=${criteria.get("sort")}">Все</a>
        </c:if>
    </div>
    <div class="float-right">
        <c:if test="${sort.equals(\"true\")}">
            <span class="btn btn-primary">Сначала новые</span>
            <a class="btn btn-outline-primary" href="/notes?page=${criteria.get("page")}&done=${criteria.get("filter")}">Сначала
                старые</a>
        </c:if>
        <c:if test="${!sort.equals(\"true\")}">
            <a class="btn btn-outline-primary"
               href="/notes?page=${criteria.get("page")}&done=${criteria.get("filter")}&created=true">Сначала новые</a>
            <span class="btn btn-primary">Сначала старые</span>
        </c:if>

    </div>
    <div class="clearfix mb-5"></div>
    <c:if test="${!empty listNotes}">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Text</th>
                <th>Created Date</th>
                <th>
                    Is Done
                </th>
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
            <tfoot>
            <tr>
                <td colspan="6">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">

                            <li class="page-item <c:if test="${p == 1}">disabled</c:if>"><a class="page-link"
                                                                                            href="/notes?page=${p - 1}&done=${criteria.get("filter")}&created=${criteria.get("sort")}"><i
                                    class="fa fa-chevron-left"></i> Prev</a></li>
                            <c:set var="begin"
                                   value="1"/>
                            <c:set var="end" value="${n / 10 + ((n % 10 > 0) ? 1 : 0) }"/>
                            <c:forEach begin="${begin}" end="${end}" var="page">
                                <li class="page-item <c:if test="${p == page}">active</c:if>"><a class="page-link"
                                                                                                 href="/notes?page=${page}&done=${criteria.get("filter")}&created=${criteria.get("sort")}">${page}</a>
                                </li>
                            </c:forEach>


                            <li class="page-item <c:if test="${p == t}">disabled</c:if>"><a class="page-link"
                                                                                            href="/notes?page=${1 + p}&done=${criteria.get("filter")}&created=${criteria.get("sort")}">Next
                                <i class="fa fa-chevron-right"></i></a></li>
                        </ul>
                    </nav>


                </td>
            </tr>
            </tfoot>
        </table>
    </c:if>
    <p>HQL запрос: ${criteria.get("hql")}</p>
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
