<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<style>
     nav {
    width: 100%;
    height: 5rem;
   background-color: rgb(154, 205, 237);
  }
  .header_wrap {
    height: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .header_message {
    margin-left: 5rem;
    height: 100%;
  }
  .header_message p {
    line-height: 5rem;
    font-size: 1.5rem;
  }
  .header_navi {
    margin-right: 5rem;
    height: 100%;
  }
  .header_navi a {
    margin: 0 1.5rem;
    line-height: 5rem;
  }
</style>

<nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <!-- Search -->
              <div class="navbar-nav align-items-center">
                <div class="nav-item d-flex align-items-center">
                  <!-- 로그인 성공 시, 사용자 이름 가져오기 -->
                  <sec:authorize access="isAuthenticated()">
                     <!-- <sec:authentication property="Principal" var="VO"/>
                     <p>
                        <spring:message code="login.welcome.name" arguments="${VO.name}"></spring:message>
                     </p> -->
                  </sec:authorize>
                </div>
              </div>
              <!-- /Search -->

              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Place this tag where you want the button to render. -->
                <!-- User -->
                <!-- <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end"> -->
                    <div class="header_navi">
              <a href="#">조직도</a>
              <sec:authorize access="!isAuthenticated()">
                <a href="/employee/login">로그인</a>
              </sec:authorize>
              <sec:authorize access="isAuthenticated()">
                <a href="/employee/logout">로그아웃</a>
                <a href="#">마이페이지</a>
              </sec:authorize>
            </div>
                <!--/ User -->
              </ul>
            </div>
          </nav>

          <!-- / Navbar -->