<%--
  회원 수정 뷰 코드
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <title>회원 수정</title>
</head>
<body>
<jsp:include page="../inc/header.jsp" />

<%
    String sessionId = (String) session.getAttribute("sessionMemberId");
%>

<%@ include file="../inc/dbconn_jstl.jsp" %>

<sql:query var="resultSet" dataSource="${dataSource}">
    SELECT * FROM member_management WHERE ID = ?
    <sql:param value="<%=sessionId%>"/>
</sql:query>


<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">회원 수정</h1>
    </div>
</div>
<c:forEach var="row" items="${resultSet.rows}">
    <c:set var="mail" value="${row.mail}"/>
    <c:set var="mail1" value="${mail.split('@')[0]}"/>
    <c:set var="mail2" value="${mail.split('@')[1]}"/>

    <c:set var="birth" value="${row.birth}"/>
    <c:set var="year" value="${birth.split('/')[0]}"/>
    <c:set var="month" value="${birth.split('/')[1]}"/>
    <c:set var="day" value="${birth.split('/')[2]}"/>

    <div class="container">
        <form name="newMember" class="form-horizontal" action="process_update_member.jsp" method="post">
            <div class="form-group row">
                <label class="col-sm-2 ">아이디</label>
                <div class="col-sm-3">
                    <input name="id" type="text" class="form-control" placeholder="id"
                           value="<c:out value='${row.id}' />" readonly>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">비밀번호</label>
                <div class="col-sm-3">
                    <input name="password" type="text" class="form-control" placeholder="password"
                           value="<c:out value='${row.password}' />">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">비밀번호확인</label>
                <div class="col-sm-3">
                    <input name="password_confirm" type="text" class="form-control" placeholder="password confirm">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">성명</label>
                <div class="col-sm-3">
                    <input name="name" type="text" class="form-control" placeholder="name"
                           value="<c:out value='${row.name}' />">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">성별</label>
                <div class="col-sm-10">
                    <input name="gender" type="radio" value="남"
                    <c:if test="${gender.equals('남')}">
                        <c:out value="checked"/>
                    </c:if> > 남
                    <input name="gender" type="radio" value="여"
                    <c:if test="${gender.equals('여')}">
                        <c:out value="checked"/>
                    </c:if> > 여
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">생일</label>
                <div class="col-sm-4  ">
                    <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" value="${year}">
                    <select name="birthmm">
                        <option value="">월</option>
                        <option value="01">1</option>
                        <option value="02">2</option>
                        <option value="03">3</option>
                        <option value="04">4</option>
                        <option value="05">5</option>
                        <option value="06">6</option>
                        <option value="07">7</option>
                        <option value="08">8</option>
                        <option value="09">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select> <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" value="${day}">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">이메일</label>
                <div class="col-sm-10">
                    <input type="text" name="mail1" maxlength="50" value="${mail1}">@
                    <select name="mail2">
                        <option>naver.com</option>
                        <option>daum.net</option>
                        <option>gmail.com</option>
                        <option>nate.com</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2">전화번호</label>
                <div class="col-sm-3">
                    <input name="phone" type="text" class="form-control" placeholder="phone"
                           value="<c:out value='${row.phone}'/>">
                </div>
            </div>
            <div class="form-group  row">
                <label class="col-sm-2 ">주소</label>
                <div class="col-sm-5">
                    <input name="address" type="text" class="form-control" placeholder="address"
                           value="<c:out value='${row.address}'/>">
                </div>
            </div>
            <div class="form-group  row">
                <div class="col-sm-offset-2 col-sm-10 ">
                    <input type="submit" class="btn btn-primary " value="회원수정">
                    <a href="process_delete_member.jsp" class="btn btn primary">회원탈퇴</a>
                </div>
            </div>
        </form>
    </div>
</c:forEach>
<jsp:include page="../inc/footer.jsp" />
</body>
</html>
