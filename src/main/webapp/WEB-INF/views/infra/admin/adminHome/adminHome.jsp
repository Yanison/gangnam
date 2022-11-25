<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>sgworld-Home</title>
	<%@ include file="../../../rscs/basicRscs.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="/resources/admin/adminTemplate/css/styles.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script>
    <link href="/resources/admin/adminHome/css/adminHome.css" rel="stylesheet" />
</head>
<body>
	<!-- header s-->
    <%@ include file="../common/header.jsp" %>
    <!-- header e-->
        <div id="layoutSidenav">
        	<!-- top banner s-->
	        <%@ include file="../common/sidebar.jsp" %>
	        <!-- top banner e-->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <div class="row">
                            <div class="col">
                                <div class="bg-outline-secondary my-4">
                                    <div class="card-header"><span>오늘 할일</span></div>
                                    <div class="card-footer d-flex align-items-center">
                                        <p class="small mb-5" href="#">답변대기문의 14</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="card mb-4">
                                    <div class="card-header d-flex justify-content-between">
                                        <div>
                                        	<span>방문자 현황</span>
                                       	</div>
                                        <div>
                                        	<i class="fa-solid fa-circle i1"> 페이지뷰</i>
                                       		<i class="fa-solid fa-circle i2"> 방문자</i>
                                    	</div>
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-6">
	                            <div class="card mb-4">
		                            <div class="card-header d-flex justify-content-between">
		                                <div>
		                                	<span>메타버스</span>
		                                </div>
		                                <div class="d-flex align-items-center">
		                                	<i class="fa-solid fa-bell i3"></i>
		                                	<div class="bellBox">
		                                		<span>14</span>
		                                	</div>
		                            	</div>
		                            </div>
		                            <div class="card-body">
		                                <table>
		                                    <thead>
		                                        <tr>
		                                            <th>일자</th>
		                                            <th>아이디</th>
		                                            <th>방제목</th>
		                                            <th>접속자수</th>
		                                            <th>분류</th>
		                                            <th>현황</th>
		                                        </tr>
		                                    </thead>
		                                    <tbody>
		                                        <tr>
		                                            <td>2022-10-23</td>
		                                            <td>Architect</td>
		                                            <td>이젠IT 일각코</td>
		                                            <td>61</td>
		                                            <td>신고</td>
		                                            <td>접수중</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-23</td>
		                                            <td>Accountant</td>
		                                            <td>이젠IT 일각코</td>
		                                            <td>63</td>
		                                            <td>문의</td>
		                                            <td>처리중</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-23</td>
		                                            <td>Accountant</td>
		                                            <td>이젠IT 일각코</td>
		                                            <td>63</td>
		                                            <td>문의</td>
		                                            <td>처리중</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-23</td>
		                                            <td>Accountant</td>
		                                            <td>이젠IT 일각코</td>
		                                            <td>63</td>
		                                            <td>문의</td>
		                                            <td>처리중</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-23</td>
		                                            <td>Accountant</td>
		                                            <td>이젠IT 일각코</td>
		                                            <td>63</td>
		                                            <td>문의</td>
		                                            <td>처리중</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-23</td>
		                                            <td>Accountant</td>
		                                            <td>이젠IT 일각코</td>
		                                            <td>63</td>
		                                            <td>문의</td>
		                                            <td>처리중</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-23</td>
		                                            <td>Accountant</td>
		                                            <td>이젠IT 일각코</td>
		                                            <td>63</td>
		                                            <td>문의</td>
		                                            <td>처리중</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-23</td>
		                                            <td>Accountant</td>
		                                            <td>이젠IT 일각코</td>
		                                            <td>63</td>
		                                            <td>문의</td>
		                                            <td>처리중</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-23</td>
		                                            <td>Accountant</td>
		                                            <td>이젠IT 일각코</td>
		                                            <td>63</td>
		                                            <td>문의</td>
		                                            <td>처리중</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-23</td>
		                                            <td>Accountant</td>
		                                            <td>이젠IT 일각코</td>
		                                            <td>63</td>
		                                            <td>문의</td>
		                                            <td>처리중</td>
		                                        </tr>
		                                    </tbody>
		                                </table>
		                            </div>
		                        </div>
	                        </div>
                        </div>
                        <div class="row">
	                        <div class="col-6">
	                            <div class="card mb-4">
		                            <div class="card-header d-flex justify-content-between">
		                                <div>
		                                	<span>게시글</span>
		                            	</div>
		                            	<div class="d-flex align-items-center">
		                                	<i class="fa-solid fa-bell i3"></i>
		                                	<div class="bellBox">
		                                		<span>14</span>
		                                	</div>
		                            	</div>
		                            </div>
		                            <div class="card-body">
		                            	<div class="boardBox d-flex">
			                            	<div>
			                            		<img class="profil" src="../user/image/profil1.png">	
			                            	</div>
			                            	<div>
			                            		<div>
			                            			<p>[문의]운영진 일 똑바로 해라</p>
			                            		</div>
			                            		<div>
			                            			<p>제발EZEN안녕 | 2022-10-24 15:45</p>
			                            		</div>
			                            	</div>
		                            	</div>
		                            	<div class="boardBox d-flex">
			                            	<div>
			                            		<img class="profil" src="../user/image/profil1.png">	
			                            	</div>
			                            	<div>
			                            		<div>
			                            			<p>[문의]운영진 일 똑바로 해라</p>
			                            		</div>
			                            		<div>
			                            			<p>제발EZEN안녕 | 2022-10-24 15:45</p>
			                            		</div>
			                            	</div>
		                            	</div>
		                            	<div class="boardBox d-flex">
			                            	<div>
			                            		<img class="profil" src="../user/image/profil1.png">	
			                            	</div>
			                            	<div>
			                            		<div>
			                            			<p>[문의]운영진 일 똑바로 해라</p>
			                            		</div>
			                            		<div>
			                            			<p>제발EZEN안녕 | 2022-10-24 15:45</p>
			                            		</div>
			                            	</div>
		                            	</div>
		                            </div>
	                            </div>
	                        </div>
	                        <div class="col-6">
	                            <div class="card mb-4">
		                            <div class="card-header d-flex justify-content-between">
		                                <div>
		                                	<span>댓글</span>
		                            	</div>
		                            	<div class="d-flex align-items-center">
		                                	<i class="fa-solid fa-bell i3"></i>
		                                	<div class="bellBox">
		                                		<span>14</span>
		                                	</div>
		                            	</div>
	                            	</div>
		                            <div class="card-body">
		                                <table>
		                                    <thead>
		                                        <tr>
		                                            <th>일자</th>
		                                            <th>아이디</th>
		                                            <th>게시글 제목</th>
		                                            <th>내용</th>
		                                        </tr>
		                                    </thead>
		                                    <tbody>
		                                        <tr>
		                                            <td>2022-10-13</td>
		                                            <td>Architect</td>
		                                            <td>[문의] 운영진 일 똑바로 해라</td>
		                                            <td>61</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-13</td>
		                                            <td>genius</td>
		                                            <td>[신고]성희롱, 악플 댓글 삭제해주세요</td>
		                                            <td>22</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-13</td>
		                                            <td>Architect</td>
		                                            <td>[문의] 운영진 일 똑바로 해라</td>
		                                            <td>61</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-13</td>
		                                            <td>genius</td>
		                                            <td>[신고]성희롱, 악플 댓글 삭제해주세요</td>
		                                            <td>22</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-13</td>
		                                            <td>Architect</td>
		                                            <td>[문의] 운영진 일 똑바로 해라</td>
		                                            <td>61</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-13</td>
		                                            <td>genius</td>
		                                            <td>[신고]성희롱, 악플 댓글 삭제해주세요</td>
		                                            <td>22</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-13</td>
		                                            <td>Architect</td>
		                                            <td>[문의] 운영진 일 똑바로 해라</td>
		                                            <td>61</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-13</td>
		                                            <td>genius</td>
		                                            <td>[신고]성희롱, 악플 댓글 삭제해주세요</td>
		                                            <td>22</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-13</td>
		                                            <td>Architect</td>
		                                            <td>[문의] 운영진 일 똑바로 해라</td>
		                                            <td>61</td>
		                                        </tr>
		                                        <tr>
		                                            <td>2022-10-13</td>
		                                            <td>genius</td>
		                                            <td>[신고]성희롱, 악플 댓글 삭제해주세요</td>
		                                            <td>22</td>
		                                        </tr>
		                                    </tbody>
		                                </table>
		                            </div>
	                            </div>
	                        </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <!-- footer s-->
        <%@ include file="../common/footer.jsp" %>
        <!-- footer e-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/admin/adminTemplate/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/js/datatables-simple-demo.js"></script>
</body>
</html>