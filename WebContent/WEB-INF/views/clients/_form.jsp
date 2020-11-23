<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="client_date">日付</label><br />
<input type="date" name="client_date" value="<fmt:formatDate value='${client.client_date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">氏名</label><br />
<c:out value="${sessionScope.login_employee.name}" />
<br /><br />

<label for="title">会社名</label><br />
<input type="text" name="company_name" value="${client.company_name}" />
<br /><br />

<label for="content">商談内容</label><br />
<textarea name="content" rows="10" cols="50">${client.content}</textarea>
<br /><br />

<label for="status_flag">商談状況</label><br />
<select name="status_flag">
    <option value="0"<c:if test="${client.status_flag == 0}"> selected</c:if>>見積</option>
    <option value="1"<c:if test="${client.status_flag == 1}"> selected</c:if>>提案</option>
    <option value="2"<c:if test="${client.status_flag == 2}"> selected</c:if>>商談</option>
    <option value="3"<c:if test="${client.status_flag == 3}"> selected</c:if>>受注</option>
</select>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>