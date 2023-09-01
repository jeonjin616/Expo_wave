<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

           <c:forEach items="${list2}" var="festival" varStatus="status">
            <div class="col-md-3">
                <div class="card">
                    <!-- 이미지와 제목을 클릭하면 해당 공연의 세부 정보 페이지로 이동 -->
                    <a href="<c:url value='/festivaldetail/${festival.fsv_id}'/>">
                        <div class="image-container">
                            <img src="${not empty festival.fsv_orgimg ? festival.fsv_orgimg : '../resources/img/thumb_ing.gif'}"
                                 alt="${festival.fsv_name}" class="card-img-top">
                        </div>
                       <div class="card-body">
									<h5 class="card-title truncate bold-text">${festival.fsv_name}</h5>
									<h4 class="card-title  smaller-text">${festival.fsv_start} ~ ${festival.fsv_end}</h4>
								</div>
                    </a>
                </div>
            </div>
        </c:forEach>
