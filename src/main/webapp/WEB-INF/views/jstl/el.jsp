<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSP EL (JSP Expression Language)</h3>
	
	<ul>
		<li>JSP의 기본 디렉티브들이 너무 불편하여 JSP의 특정 버전 이후부터 추가된 기본 기능</li>
		<li>어트리뷰트에 실려있는 값들을 편리하게 꺼내쓸 수 있는 기능</li>
		<li>간단한 자바 메서드의 호출은 가능하지만 모든 메서드를 자바 파일에서처럼 자유롭게 쓸 수 있는 것은 아니다.</li>
		<li>자바스크립트의 ``을 사용한 format string과 똑같은 형태이기 때문에 JSP파일 내부에서는 자바스크립트 ``을 사용할 수 없다.</li>
	</ul>
	
	<h3>EL을 사용해 어트리뷰트에 저장된 값 출력해보기</h3>
	
	<ul>
		<li>${book}</li>
		<li>${requestScope.book}</li>
		<li>${sessionScope.book}</li>
	</ul>
	
	<h3>EL로 자바 객체 활용해보기</h3>
	
	<ul>
		<li>EL은 기본적으로 해당 객체의 toString()을 호출하여 웹 페이지에 출력한다.</li>
		<li>해당 객체의 멤버 변수를 사용하는 것은 실제로는 해당 객체의 getter를 호출하여 사용하게 된다.</li>
		<li>해당 필드 getter가 만들어져 있지 않다면 오류가 발생하게 된다.</li>
		<li>${student}</li>
		<li>${student.name}</li>
		<li>${student.school_name}</li>
		<li>${student.kor}</li>
	</ul>
	
	<h3>EL의 리터럴</h3>

	<ul>
		<li>정수: ${10}, ${10 + 20}, ${123 * 123}</li>
		<li>실수: ${123.123456 * 3}</li>
		<li>boolean: ${true}, ${false}</li>
		<li>문자열: ${"Hello!"}, ${'작은 따옴표도 먹힙니다~'}</li>
	</ul>
	
	<h3>EL의 연산자</h3>
	
	<c:set var="testpassed" value="true" />
	<c:set var="averageScore" value="70.95" />
	<c:set var="favSnack" value="" />
	
	<ul>
		<li>산술 연산 : +, -, *, /, %(mod)</li>
		<li>비교 연산 : ==, !=, eq(equal), ne(not equal), lt(less than), gt(greater than), le(less than equal), ge(greater than equal)</li>
		<li>논리 연산 : and, or, not, &&, ||, !</li>
		<li>empty 연산 : 해당 값이 null 또는 ""일 때 true</li>
		<li>삼항 연산자 : ? :</li>
	</ul>
	
	<div>${'10 % 7 = '}${10 mod 7}</div>
	<div>${10 eq 100}, ${10 == 100}, ${10 == '10'}, ${'true' == testPassed}, ${true == 'true'}</div>
	<div>and : ${testPassed and averageScore >= 80.0}</div>
	<div>not : ${not (testPassed and averageScore >= 80.0)}</div>
	<div>not empty student : ${not empty student}</div>
	<div>empty favSnack : ${empty favSnack}</div>
	<div>사과 바구니 개수 : ${appleCount % basketSize == 0 ? appleCount / basketSize : appleCount / basketSize + 1}</div>
</body>
</html>