<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header">LIST</h1>
      <h2>
         <a href="/board/register">Register</a>
      </h2>
   </div>
   <!-- /.col-lg-12 -->
</div>
<!-- /.row -->




<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">
            <select name="search">
               <option value="t" ${pageObj.type == "t" ? "selected":""}>제목</option>
               <option value="w" ${pageObj.type == "w" ? "selected":""}>작성자</option>
               <option value="c" ${pageObj.type == "c" ? "selected":""}>내용</option>
               <option value="tc" ${pageObj.type == "tc" ? "selected":""}>제목+내용</option>
            </select>
            <input name = searchText type="text" value=${pageObj.keyword}>
            <button id = searchBtn>검색</button>
            Board List 
            <select id="select">
               <option value="10" ${pageObj.display == 10 ? "selected":""}>10</option>
               <option value="20" ${pageObj.display == 20 ? "selected":""}>20</option>
               <option value="50" ${pageObj.display == 50 ? "selected":""}>50</option>
               <option value="100" ${pageObj.display == 100 ? "selected":""}>100</option>
            </select> 
         </div>
         <!-- /.panel-heading -->
         </div>
               
            
         <div class="panel-body">
            <div class="table-responsive">
               <table class="table table-striped table-bordered table-hover">
                  <thead>
                     <tr>
                        <th>TNO</th>
                        <th>TITLE</th>
                        <th>WRITER</th>
                        <th>REGDATE</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${list}" var="board">
                        <tr>
                           <td><c:out value="${board.bno}" /></td>
                           <td><a href='${board.bno}' class='board'><c:out value="${board.title}" /></a></td>
                           <td><c:out value="${board.writer}" /></td>
                           <td><fmt:formatDate value="${board.regdate}"
                                 pattern="yyyy-MM-dd HH:mm:ss " /></td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
            <!-- /.table-responsive -->
         </div>
         <!-- /.panel-body -->
      </div>
      <!-- /.panel -->
   </div>
   <!-- /.col-lg-6 -->

   <div class="col-sm-12">
      <div class="dataTables_paginate paging_simple_numbers"
         id="dataTables-example_paginate">
         <ul class="pagination">
         <c:if test="${pageObj.prev}">
            <li class="paginate_button previous disabled"
               aria-controls="dataTables-example" tabindex="0"
               id="dataTables-example_previous"><a href="${pageObj.start -1}">Previous</a></li>
            </c:if>
            
            <c:forEach begin="${pageObj.start }" end="${pageObj.end }" var="num" >
               <li class="paginate_button" data-page="${num}"
                  aria-controls="dataTables-example" tabindex="0"><a href="${num}"><c:out value="${num}"/></a></li>
            </c:forEach>
         
            <c:if test="${pageObj.next}">   
            <li class="paginate_button next" aria-controls="dataTables-example"
               tabindex="0" id="dataTables-example_next"><a href="${pageObj.end + 1}">Next</a></li>
            </c:if>
               
         </ul>
      </div>
   </div>
   
<form id='actionForm'>
   <input type='hidden' name='page' id='page' value='${pageObj.page}'>
   <input type='hidden' name='display' id='display' value='${pageObj.display}'>
  <input type='hidden' name='type' value='${pageObj.type}'>
  <input type='hidden' name='keyword' value='${pageObj.keyword}'>
</form>

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

   <script>
      $(document).ready(function() {

         var actionForm = $("#actionForm");
         var pageNum = ${pageObj.page};
         
         //게시판 제목 클릭하기
         $(".board").on("click",function(e){
            e.preventDefault();
            var bno = $(this).attr("href");
            actionForm.append("<input type='hidden' name='bno' value='"+bno+"'>");
            actionForm.attr("action", "/board/read")
            .attr("method", "get").submit();

         });
         
         //버튼 활성화
         $('.pagination li[data-page='+pageNum+']').addClass=("active");
            
         //버튼 클릭
         $('.pagination li a').on("click", function(e){
            
            e.preventDefault();
            var target = $(this).attr("href");
            console.log(target);
            $("#page").val(target);

            actionForm.attr("action", "/board/list")
            .attr("method", "get").submit();
            
         });
             
         //selectbox 코드
         $('#select').change(function(e){
            
           e.preventDefault();
           
             var display = $(this).val();
           $("#display").val(display);
           
            actionForm.attr("action", "/board/list")
            .attr("method", "get").submit();
            
         });
         
       //searchbox 코드
		$("#searchBtn").on("click", function(e){
			
			var searchTypeValue = $("select[name='search'] option:selected").val();
			console.log(searchTypeValue);
			
			var searchKeyword = $("input[name='searchText']").val();
			console.log(searchKeyword);
			
			if(searchKeyword.trim().length == 0 ){
				alert("검색어 없음");
				return;
			}
			
			actionForm.attr("action","/board/list");
			actionForm.find("input[name='type']").val(searchTypeValue);
			actionForm.find("input[name='keyword']").val(searchKeyword);
			$("#page").val(1);
			
			actionForm.submit();
		});
         
         var msg = $("#myModal");
         var result = '<c:out value="${result}"/>';

         checkModal(result);
         history.replaceState({}, null, null);
         
         function checkModal(result){
            
            if(result === ''||history.state){
               return;
            }
            
            if (result === 'success') {
                 $(".modal-body").html("작업 성공");
                 msg.modal("show");
         }
         
      }
         
    });

   </script>
   


</body>

</html>