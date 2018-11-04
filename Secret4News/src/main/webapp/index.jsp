<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html lang="ko">
<h1>쓰잘데기 6.6</h1>
<form id="mainContents" action="/main" method="get" onLoad = "calls()">
	 <input type="hidden" name="category" value="best" />
</form>

<script type="text/javascript"> 
this.document.getElementById("mainContents").submit(); 
</script> 
</html>