<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">
<head>

<script data-ad-client="ca-pub-3843225232663919" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">

<title>쓰잘데기</title>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="/main?category=best"><img src="/images/trash2.png" alt="..." class="img-thumbnail mr-2">쓰잘데기</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="/main?category=recm">추천</a></li>
				<li class="nav-item"><a class="nav-link" href="/articles">자유게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=best">베스트</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=xart">조공 모음</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=news">뉴스 모음</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=itct">IT 소식</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=movi">영화 소식</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=socc">축구 소식</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=base">야구 소식</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=girl">여성 시대</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=shop">쇼핑 모음</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=stoc">주식 추천</a></li>
				<li class="nav-item"><a class="nav-link" href="/main?category=devp">개발자</a></li>
			</ul>
			
		</div>
	</nav>

	<div class="my-3 p-3 bg-white rounded shadow-sm">
      <h6 class="border-bottom border-gray pb-2 mb-0 font-weight-bold text-primary"><a href="/main?category=${category}">[${cName}]</a></h6>
      <c:forEach var="ct" begin="0" end="20" items="${contents}" varStatus="status">
        <div class="media text-muted pt-2">
        <div class="media-body pb-2 mb-0 lh-125 border-bottom border-gray">
          <div class="d-flex justify-content-between mb-2 small align-items-center w-100">
            <span class="font-italic">${ct.cpname}</span>
			<span class="text-success">${ct.ctime}</span>            
          </div>
          <div class="d-flex justify-content-between mb-0 align-items-center w-100">
          <strong style="text-overflow: ellipsis; overflow: hidden;"><a href="${ct.link}" target="_blank" class="text-danger">${ct.title}</a></strong>
          <form action="/grade" method="POST">
          	<input type="hidden" name="id" value="${ct.id}">
          	<c:choose>
				<c:when test="${ct.grade == 1 }">
					<input type="hidden" name="grade" value="2">					
				</c:when>
				<c:otherwise>
					<input type="hidden" name="grade" value="1">
				</c:otherwise>
	  		</c:choose>
          	<input type="hidden" name="offset" value="${offset}">
          	<input type="hidden" name="category" value="${ct.category}">
          	<input type="hidden" name="view_category" value="${category}">
          	<c:choose>
				<c:when test="${empty ct.search }">					
				</c:when>
				<c:otherwise>
					<input type="hidden" name="search" value="${ct.search}">
				</c:otherwise>
	  		</c:choose>
          <c:choose>
          	<c:when test="${ct.grade == 2}">
          		<input type="image" src="/images/check_yes.png" alt="Submit" class="img-thumbnail ml-2">
          	</c:when>
          	<c:otherwise>
          		<input type="image" src="/images/check_no.png" alt="Submit" class="img-thumbnail ml-2">
          	</c:otherwise>
          </c:choose>
          </form>
          </div>          
        </div>
      	</div>
      </c:forEach>
    </div>
	
	<nav aria-label="pagination">
	  <ul class="pagination justify-content-center">
	  	<c:choose>
	  		<c:when test="${offset == 0 }">
	  			<li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1">최신</a>
			    </li>
	  		</c:when>
	  		<c:otherwise>
		  		<c:choose>
					<c:when test="${empty search }">
						<li class="page-item"><a class="page-link" href="/main?category=${category}&offset=${offset-20}">< 다음</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/main?category=${category}&offset=${offset-20}&search=${search}">< 다음</a></li>
					</c:otherwise>
		  		</c:choose>
	  		</c:otherwise>
	  	</c:choose>
	    <li class="page-item disabled mr-2 ml-2"><a class="page-link" href="#">현재 페이지</a></li>
	    <c:choose>
	    	<c:when test="${empty search }">
	    		<li class="page-item"><a class="page-link" href="/main?category=${category}&offset=${offset+20}">이전 ></a></li>
	    	</c:when>
	    	<c:otherwise>
	    		<li class="page-item"><a class="page-link" href="/main?category=${category}&offset=${offset+20}&search=${search}">이전 ></a></li>
	    	</c:otherwise>
	    </c:choose>	    
	  </ul>
	</nav>
	
	<form class="form-inline justify-content-center">	  
	  <div class="form-group mx-sm-3 mb-2 mr-2">
	    <label for="inputPassword2" class="sr-only">검색어</label>
	    <input type="hidden" name="category" value="${category}">		
	    <input type="search" class="form-control" name="search" placeholder="검색어" required>
	  </div>
	  <button type="submit" class="btn btn-primary mb-2">검색</button>
	</form>
		
	<p>
	<footer class="text-muted">
		<div class="container">
			<p class="float-right">
	          <a href="#">Back to top</a>
	        </p>	
			<p>Copyrightⓒ Secret 4 News.</p>
			<p>All Rights Reserved.</p>
		</div>
	</footer>
	
		
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
</body>
</html>