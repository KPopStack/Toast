<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>Toast 3기 사전과제</title>

<!-- 부트스트랩 101 템플릿-->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<jsp:scriptlet>
pageContext.setAttribute("newline", "\n");
</jsp:scriptlet>
   
</head>
<body>

	<div class="container">
		<div class="page-header">
			<h3>방명록</h3>
			<form class="form-horizontal" id="frmPosting"
				action="<c:url value='/insertGuestBook.do' />" method="post">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-4">
						<input type="email" class="form-control" id="inputEmail"
							name="email" placeholder="Email">
					</div>

					<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="inputPassword"
							name="passwd" placeholder="Password">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<textarea class="form-control" rows="3" name="content"></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">쓰기</button>
					</div>
				</div>
			</form>
		</div>
		<div class="panel-group">
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="row">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="row">
									<div class="col-sm-10">${row.email}</div>
									<div class="btn-group btn-group-xs col-sm-2">
										<input type="hidden" id="EMAIL" value="${row.email }">
										<input type="hidden" id="CONTENTS" value="${row.contents }">
										</td>
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#myModal"
											data-whatever=${row.idx }>수정</button>
										<button type="button" class="btn btn-primary">삭제</button>
									</div>
								</div>
							</div>
							<div class="panel-body">${fn:replace(row.contents, newline, "<br/>")} </div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="panel panel-default">
						<div class="panel-body">작성된 글이 없습니다.</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


	<div class="modal fade" role="dialog" id="myModal"
		aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">수정하기</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<form class="form-horizontal" id="frmUpdate"
							action="<c:url value='/updateGuestBook.do' />" method="post">
							<div class="form-group">
								<input type="hidden" id="updateIDX" name="idx" />
								<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
								<div class="col-sm-4">
									<input type="email" class="form-control" id="updateEmail" disabled>
								</div>

								<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
								<div class="col-sm-4">
									<input type="password" class="form-control" id="updatePassword"
										name="passwd" placeholder="Password">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<textarea class="form-control" rows="3" name="contents" id="updateContents"></textarea>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="updateConfirm">Save
						changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/common.js"></script>

	<script>
		$('#myModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var idx = button.data('whatever') // Extract info from data-* attributes
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var email = button.parent().find("#EMAIL").val()
			var contents = button.parent().find("#CONTENTS").val()
			var modal = $(this)
			modal.find('#updateIDX').val(idx)
			modal.find('#updateEmail').val(email)
			modal.find('#updateContents').text(contents)
			//modal.find('.modal-title').text('New message to ' + recipient)
			//modal.find('.modal-body input').val(recipient)
		})

		$("#updateConfirm").on("click", function(e) { //글쓰기 버튼
			e.preventDefault()
			$("#frmUpdate").submit()
		});

		$("#frmPosting").submit(function(event) {
			var email = $('#inputEmail').val()

			if (!email_check(email)) {
				alert('잘못된 형식의 이메일 주소입니다.')
				event.preventDefault()
			}
		});
	</script>

</body>
</html>

