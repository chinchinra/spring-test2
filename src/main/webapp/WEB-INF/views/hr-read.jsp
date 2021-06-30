
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@include file="template/header.jsp"%>





<script type="text/javascript">
	$(function() {
		$('#btn_update')
				.click(
						function() {
							window.location.href = "/updatePage?employee_id=${member.employee_id}";
						});

	});
</script>

</head>

<body>


	<div class="container">

		<h2 class="pt-3">인사관리시스템</h2>
		<hr>

		<ul class="nav">
			<li class="nav-item"><a class="nav-link active" href="/">사원목록</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
			</li>
		</ul>

		<hr>

		<div class="col-lg-12 well">
			<div class="row">
				<!--  	<form role="form" action="/update" method="get"> -->
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-6 form-group">
							<label>성명</label> <input type="text" id="name" name="name"
								value="${member.name}" class="form-control">
						</div>
						<div class="col-sm-6 form-group">
							<label>주민번호</label> <input type="text" id="reg_no" name="reg_no"
								value="${member.reg_no}" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label>주소</label>
						<textarea id="address" name="address" rows="3"
							class="form-control">${member.address}</textarea>
					</div>
					<div class="row">
						<div class="col-sm-4 form-group">
							<label>입사일</label> <input type="text"
								value="<fmt:formatDate value="${member.hire_date}" 
										pattern="yyyy-MM-dd" />"
								class="form-control">

						</div>

						<div class="col-sm-4 form-group">
							<label for="exampleFormControlSelect1">부서명</label> <select
								class="form-control" id="exampleFormControlSelect1">

								<c:forEach items="${departmentsList}" var="departmentsList">
									<c:choose>
										<c:when
											test="${departmentsList.department_id eq member.department_id}">
											<option value="${departmentsList.department_id}"
												selected="selected">${departmentsList.department_name}</option>
										</c:when>
										<c:when
											test="${departmentsList.department_id ne  member.department_id}">
											<option value="${departmentsList.department_id}">${departmentsList.department_name}</option>
										</c:when>
									</c:choose>
								</c:forEach>

							</select>
						</div>
						<div class="col-sm-4 form-group">
							<label>퇴사일</label> <input type="text"
								value="<fmt:formatDate value="${member.leave_date}" 
										pattern="yyyy-MM-dd" />"
								class="form-control">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4 form-group">
							<label for="exampleFormControlSelect1">급여은행</label> <select
								class="form-control" id="exampleFormControlSelect1">
								<c:forEach items="${banksList}" var="banksList">
									<c:choose>
										<c:when test="${banksList.bank_id eq member.bank_id}">
											<option value="${banksList.bank_id}" selected="selected">${banksList.bank_name}</option>
										</c:when>
										<c:when test="${banksList.bank_id ne  member.bank_id}">
											<option value="${banksList.bank_id}">${banksList.bank_name}</option>
										</c:when>
									</c:choose>
								</c:forEach>
							</select>
						</div>

						<div class="col-sm-8 form-group">
							<label>급여계좌</label> <input type="text" re
								value="${member.bank_account}" id="bank_account"
								name="bank_account" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label>전화번호</label> <input type="text"
							value="${member.phone_number}" id="phone_number"
							name="phone_number" class="form-control">
					</div>
					<div class="form-group">
						<label>Email </label> <input type="text" value="${member.email}"
							id="email" name="email" class="form-control">
					</div>
					<button type="button" id="btn_update" class="btn btn btn-dark mt-3">업데이트</button>
				</div>
				<!--  	</form> -->
			</div>
		</div>


	</div>
</body>

</html>
