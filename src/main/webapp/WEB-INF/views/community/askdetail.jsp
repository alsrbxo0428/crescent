<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap.min.css -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<!--custom.css-->
<link href="/resources/css/custom.css" rel="stylesheet">
<!--jquery.min.js-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>CRESCENT MOON</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/cm_icon.png">
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
        
    <nav>
        <div class="container">
            <ul class="nav nav-tabs nav-justified" id="nav">
                <li class="nav-item"><a class="nav-link" href="/community/notice">공지사항</a></li>
                <li class="nav-item"><a class="nav-link" href="/product/list">전체상품</a></li>
                <li class="nav-item"><a class="nav-link active" href="/community/">커뮤니티</a></li>
                <li class="nav-item">
                    <div class="input-group">
                        <input class="form-control" type="text" id="search">
                        <div class="input-group-append">
                            <button type="button"class="input-group-text" id="searchBtn"><img src="/resources/icon/search.svg"></button>
                        </div>
                    </div>
                </li>
            </ul><!-- ul nav end -->
        </div><!-- div container end -->
    </nav><!-- nav end -->
    
    <div class="container">
        <div class="row my-3">
            <h1 class="col-md-6 align-self-center"><strong>QnA 상세</strong></h1>
            <div class="col-md-6 align-self-center text-right">
                <a href="/crescent">홈</a>
                <a href="#">-</a>
                <a href="/community/">커뮤니티</a>
            </div>
        </div><!-- div row end -->
        
        <div class="row">
            <div class="col-md-12" id="title">
                
            </div>
        </div><!-- div row end -->
        
        <div class="row">
            <div class="col-md-6" id="writer">
            	
            </div>
        </div><!-- div row end -->
        
        <hr>

        <div class="row">
        	<div class="col-md-12" id="content">
                
            </div>
        </div>

        <form action="/community/askmodify" method="post">
	        <div class="row">
	        	<div class="col-md-12 text-right my-3" id="modAndDel">
	                <a href="/community/" class="btn btn-primary"><h4 id="h4Btn">목록으로</h4></a>
	            </div>
	        </div><!-- div row end -->
        </form>
    </div><!-- div container end -->
    
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    
    <!--bootstrap.min.js-->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- search.js -->
    <script src="/resources/js/search.js"></script>
    
    <script type="text/javascript">
    	$(document).ready(function() {
			var qno = ${qno};
			
	   		function getDetail() {
				$.getJSON("/qna/" + qno, function(data) {
					
					var title = "";
					var writer = "";
					var content = "";
					
					var timestamp = data.qwritedate;
					var date = new Date(timestamp);
					var formattedTime = date.getFullYear() + "/" + (date.getMonth()+1) + "/" + date.getDate();
					
					title += "<h2>" + data.qtitle + "</h2>";
					writer += "<h5>작성자 : " + data.mid + "</h5>"
							+ "<h5>작성일자 : " + formattedTime + "</h5>";
					content += "<h4>" + data.qcontent + "</h4>";
					
					$("#title").html(title);
					$("#writer").html(writer);
					$("#content").html(content);
					
					$("#qtitle").attr("value", data.qtitle);
					$("#mno").attr("value", data.mno);
					$("#qcontent").attr("value", data.qcontent);
					
					if(data.mid === "${login.mid}") {
						$("#modAndDel").html(
								"<input type='hidden' id='qno' name='qno' value='" + qno + "'>"
								+ "<button type='submit' class='btn btn-success'><h4 id='h4Btn'>수정하기</h4></button>"
		            			+ "<button type='button' class='btn btn-danger mx-2' id='delBtn'><h4 id='h4Btn'>삭제하기</h4></button>"
		            			+ "<a href='/community/' class='btn btn-primary'><h4 id='h4Btn'>목록으로</h4></a>");
					}//if
					
				});//getJSON
			}//getDetail
			getDetail();
			
			//delBtn
			$("#modAndDel").on("click", "#delBtn", function() {
				$.ajax({
					type : 'delete',
					url : '/qna/' + qno,
					success : function(result) {
						console.log("왜 작동안하지?");
						if (result === "SUCCESS") {
							alert("성공적으로 삭제하였습니다.");
							location.href="/community/";
						}
					}
				});//ajax
			});//delBtn
			
		});//ready
    </script>
</body>
</html>