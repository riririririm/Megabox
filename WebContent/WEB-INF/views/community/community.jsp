<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
<c:import url="../temp/header.jsp"></c:import>
<style type="text/css">
.container {
	width: 100%;
	min-height: 1000px;
}

#sub_contents {
	width: 900px;
	min-height: 1000px;
	margin: 90px auto;
	border-left: 1px solid gray;
	border-right: 1px solid gray;
}

#list_result {
	width: 836px;
	min-heigt: 1000px;
	margin: 0 auto;
}

#write_form {
	width: 836px;
	height: 205px;
	padding: 12px 18px 40px 18px;
	margin: 0 auto;
	background: #f2f2f2;
}

.write_area {
	margin: 0 auto;
	width: 800px;
	height: 90px;
	padding: 10px;
}

.write_btn {
	float: right;
}
.content_wrap {
	margin: 0px 15px;

}
.media-body {
	height: 120px;
}

.media-heading {
	width : 836px;
	height : 40px;
	background: #503396;
	letter-spacing: 1px;
	color : white;
	margin-top: 20px;
}

.media-object {
	height: 88px;
}

#buttons {
	float: right;
	margin: 0 15px;
}

.hidden {
	display: none;
}
.modal-title {
	letter-spacing: 1px;
}
#writer {
	float: left;
}
#reg_date{
	float : right;
	}
h5{
	color : white;
	letter-spacing: 1px;
	padding : 0 10px;

}
</style>

<script type="text/javascript">
	$(function() {
		
		$(".write_btn").click(function() {
			var writer="${member.id}";
			var contents=$("#contents").val();
			var num = $("#listNum").val();
			$.get("./communityWrite",{
				writer:writer,
				num:num,
				contents:contents
			}, function(data) {
				data = data.trim();
				if(data=="1"){
					alert("등록 되었습니다.");
				} else if(data.contents==null && writer!=""){
					alert("내용을 입력해주세요.");
				} else if(writer=="") {
					alert("로그인 하세요.");
				} else {
					alert("Fail");
				}
				location.reload();
				
			});
	
		});
		
		$("#contents_null").click(function() {
			alert("로그인 하세요.");
		});
		
		// 수정 - 모달창 띄우기
		
		$("#communityList").on("click", ".update", function () {
			var id=$(this).attr("title");
			var con =$("#c"+id).html();
		
			$("#updateContents").val(con);
			$("#num").val(id);
		});
	/*	
		function getList(count) {
			$.get("./communityList?num=${dto.num}&curPage="+count, function(data) {
				data = data.trim();
				if(count==1) {
					$("#").html(data);
				} else {
					$("#").append(data);
				}
			});
			
		}
		
		*/
		// 모달창 수정 버튼
		$("#updateBtn").click(function() {
			
			var contents = $('#updateContents').val();
			var num = $("#num").val();
			
			$.post("./communityUpdate", {
				contents:contents,
				num:num
			}, function(data) {
				data = data.trim();
				if(data=="1") {
					alert("Success");
					$("#c"+num).html(contents);
				} else {
					alert("Fail");
				}
				
			});
		});
		// 삭제 버튼
		$(".del").click(function() {
			var num = $("#listNum").val();
			var check=confirm("삭제 하시겠습니까?");
			if(check) {
				$.get("./communityDelete?num="+num, function(data) {
					data = data.trim();
					if(data=="1") {
						alert("삭제 되었습니다.");
						location.reload();
					} else {
						alert("Fail");
					}
				});
			}
		});
		
		
		

	});

</script>
</head>

<body>

	<div class="container">
		<div id="sub_contents">
			<div id="list_result">
				<h2>community</h2>
				<div id="write_form">
					<input type="hidden" id="writer" value="${member.id }">
					<p>자유롭게 작성하세요.</p>
					
					<c:if test="${member.id eq null }">
					<textarea rows cols class="write_area" id="contents_null" name="contents" readonly="readonly"> 로그인 후 작성하실 수 있습니다. </textarea>
					</c:if>
					<c:if test="${member.id ne null }">
					<textarea rows cols class="write_area" id="contents" name="contents" ></textarea>
					</c:if>
					<button class="write_btn btn btn-primary">Write</button>
					
					
					


				</div>
				<!-- write_form end -->
				
			<div id="communityList">
				<c:forEach items="${communityList}" var="dto">
					<div class="media" >
						<div class="media-body" >
							<input type="hidden" id="listNum" value="${dto.num }"> 
							<div class="hidden">${dto.num }</div>
							<div class="media-heading">
							<h5 id="writer" >${dto.writer } </h5>
							<h5 id="reg_date">${dto.reg_date }</h5>
							</div>
							
							<div id="c${dto.num }" class="content_wrap">${dto.contents }</div>
						</div>
						<c:if test="${dto.writer eq member.id }">
						<div id="buttons">
							<button type="button" title="${dto.num }" class="update" id="update" data-toggle="modal" data-target="#myModal">수정</button>
							<button class= "del" id="${dto.num }" >삭제 </button>
						</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
			</div>
			
		<div id="pager_wrap">
			<ul class="pager">
				<c:if test="${pager.curBlock gt 1}">
	    		<li class="previous"><a href="./communityList?curPage=${pager.startNum-1}&communityKind=${pager.search.communityKind}&search=${pager.search.search}">Previous</a></li>
	    		</c:if>
	    		<li>
	    			<ul class="pagination">
					   <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					    	<li><a href="./communityList?curPage=${i}&communityKind=${pager.search.communityKind}&search=${pager.search.search}">${i}</a></li>
					    </c:forEach>
					   
					</ul>
	    		
	    		</li>
	    		<c:if test="${pager.curBlock lt pager.totalBlock}">
	    		<li class="next"><a href="./communityList?curPage=${pager.lastNum+1}&communityKind=${pager.search.communityKind}&search=${pager.search.search}">Next</a></li>
	    		</c:if>
	  		</ul>
		</div>
			
		</div>		<!-- list_result end -->
		
	</div>
	<!-- sub_contents end -->

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">${member.id} 수정 Form</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="contents">Contents:</label>
						<textarea class="form-control" rows="6" cols="75" id="updateContents" name="contents"></textarea>
						<input type="hidden" id="num">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" title ="${dto.num }" class="btn btn-default" data-dismiss="modal" id="updateBtn">Update</button>
					<button type="button"  class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>






<c:import url="../temp/footer.jsp" />

</body>
</html>