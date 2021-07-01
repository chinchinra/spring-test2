
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@include file="template/header.jsp"%>

<script type="text/javascript">
	$(function() {
		$('#btn_write').click(function() {
			window.location.href = "/writePage";
		});

		var formObj = $("form[name='readForm']");
		$('#btn_delete').click(function() {
			
			
			var nu = $("input:checkbox[name=vehicle1]:checked").length
			alert(nu);
			
			formObj.attr("action", "/deleteList");
			formObj.attr("method", "post");
			formObj.submit();

		});

	});
</script>

</head>

<body>


	<div class="container">


		<h2 class="pt-3">인사관리시스템</h2>
		<hr>

		<ul class="nav">
			<li class="nav-item"><a class="nav-link active" href="#">사원목록</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
			</li>
		</ul>

		<hr>

		<div class="card border-0">
			<div class="card-body">

				<!-- Search form -->
				<form
					class="form-inline d-flex justify-content-center md-form form-sm active-cyan-2 mt-2">


					<!-- Material inline 1 -->
					<div class="form-check form-check-inline">
						<input type="radio" class="form-check-input" id="materialInline1"
							name="inlineMaterialRadiosExample" checked="checked" > <label
							class="form-check-label" for="materialInline1">전체</label>
					</div>

					<!-- Material inline 2 -->
					<div class="form-check form-check-inline">
						<input type="radio" class="form-check-input" id="materialInline2"
							name="inlineMaterialRadiosExample"> <label
							class="form-check-label" for="materialInline2">근무자</label>
					</div>

					<!-- Material inline 3 -->
					<div class="form-check form-check-inline">
						<input type="radio" class="form-check-input" id="materialInline3"
							name="inlineMaterialRadiosExample"> <label
							class="form-check-label" for="materialInline3">퇴사자</label>
					</div>



					<input class="form-control form-control-sm mr-3 ml-3" type="text"
						placeholder="성명" aria-label="Search"> <i
						class="fas fa-search" aria-hidden="true"></i>
				</form>
			</div>
		</div>



		<div class="table-responsive-xl">
			<form method="post" name="readForm">
				<table class="table table-hover table-striped table-bordered"
					id="table_check">
					<thead class="thead-dark">
						<tr>
							<th scope="col">선택</th>
							<th scope="col">사원번호</th>
							<th scope="col">성명</th>
							<th scope="col">주민번호</th>
							<th scope="col">부서명</th>

							<th scope="col">입사일</th>
							<th scope="col">퇴사일</th>
							<th scope="col">Email</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list">
							<fmt:formatNumber var="licsNo" value="${list.reg_no}"
								pattern="000000,0000000" />
							<tr>
								<td><input type="checkbox" id="vehicle1" name="vehicle1"
									value="${list.employee_id}"></td>
								<td><c:out value="${list.employee_id}" /></td>

								<td><a href="/readPage?employee_id=${list.employee_id}"><c:out
											value="${list.name}" /></a></td>
								<td><c:out value="${fn:replace(licsNo, ',', '-')}" /></td>

								<c:forEach items="${departmentsList}" var="departmentsList">
									<c:if
										test="${list.department_id eq departmentsList.department_id}">
										<td><c:out value="${departmentsList.department_name}" /></td>
									</c:if>
								</c:forEach>
								<td><fmt:formatDate value="${list.hire_date}"
										pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${list.leave_date}"
										pattern="yyyy-MM-dd" /></td>
								<td><c:out value="${list.email}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>

		</div>

		<div class="card border-0">
			<div class="card-body">
				<nav aria-label="Page navigation">
					<ul class="pagination pagination-circle pg-blue">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="/${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>
						<!--숫자 출력 begin 에서 end 까지 정수 idx값으로 출력 ex) 0 ,3이라면  0123  -->

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li class="page-item"><a class="page-link"
								href="/${pageMaker.makeQuery(idx)}">${idx}</a></li>
						</c:forEach>
						<!-- 왜 이전페이지는 pageMaker.endPage > 0 없는데 될까 -->
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="/${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>

				</nav>
			</div>
		</div>




		<div class="card border-0">
			<div class="card-body pl-0 pt-0">
				<!-- <div class="btn-group" role="group" aria-label="buttons"> -->
				<button type="button" id="btn_write" class="btn btn-dark mr-3">추가</button>
				<button type="submit" id="btn_delete" class="btn btn-dark">삭제</button>
				<!-- </div> -->
			</div>
		</div>
	</div>


</body>

</html>
