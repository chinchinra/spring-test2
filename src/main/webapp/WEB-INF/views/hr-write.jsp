
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
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
<title>인사관리 시스템</title>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->




<style>
.pagination {
	justify-content: center;
}

.table td, .table th {
	vertical-align: middle;
	text-align: center;
}

.custom-control {
	padding-right: 0
}
</style>


<script type="text/javascript">
	$(function() {

		$("#btn_save").on("click", function() {

			if ($("#name").val() == "") {
				alert("아이디 입력바람");
				$("#name").focus();
				return false;
			}
			if (aaa() == false) {
				return false;
			}

			//alert($("#bank_id").val());

			$.ajax({

				type : "POST",
				//json으로 보낸다
				contentType : 'application/json; charset=utf-8',
				//여기로 보낸다. server에!
				url : "/write",
				//data를 담아서 보낸다,address라는 key를 인식할 수 있도록!
				data : JSON.stringify({
					"name" : $("#name").val(),
					"reg_no" : $("#reg_no").val(),
					"address" : $("#address").val(),
					"department_id" : $("#department_id").val(),
					"bank_id" : $("#bank_id").val(),
					"bank_account" : $("#bank_account").val(),
					"phone_number" : $("#phone_number").val(),
					"email" : $("#email").val()

				}),
				//성공했다면 data에 값이 담겨져 오는데 여기서는 int
				success : function(data) {
					alert("success");
					location.href = "/";
				}
			}).done(function(data) {
				//alert("success");
			});

		});

	});

	function aaa() {

		var reg_no = $("#reg_no").val();
		//주민등록번호 전달

		var fmt = RegExp(/^\d{6}[1234]\d{6}$/) //포멧 설정
		var buf = new Array(13);

		//주민번호 유효성 검사
		if (!fmt.test(reg_no)) {
			alert("주민등록번호 형식에 맞게 입력해주세요");
			$("#reg_no").focus();
			return false;
		}

		//주민번호 존재 검사
		for (var i = 0; i < buf.length; i++) {
			buf[i] = parseInt(reg_no.charAt(i));
		}
		var multipliers = [ 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5 ];// 밑에 더해주는 12자리 숫자들 
		var sum = 0;

		for (var i = 0; i < 12; i++) {
			sum += (buf[i] *= multipliers[i]);// 배열끼리12번 돌면서 
		}
		if ((11 - (sum % 11)) % 10 != buf[12]) {
			alert("잘못된 주민등록번호 입니다.");
			$("#reg_no").focus();
			return false;
		}

	}
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
				<form role="form" method="post" action="write">
					<div class="col-sm-12">
						<div class="row">

							<div class="col-sm-6 form-group">
								<label>성명</label> <input type="text" id="name" name="name" val
									class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<label>주민번호</label> <input type="text" id="reg_no" name="reg_no"
									placeholder="주민번호" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label>주소</label>
							<textarea placeholder="주소" id="address" name="address" rows="3"
								class="form-control"></textarea>
						</div>
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>입사일</label> <input type="text" placeholder="입사일"
									class="form-control">
							</div>

							<div class="col-sm-4 form-group">
								<label for="exampleFormControlSelect1">부서명</label> <select
									class="department_id" id="department_id">

									<c:forEach items="${departmentsList}" var="departmentsList">
										<option value="${departmentsList.department_id}">${departmentsList.department_name}</option>
									</c:forEach>

								</select>
							</div>
							<div class="col-sm-4 form-group">
								<label>퇴사일</label> <input type="text" placeholder="퇴사일"
									class="form-control">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4 form-group">
								<label for="exampleFormControlSelect1">급여은행</label> <select
									class="bank_id" id="bank_id">

									<c:forEach items="${banksList}" var="banksList">
										<option value="${banksList.bank_id}">${banksList.bank_name}</option>
									</c:forEach>

								</select>
							</div>

							<div class="col-sm-8 form-group">
								<label>급여계좌</label> <input type="text" placeholder="급여계좌"
									id="bank_account" name="bank_account" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label>전화번호</label> <input type="text" placeholder="전화번호"
								id="phone_number" name="phone_number" class="form-control">
						</div>
						<div class="form-group">
							<label>Email </label> <input type="text" placeholder="Email"
								id="email" name="email" class="form-control">
						</div>
						<button type="button" id="btn_save" class="btn btn btn-dark mt-3">저장</button>
					</div>
				</form>

			</div>
		</div>


	</div>


</body>

</html>
