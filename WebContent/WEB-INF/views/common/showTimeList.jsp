<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:forEach items="${show_times}" var="st">
	<li>[${st.auditorium}]<span class="show_time" title="${st.auditorium }">${st.sar }</span></li>
</c:forEach>