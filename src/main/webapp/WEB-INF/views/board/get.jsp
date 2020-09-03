<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Board Read Page</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Board Read Page</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<!-- <div class="panel-heading">Board Register</div> -->
					<div class="panel-body">
							
							<div class="form-group">
								<label>Bno</label>
								<input class="form-control" name='bno'
								       value='<c:out value="${board.bno}"/>' readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>Title</label>
								<input class="form-control" name="title"
									   value='<c:out value="${board.title}"/>' readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>Text area</label>
								<textarea class="form-control" rows="3" name="content" 
								          readonly="readonly"><c:out value="${board.content}"/></textarea>
							</div>
							
							<div class="form-group">
								<label>Writer</label> 
								<input class="form-control" name="writer"
								       value='<c:out value="${board.writer}"/>' readonly="readonly">
							</div>
							
							<button data-oper='modify' class="btn btn-primary">Modify</button>
							
							<button data-oper='list' class="btn btn-info">List</button>
							        
							<form id="operForm" action="/board/modify" method="get">
								<input type="hidden" id="bno" name="bno" value="<c:out value='${board.bno}'/>"> 
							</form>        
					</div>
				</div>
			</div>
			<!-- /. col-lg-12 -->
		</div>
		<!-- /. row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <script>
  //data-oper 속성을 이용한 기능 동작 처리
	$(document).ready(function(){
		var operForm = $("#operForm");
		
		$('button[data-oper="modify"]').on("click", function(e){
			operForm.attr("action", "/board/modify").submit();
		});
		
		$('button[data-oper="list"]').on("click", function(e){
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list").submit();
		});
	});
  </script>
<%@include file="../includes/footer.jsp" %>