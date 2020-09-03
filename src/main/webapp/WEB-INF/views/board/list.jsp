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
            <h1>Board List Page</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Board List Page</li>
            </ol>
          </div>
        </div>
        <div class="row mb-2">
         	<div class="col-sm-12">
         		<ol class="breadcrumb float-sm-right">
      				<li><button id='regBtn' type="button" class="btn btn-primary btn-xs breadcrumb-item">Register New Board</button></li>
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
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>
						<c:forEach items="${list}" var="board">
							<tr>
								<td><c:out value="${board.bno}"/></td>
								<td>
									<a href='/board/get?bno=<c:out value="${board.bno}"/>'>
										<c:out value="${board.title}"/>
									</a>
								</td>
								<td><c:out value="${board.writer}"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
							</tr>
						</c:forEach>
					</table>
					<!-- 페이징  -->
					<div class="pull-right">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous">
									<a href="${pageMaker.startPage -1}">Previous</a>
								</li>
							</c:if>
							
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="paginate_button"><a href="${num}">${num}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next}">
								<li class="paginate_button next">
									<a href="${pageMaker.endPage +1}">Next</a>
								</li>
							</c:if>
						</ul>
					</div>
					<!-- end Pagination -->
					
					<!-- Modal 추가 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					     aria-labelledby="myModalLabel" aria-hidden="true">
					     <div class="modal-dialog">
					     	<div class="modal-content">
					     		<div class="modal-header">
					     			<h4 class="modal-title" id="myModalLabel">Modal title</h4> 
					     			<button type="button" class="close" data-dismiss="modal"
					     			        aria-hidden="true">&times;</button>      
					     		</div>
					     		<div class="modal-body">처리가 완료되었습니다.</div>
					     		<div class="modal-footer">
					     			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Save changes</button>
					     		</div>
					     	</div>
					     </div>
					</div>
				</div>
				<!-- /. panel-body -->
			</div>
			<!-- /. col-lg-12 -->
		</div>
		<!-- /. row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <form id="actionForm" action="/board/list" method="get">
  	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
  	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
  </form>
  <!-- /.content-wrapper -->
  <script type="text/javascript">
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';
	
		checkModal(result);
		
		history.replaceState({},null,null);
		
		function checkModal(result){
			if(result === '' || history.state){
				return;
			}
			
			if(parseInt(result) > 0){
				$(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}
			
			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click", function(){
			self.location = "/board/register";
		});
		
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();
			
			console.log('click');
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		});
	});
  </script>
<%@include file="../includes/footer.jsp" %>
