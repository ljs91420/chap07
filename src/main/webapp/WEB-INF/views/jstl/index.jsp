<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 해보기</title>
</head>
<body>
	<h3>JSTL (JSP Standard Tag Library)</h3>
	
	<ul>
		<li>JSP에서 자바 문법을 사용하기가 너무 지저분해서 등장한 태그 라이브러리</li>
		<li>화면을 구성하는 데에 필요한 일부 자바 문법들을 보기 좋은 태그 형식으로 사용할 수 있다.</li>
		<li>JSTL은 태그 라이브러리이므로 태그 라이브러리를 import하는 별도의 문법을 JSP 페이지에 추가해야 사용할 수 있다.</li>
		<li>JSTL 다운 : Maven Repository에서 검색 후 다운로드</li>
		<li>다운받은 라이브러리를 Build Path에도 추가하고 Deployment Assembly에도 추가해야 한다.</li>
	</ul>
	
	<h3>JSTL core</h3>
	
	<ul>
		<li>&lt;c:set&gt; : 현재 페이지 영역 어트리뷰트에 setAttribute를 편하게 할 수 있는 태그</li>
		<li>&lt;c:if&gt; : if문을 편리하게 사용할 수 있는 태그</li>
		<li>&lt;c:choose&gt;, &lt;c:when&gt;, &lt;c:otherwise&gt; : if, else if, else문을 사용할 수 있는 태그</li>
		<li>&lt;c:forEach&gt; : 반복문을 쉽게 사용할 수 있는 태그</li>
		<li>&lt;c:forTokens&gt; : 전달한 문자열을 split하여 반복문을 돌려주는 태그</li>
		<li>&lt;c:url&gt; : contextPath를 추가한 url을 편리하게 생성해주는 태그</li>
	</ul>
	
	<h3>어트리뷰트에 추가된 값은 사실 편리하게 꺼내 쓸 수 있는 방법이 있다.</h3>
	
	<p>편하게 꺼내기 : ${animals} (해당 객체의 toString을 사용함)</p>
	<p>${favSnack}</p>
	
	<h3>아래의 두 문법은 완전히 똑같은 내용이다.</h3>
	
	<% pageContext.setAttribute("fruit", "Peach"); %>
	<p>기존 자바 문법으로 지저분하게 추가한 값: ${fruit}</p>
	<c:set var="fruit" value="복숭아" scope="page" />
	<p>깔끔한 태그 라이브러리 문법으로 추가한 값: ${fruit}</p>
	
	<h3>각 영역별 어트리뷰트 추가하기</h3>
	
	<% 
		// 같은 이름의 어트리뷰트가 여러 영역에 있다면 가장 가까운 범위의 것을 참조한다.(application > session > request > pageContext)
		application.setAttribute("coffee", "아메리카노");
		session.setAttribute("coffee", "카페모카");
		request.setAttribute("coffee", "디카페인아메리카노");
		pageContext.setAttribute("coffee", "초코라떼");
	%>
	
	<c:set var="soccerPlayer" value="박지성" scope="application" />
	<c:set var="soccerPlayer" value="손흥민" scope="session" />
	<c:set var="soccerPlayer" value="김민재" scope="request" />
	<c:set var="soccerPlayer" value="린가드" scope="page" />
	
	<p>${coffee}</p>
	<p>${soccerPlayer}</p>
	
	<h3>영역을 정확하게 선택하여 어트리뷰트 값에 접근하기</h3>
	
	<ul>
		<li>XXScope에 .을 찍고 해당 영역의 어트리뷰트를 사용할 수 있다.</li>
		<li>${applicationScope.soccerPlayer}</li>
		<li>${sessionScope.soccerPlayer}</li>
		<li>${requestScope.soccerPlayer}</li>
		<li>${pageScope.soccerPlayer}</li>
	</ul>
	
	<h3>if문을 보기 좋게 사용하기</h3>
	
	<p>c:if는 else if와 else가 없다...</p>
	
	<c:if test="${requestScope.coffee != '초코라떼'}">
		<p>true일 때만 출력</p>
	</c:if>
	
	<h3>choose문 사용하기</h3>
	<c:set var="score" value="78" />
	<c:choose>
		<c:when test="${score >= 90}">
			<p>A등급입니다.</p>
		</c:when>
		<c:when test="${score >= 80}">
			<p>B등급입니다.</p>
		</c:when>
		<c:when test="${score >= 70}">
			<p>C등급입니다.</p>
		</c:when>
		<c:otherwise>
			<p>F등급입니다.</p>
		</c:otherwise>
	</c:choose>
	
	<h3>c:forEach로 반복문 돌려보기</h3>
	
	<ul>
		<li>var : 하나씩 꺼내서 반복 돌릴 값</li>
		<li>
			items : 하나씩 꺼낼 수 있는 열거형(enum, iterable한 객체) 객체 <br>
			e.g. 배열, 리스트, Set 등등..
		</li>
		<c:forEach var="animal" items="${animals}">
			<li id="${animal}">${animal}</li>
		</c:forEach>
	</ul>
	
	<h3>c:forEach로 숫자를 만들어서 반복 돌리기</h3>
	
	<ul>
		<li>begin : 시작하는 숫자</li>
		<li>end : 끝나는 숫자</li>
		<li>step : 증가하는 숫자</li>
		<c:forEach var="i" begin="0" end="9" step="1">
			${i},
		</c:forEach>
		<li>
		<c:forEach var="i" begin="0" end="20" step="2">
			${i},
		</c:forEach>
		</li>
		<c:forEach var="i" begin="0" end="9" step="1">
			<li id="list-items${i}">${i}번째 반복</li>
		</c:forEach>
	</ul>
	
	<h3>반복문 자체의 상태를 볼 수 있는 varStatus</h3>
	
	<ul>
		<li>status.index : 현재 반복 인덱스(0부터 시작)</li>
		<li>status.count : 현재 반복 횟수(1부터 시작)</li>
		<li>status.first : 현재 반복이 첫 번째인가?</li>
		<li>status.last : 현재 반복이 마지막인가?</li>
		<li>status.current : 현재 값 (그냥 var 쓰면 됨)</li>
	</ul>
	
	<c:forEach var="f" items="${fruits}" varStatus="status">
		<div 
			<c:if test="${status.first}">
				style="color: red font-weight: bold;"
			</c:if>
			<c:if test="${status.last}">
				style="color: orange font-weight: bold;"
			</c:if>
		>
			${f}(${status.index}번째 아이템, ${status.count}회 반복 중)
		</div>
	</c:forEach>
	
	<h3>c:forTokens 사용해보기</h3>
	
	<c:set var="champions" value="티모/쉬바나/케이틀린/유미/갈리오/마스터이" />
	
	<c:forTokens var="champ" varStatus="status" items="${champions}" delims="/">
		<div>${status.count}번째 챔피언: ${champ}</div>
	</c:forTokens>
	
	<h3>c:url로 url 만들어보기</h3>
	
	<ul>
		<li>절대 경로를 사용할 때는 별 차이 없지만 상대경로를 사용할 때는 contextPath를 앞에 붙여준다.</li>
		<li><c:url value="https://naver.com" /></li>
		<li><c:url value="/emp/list" /></li>
		<li><%=request.getContextPath() %></li>
		<li>
			<c:url value="/emp/detail">
				<c:param name="employee_id">103</c:param>
				<c:param name="department_id">80</c:param>
			</c:url>
		</li>
		<li>c:url에 var값을 넣어주면 해당 어트리뷰트에 결과가 저장된다.(var을 설정하지 않은 경우 그냥 웹페이지에 출력된다.)</li>
		<li>
			<c:url var="to_detail" value="/emp/detail">
				<c:param name="employee_id">103</c:param>
				<c:param name="department_id">80</c:param>
			</c:url>
			<a href="${to_detail}">사원정보 보러가기</a>
		</li>
	</ul>
</body>
</html>