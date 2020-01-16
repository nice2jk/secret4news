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

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="/main?category=best"><img src="/images/trash2.png" alt="..." class="img-thumbnail mr-1">쓰잘데기</a>
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
      <h6 class="border-bottom border-gray pb-2 mb-0 font-weight-bold text-primary"><a href="/articles">[자유게시판]</a></h6>
		<label for="basic-label" class="font-weight-bold my-3">글 등록하기</label>
		<form id="writeForm" action="/write.done" method="post">
			<div class="input-group mb-1">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">제목</span>
				</div>
				<input type="text" class="form-control" name="atitle" id="basic-label" placeholder="제목 입력" aria-label="Username" aria-describedby="basic-addon1" required>
			</div>
			<label for="basic-body" class="font-weight-bold my-1">본문 :</label>
			<input type="hidden" id="abody" name="abody" value=""/>
			<textarea id="summernote" required></textarea>		
		  	<div class="input-group my-2">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">비밀번호</span>
				</div>
				<input type="text" name="apw" id="basic-label" placeholder="비밀번호 입력" aria-label="Username" aria-describedby="basic-addon1" required>
			</div>
			<button type="submit" class="btn btn-primary mb-2" onclick="goSubmit()">등록</button>
	  	</form>
	</div>
		
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
	
	<script type="text/javascript">
    $(document).ready(function() {
	    $('#summernote').summernote({
	        placeholder: '팁좀을 입력하세요!'
	      });
    });
    
      function goSubmit() {
    	  var form = document.getElementById("writeForm");
    	  
    	  var markupStr = $('#summernote').summernote('code');
    	  
    	  if(form.atitle.value == "") {    		  
    		  alert("제목을 입력해주세요.");
    		  return;
    	  }
    	  
    	  if($('#summernote').summernote('isEmpty')) {
    		  alert("내용을 입력해주세요.");
    		  return;
    	  }
    	  
    	  if(form.apw.value == "") {
    		  alert("비번을 입력해주세요.");
    		  return;
    	  }
    	  
    	  document.getElementById("abody").setAttribute('value', markupStr);
    	  form.submit();    	  
  	}
    </script>

</body>
</html>