<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       
       <c:forEach items="${searchResults2}" var="show" varStatus="status">
                <div class="col-md-3">
                    <div class="card">
                    <!-- 이미지와 제목을 클릭하면 해당 공연의 세부 정보 페이지로 이동 -->
                        <a href="<c:url value='/showdetail/'/>${show.show_id}">
                            <div class="image-container">
                                <img 
                                src="${not empty show.show_poster ? show.show_poster : '../resources/img/thumb_ing.gif'}"
                                     alt="${show.show_name}" class="card-img-top">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">${show.show_name}</h5>
                            </div>
                        </a>
                    </div>
                </div>
            </c:forEach>
