
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<title>인사관리 시스템</title>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>





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
											<option selected="selected">${departmentsList.department_name}</option>
										</c:when>
										<c:when
											test="${departmentsList.department_id ne  member.department_id}">
											<option>${departmentsList.department_name}</option>
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
											<option selected="selected">${banksList.bank_name}</option>
										</c:when>
										<c:when test="${banksList.bank_id ne  member.bank_id}">
											<option>${banksList.bank_name}</option>
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
