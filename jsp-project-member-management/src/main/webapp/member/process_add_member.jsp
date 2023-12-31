<%--
  회원 가입 기능 코드
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
  request.setCharacterEncoding("UTF-8");

  String id = request.getParameter("id");
  String password = request.getParameter("password");
  String name = request.getParameter("name");
  String gender = request.getParameter("gender");
  String year = request.getParameter("birthyy");
  String month = request.getParameterValues("birthmm")[0];
  String day = request.getParameter("birthdd");
  String birth = year + "/" + month + "/" + day;;
  String mail1 = request.getParameter("mail1");
  String mail2 = request.getParameterValues("mail2")[0];
  String email = mail1 + "@" + mail2;
  String phone = request.getParameter("phone");
  String address = request.getParameter("address");
%>

<sql:setDataSource
        var="dataSource"
        url="jdbc:mysql://localhost:3306/member_management"
        driver="com.mysql.cj.jdbc.Driver"
        user="root"
        password="1234"
/>

<sql:update dataSource="${dataSource}" var="resultSet">
  INSERT INTO member_management (id, password, name, gender, birth, email, phone, address, created_at)
  VALUES (?, ?, ?, ?, ?, ?, ?, ?, now())
  <sql:param value="<%=id%>" />
  <sql:param value="<%=password%>" />
  <sql:param value="<%=name%>" />
  <sql:param value="<%=gender%>" />
  <sql:param value="<%=birth%>" />
  <sql:param value="<%=email%>" />
  <sql:param value="<%=phone%>" />
  <sql:param value="<%=address%>" />
</sql:update>

<c:if test="${resultSet>=1}">
  <c:redirect url="result_member.jsp?msg=1" />
</c:if>

