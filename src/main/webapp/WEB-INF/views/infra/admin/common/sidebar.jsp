<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <a class="nav-link" onclick="goAdmin()">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    홈
                </a>
                <div class="sb-sidenav-menu-heading">관리</div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    	코드그룹관리
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" onclick="goAdminCodeGroupList()" style="cursor: pointer;">코드그룹관리</a>
                        <a class="nav-link" onclick = "goAdminCodeList()" style="cursor: pointer;">코드</a>
                    </nav>
                </div>
                <a class="nav-link collapsed" onclick="goAdminMetaversMap()" style="cursor: pointer;">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    	매타버스관리
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <a class="nav-link collapsed" onclick="goAdminAvartList()" style="cursor: pointer;">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
						아바타관리	
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <a class="nav-link collapsed" onclick = "goAdminMemberList()" style="cursor: pointer;">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    	회원관리
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseLayouts4" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="layout-static.html">회원목록</a>
                    </nav>
                </div>
                <a class="nav-link collapsed" onclick="goAdminBoardList()" style="cursor: pointer;">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    	계시판관리
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
            </div>
        </div>
    </nav>
</div>

<script>


</script>