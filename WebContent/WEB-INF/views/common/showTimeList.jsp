<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:forEach items="${show_times}" var="st">
	<li class="show_time" title="${st.auditorium }" name="${st.sar }">[${st.auditorium}]${st.sar }</li>
</c:forEach>