<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Vector"%>
<%@page import="lms.LmsDAO"%>
<%@page import="lms.CalcLecture"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width" , initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>메인화면</title>
<style TYPE="text/css">
body {
	scrollbar-face-color: darkgray;
	scrollbar-highlight-color: darkgray;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: darkgray;
	scrollbar-darkshadow-color: darkgray;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: darkgray;
	margin: 0 auto;
}

tr {
	margin: 0px auto;
	width: 20px;
}

td {
	margin: 0px auto;
	font-family: "돋움";
	font-size: 14pt;
	color: #000000;
	background-color: #FFFFFF;
}

th {
	margin: 0px auto;
	font-family: "돋움";
	font-size: 9pt;
	color: #000000;
}

select {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

#lectureInfo {
	font-family: "sans-serif";
	margin: 0 auto;
	bolder-style: solid;
	width: 600px;
}

#userdiv {
	background-color: rgba(102, 153, 255, 0.2);
	width: 118px;
	border-radius: 5px;
	margin-bottom: -12px;
}

#user {
	font-size: 13pt;
}

#num_schedule {
	display: none;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

#year_month {
	display: inline-block;
	margin-top: 0px;
}

.div {
	margin-bottom: 10px;
	width: 200px;
	height: 50px;
	display: inline-block;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

.div_today {
	margin-bottom: 10px;
	width: 200px;
	height: 50px;
	display: inline-block;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	border-style: solid;
}

.divscroll {
	overflow: auto;
	padding: 5px;
	width: 130px;
	height: 140px;
	font-size: 15px;
}

.divscroll::-webkit-scrollbar {
	width: 1px;
}

.divscroll::-webkit-scrollbar-thumb {
	background-color: white;
	border-radius: 10px;
}

.divscroll::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}
</style>
</head>
<%
	Calendar cal = Calendar.getInstance();
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	String today = Integer.toString(year) + "-" + Integer.toString(month) + "-" + Integer.toString(date);
	//System.out.print(today);
	if (strYear != null)

	{
		year = Integer.parseInt(strYear);
		month = Integer.parseInt(strMonth);
	} else {
	}

	//년도/월 셋팅

	cal.set(year, month, 1);

	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0;

	//오늘 날짜 저장.

	Calendar todayCal = Calendar.getInstance();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");

	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));

	Vector<String> lectureNameVec = new Vector<String>();
	Vector<String> lecturePercentVec = new Vector<String>();
%>
<body>
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>



	<nav class="navbar navbar-inverse navbar-main">
		<div class="container-fluid">
			<div class="row">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand visible-xs" href="main.jsp">UnivPlanner</a>
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse text-center"
					id="bs-example-navbar-collapse-1">
					<div>
						<ul class="nav navbar-nav navbar-left"
							style="padding-left: 250px; padding-right: 20px;">
							<li class="active"><a href="main.jsp">Home<span
									class="sr-only">(current)</span></a></li>
							<li><a href="lmsLogin.jsp">Lms 로그인</a></li>
							<li><a href="bbs.jsp">스터디 모집</a></li>
						</ul>
					</div>
					<div class="navbar-brand hidden-xs">
						<a class="white-circle" href="main.jsp"
							style="position: absolute; left: 47%;"> <img
							class="logo img-circle" src="logo2.PNG" alt="Logo">
						</a>
					</div>
					<div>
						<ul class="nav navbar-nav navbar-right"
							style="padding-left: 20px; padding-right: 150px;">
							<li><a
								href="https://lms.sungshin.ac.kr/ilos/main/main_form.acl">교육시스템</a></li>
							<li><a
								href="https://portal.sungshin.ac.kr/sso/login.jsp?destination=/portal/ssu/stuMain">포탈시스템</a></li>
							<li><a href="https://lib.sungshin.ac.kr/">중앙도서관</a></li>
							<%
								// 로그인 하지 않았을 때 보여지는 화면
								if (userID == null) {
							%>
							<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
							<ul class="nav navbar-nav navbar-right">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">접속하기<span class="caret"></span></a> <!-- 드랍다운 아이템 영역 -->
									<ul class="dropdown-menu">
										<li><a href="login.jsp">로그인</a></li>
										<li><a href="join.jsp">회원가입</a></li>
									</ul></li>
							</ul>
							<%
								// 로그인이 되어 있는 상태에서 보여주는 화면
								} else {
							%>

							<%
								lectureNameVec = LmsDAO.lectureNameVec;
									lecturePercentVec = LmsDAO.lecturePercentVec;

									System.out.println("In main after login ==========");
									System.out.println(CalcLecture.checkTakeClass(100));
							%>
							<!-- 헤더 우측에 나타나는 드랍다운 영역 -->
							<ul class="nav navbar-nav navbar-right">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">회원관리<span class="caret"></span></a> <!-- 드랍다운 아이템 영역 -->
									<ul class="dropdown-menu">
										<li><a href="logoutAction.jsp">로그아웃</a></li>
									</ul></li>
							</ul>
							<%
								}
							%>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</nav>
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!--날짜 네비게이션  -->
	<form name="calendarFrm" id="calendarFrm" action="" method="post">
		<div id="content"
			style="width: 712px; position: absolute; left: 55%; transform: translateX(-50%);">
			<table width="500" border="0" cellspacing="1" cellpadding="1"
				id="KOO" bgcolor="WHITE" style="border: 1px solid WHITE">
				<tr>
					<td height="60">
						<table width="500" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="10"></td>
							</tr>
							<tr>
								<td align="center"><a
									href="<c:url value='/main.jsp' />?year=<%=year - 1%>&amp;month=<%=month%>"
									target="_self"> <b>&lt;&lt;</b> <!-- 이전해 -->
								</a> <%
 	if (month > 0) {
 %> <a
									href="<c:url value='/main.jsp' />?year=<%=year%>&amp;month=<%=month - 1%>"
									target="_self"> <b>&lt;</b> <!-- 이전달 -->
								</a> <%
 	} else {
 %> <b>&lt;</b> <%
 	}
 %> &nbsp;&nbsp;
									<div id='year_month'>
										<%=year%>년

										<%=month + 1%>월
									</div> &nbsp;&nbsp; <%
 	if (month < 11) {
 %> <a
									href="<c:url value='/main.jsp' />?year=<%=year%>&amp;month=<%=month + 1%>"
									target="_self"> <!-- 다음달 --> <b>&gt;</b>
								</a> <%
 	} else {
 %> <b>&gt;</b> <%
 	}
 %> <a
									href="<c:url value='/main.jsp' />?year=<%=year + 1%>&amp;month=<%=month%>"
									target="_self"> <!-- 다음해 --> <b>&gt;&gt;</b>
								</a></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<br>

			<table width="500" border="0" cellspacing="1" cellpadding="1"
				bgcolor="#FFFFFF">

				<THEAD>
					<TR bgcolor="#CECECE">
						<TD>
							<DIV align="center" class="div">
								<font color="red">일</font>
							</DIV>
						</TD>

						<TD>
							<DIV align="center" class="div">월</DIV>
						</TD>

						<TD>
							<DIV align="center" class="div">화</DIV>
						</TD>

						<TD>
							<DIV align="center" class="div">수</DIV>
						</TD>

						<TD>
							<DIV align="center" class="div">목</DIV>
						</TD>

						<TD>
							<DIV align="center" class="div">금</DIV>
						</TD>

						<TD>
							<DIV align="center" class="div">
								<font color="BLUE">토</font>
							</DIV>
						</TD>
					</TR>
				</THEAD>
				<TBODY>
					<TR>

						<%
							//처음 빈공란 표시

							for (int index = 1; index < start; index++) {
								out.println("<TD >&nbsp;</TD>");
								newLine++;
							}

							for (int index = 1; index <= endDay; index++) {
								String color = "";

								if (newLine == 0) {
									color = "RED";
								} else if (newLine == 6) {
									color = "BLUE";
								} else {
									color = "BLACK";
								}
								;

								String sUse = Integer.toString(year);
								String sUseDate = Integer.toString(year);

								sUse += "-";

								sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
										: Integer.toString(month + 1);

								sUse += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
										: Integer.toString(month + 1);
								sUse += "-";

								sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
										: Integer.toString(index);

								sUse += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);

								//System.out.print(sUse+"  ");

								int iUseDate = Integer.parseInt(sUseDate);

								String backColor = "WHITE";

								if (iUseDate == intToday) {

									backColor = "rgba(204,204,204,0.2)";

								}

								out.println("<TD valign='top' align='left' height='40px' bgcolor='" + backColor + "' nowrap>");
						%>

						<font color='<%=color%>'> <%
 	if (sUse.equals(today))
 			out.println("<DIV align='center' class='div_today'>");
 		else
 			out.println("<DIV align='center' class='div'>");
 %> <%=index%>
							</DIV>
						</font>


						<%
							out.println("<BR>");
								/*
								out.println("<DIV class='divscroll'>");
								      
								
								UserDAO userDAO = new UserDAO();
								ArrayList<Schedule> list = userDAO.findSchedule(sUse);
								for(int i = 0; i<list.size();i++){
								    	 String a = "a";
								    	 System.out.println("num_schedule : " + list.get(i).getnum_schedule());
								    	 System.out.println("name_schedule : " + list.get(i).getName_schedule());
								   out.println("<a id='user' href='addschedule.jsp?update=update&num_schedule="+list.get(i).getnum_schedule()+"'><div id='userdiv'>"+list.get(i).getName_schedule()+"</div></a><br>");
								} 
								
								out.println("<BR>");
								out.println("</DIV>");*/

								out.println("</TD>");

								newLine++;

								if (newLine == 7)

								{

									out.println("</TR>");

									if (index <= endDay)

									{

										out.println("<TR>");

									}

									newLine = 0;

								}

							}

							//마지막 공란 LOOP

							while (newLine > 0 && newLine < 7)

							{

								out.println("<TD>&nbsp;</TD>");

								newLine++;

							}
						%>

					</TR>
				</TBODY>
			</TABLE>
		</DIV>
	</form>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />


	<div id='lectureInfo'>
		<h2 style="font-size: 300%;" style="text-align:center;">강의 정보</h2>

		<%
			// out.println(lecturePercentVec.get(3) + "<br/>");
			// out.println(lecturePercentVec.get(3).charAt(0));

			for (int i = 0; i < lectureNameVec.size(); i++) {

				String[] tmp = new String[3];
				tmp = lecturePercentVec.get(i).split("\\n");

				if (tmp[0].charAt(0) == '0') {
					// out.println("강의 없음");
				} else {

					int innerLectureNum = Integer.valueOf(tmp[0]);
					String period = tmp[1];
					String percent = tmp[2];
					
					out.println("<h3>" + lectureNameVec.get(i) + "</h2>" );
					out.println(period + "<br/>");
					
					String percentStr = CalcLecture.calcLecture(innerLectureNum, percent);
					
					if (percentStr.equals("100")){

						out.println("<span style = \" font-weight:bold;  color: green;\">수강완료</span>");
					} else {
						out.println("<span style = \" font-weight:bold;  color: red;\">미수강</span>");
					}
					out.println(" (" +percentStr + "%) <br/>");

					


					out.println("<br>");

				}

			}
		%>


	</div>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />

</body>
</html>