<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인|언제만나</title>
<script src="js/jquery-3.6.4.min.js"></script>
<script src='js/cal.js'></script>
<script src="js/main.js"></script>
<link rel="icon" href="/img/icon.svg">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/schedule_location.css">
<script>
var currentDate = new Date();

var year = currentDate.getFullYear();
var month = String(currentDate.getMonth() + 1).padStart(2, '0');
var day = String(currentDate.getDate()).padStart(2, '0');

var formattedDate = year + '-' + month + '-' + day;
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,dayGridWeek,dayGridDay'
      },
      initialDate: formattedDate,
      navLinks: true, // can click day/week names to navigate views
      businessHours: true,
      editable: true,
      selectable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
	   	{
            start: '2023-07-24',
            end: '2023-07-28',
            overlap: false,
            display: 'background',
            color: '#ff9f89'
        },
        {
          title: '일하기',
          start: formattedDate
        },
        {
          groupId: 999,
          title: '반복',
          start: '2023-07-09T16:00:00'
        },
        {
          groupId: 999,
          title: '반복',
          start: '2023-07-16T16:00:00'
        },
        {
          title: '회의',
          start: '2023-07-11',
          end: '2023-07-13'
        },
        {
          title: '미팅',
          start: '2023-07-12T10:30:00',
          end: '2023-07-12T12:30:00'
        },
        {
          title: '점식약속',
          start: '2023-07-12T12:00:00'
        },
        {
          title: 'url이동',
          url: 'http://google.com/',
          start: '2023-07-28'
        }
      ]
    });

    calendar.render();
  });

</script>

</head>
<body>
	<%session.setAttribute("session_id", request.getAttribute("id")); %>
	<%@ include file="../header.jsp" %>
	
    <div id="top">
    	<a href="meeting/write	" id="add_btn"><button><h2>모임 생성</h2></button></a>
    	<img alt="배경이미지" src="img/back.jpg" id="back">
    </div>
    <div id="body">
	    <div id="content">
	    	<div id="my_page">
			    <div id="group">
			    	<h1 class="text">
			    		나의 모임
			    		<span class="more"><a href="" id="group_more">전체보기</a></span>
			    	</h1>
			    	
			    	<c:forEach items="${mygroup}" var="group" begin="0" end="2">
			    		<h3 class="group_list"><a href="schedule/${group.group_id }">${group.group_name}</a></h3>
			    	</c:forEach>
			    </div>
		    	<div id="writing">
			    	<h1 class="text">
			    		작성한 모집글
			    		<span class="more"><a href="meeting/my" id="write_more">전체보기</a></span>
			    	</h1>
			    	<c:forEach items="${mywrite}" var="write" begin="0" end="2">
		    			<h3 class="writing_list"><a href="meeting/detailed?seq=${write.seq}">${write.title}</a></h3>
		    		</c:forEach>
			    </div>
			    <div id="apply">
			    	<h1 class="text">
			    		신청한 모집글
			    		<span class="more"><a href="meeting/myapp" id="apply_more">전체보기</a></span>
			    	</h1>
			    	<c:forEach items="${myapplication}" var="application" begin="0" end="2">
		    			<h3 class="apply_list"><a href="meeting/detailed?seq=${application.seq}">${application.title}</a></h3>
		    		</c:forEach>
			    </div>
			    
			</div>
		    <div id="schedule">
		    	<h1 class="text">나의 일정</h1>
		    	<c:choose>
				    <c:when test="${session_id == null}">
				        <a href="login"><button id="null"><h2>로그인이 필요합니다.</h2></button></a>
				    </c:when>
				    <c:otherwise>
				        <div id='calendar'></div>
				    </c:otherwise>
				</c:choose>
		    	
		    </div>
		    <div id="rank">
		    	<h1 class="text">
		    		인기 글
		    		<span class="more"><a href="meeting" id="rank_more">전체보기</a></span>
		    	</h1>
			    <c:forEach items="${ranklist}" var="rank" begin="0" end="4">
		    			<h2 class="rank_list"><a href="meeting/detailed?seq=${rank.seq}">${rank.title}</a></h2>
		    			<span class="rank_contents" id="rank_contents${rank.seq}">${rank.contents}</span>
		    			<script>
		    				var content = $('#rank_contents${rank.seq}');
		    				content.html(content.text());
		    			</script>
		    	</c:forEach>
			</div>
	    </div>
	    <div>
		</div>
    </div>
    <div id="footer">
    <%@ include file="../footer.jsp" %>
    </div>
</body>
</html>