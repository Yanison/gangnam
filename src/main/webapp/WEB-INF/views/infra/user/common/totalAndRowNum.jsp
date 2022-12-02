<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="container-fluid px-0 mt-2">
    <div class="row">
        <div class="col-9 col-md-10 col-xl-11 text-start pt-1">
<c:choose>
	<c:when test="${not empty vo.totalRows}">        
            <span class="align-middle">댓글 <fmt:formatNumber value="${vo.totalRows}" pattern="#,###"/></span>
	</c:when>
	<c:otherwise>            
			<span class="align-middle">댓글 0</span>
	</c:otherwise>
</c:choose>
        </div>
    </div>
</div>