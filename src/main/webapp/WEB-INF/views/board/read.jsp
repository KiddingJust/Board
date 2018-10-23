<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title'
						value='<c:out value="${board.title}"/>' readonly="readonly">
						<p class="help-block">Example block-level help text here.</p>
					</div>
					
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='writer'
						value='<c:out value="${board.writer}"/>' readonly="readonly">
						<p class="help-block">Example block-level help text here.</p>
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name='content' readonly><c:out value="${board.content}"/></textarea>
					</div>
					
					<form role="form" action="/board/list" method="get">
						<input type='hidden' name='page' value='${pageObj.page}'>
					    <input type='hidden' name='display' id='display' value='${pageObj.display}'>
					    <input type='hidden' name='type' value='${pageObj.type}'>
					    <input type='hidden' name='keyword' value='${pageObj.keyword}'>
						<button type="submit" class="btn btn-default">Go List</button>
					</form>
					<form role="form" action="/board/modify" method="get">
						<input type='hidden' name='page' value='${pageObj.page}'>
						<input type='hidden' name='display' id='display' value='${pageObj.display}'>
					    <input type='hidden' name='type' value='${pageObj.type}'>
					    <input type='hidden' name='keyword' value='${pageObj.keyword}'>
						<input type='hidden' name='bno' value='${pageObj.bno}'>
						
						<button type="submit" class="btn btn-default">Modify</button>
					</form>
					
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
	

<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	<%@include file="../includes/footer.jsp"%>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		var msg = $("#myModal");
		var result = '<c:out value="${result }"/>';

		checkModal(result);
		history.replaceState({}, null, null);

		function checkModal(result) {
		if(result === '' || history.state) {
			return;
		}
		
		if (result === 'SUCCESS') {
			$(".modal-body").html("작업 성공");
			msg.modal("show");
		}
		}
	});
	</script>

	</body>

	</html>