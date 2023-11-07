<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

<script ></script>
<!DOCTYPE html>
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>

<head>
  <c:import url="/WEB-INF/views/layout/base.jsp"></c:import>
</head>

<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->
		      <!-- sidebar -->
          <c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
          <!-- Layout container -->
          <div class="layout-page">
            <!-- Navbar -->
            <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

            <!-- Content wrapper -->
            <div class="content-wrapper">
              <!-- Content 내용 여기로 -->
              <div class="container-xxl flex-grow-1 container-p-y">
              
              <div style='width:99%;'><i class='bx bxs-battery-charging' style='font-size:26px !important'></i>&nbsp;<label style='font-size:16px; font-weight:500'> 진행률</label>
		    <div class='progress' style='background:none; font-size:15px; margin-bottom:30px; width:99%; background:rgba(67,89,113,.1); height:20px; margin-top:2px; margin-right:60px'>
		        <div class="progress-bar bg-info" role="progressbar" style="height:20px" aria-valuemin="0" aria-valuemax="100  margin-right:60px"></div>
		    </div>
		    </div>
              
           		<!-- <button class="btn btn-primary" data-bs-toggle="modal"  data-bs-target="#exampleModal" >운동추가</button> -->
              	<div id="add-btn-div" style="margin-right:10px; margin-bottom:30px">
		        <button type="button" class="btn btn-primary add-btn" style='width:110px; margin-right:15px; margin-top:15px;' data-bs-toggle="modal" data-bs-target="#backDropModal" onclick="passValueToModal()">
		             운동추가
		        </button>
		        
		    	</div>
                	<i class='bx bx-layer-plus' style='font-size:26px'></i>&nbsp;<label style='font-size:16px; font-weight:500'> 운동목록</label>
		    <div id="todo-list" style='width:100%; height:100%;'>
	        	<table class="table">
                	
                			<thead>
                			<tr>
                				<th style="display: none;">${employeeNum}</th>
                				<th>운동이름</th>
                				<th>무게</th>
                				<th>횟수</th>
                				<th>세트</th>
                				
                				
                			</tr>
                			</thead>
                			<tbody class="table-border-bottom-0">
                				<c:forEach items="${list}" var="vo">
               					
									<tr>
										<td style="display: none;"></td>
										<td>${vo.name}</td>
										<td>${vo.weight}</td>
										<td>${vo.exCount}</td>
										<td>${vo.ptSet}</td>
										
									 	
									
                					</tr>
                				</c:forEach>
                			</tbody>
                			
                		</table>
                		
                		 
		    </div>
                	
		    
		    
		    
		    <!--  등록 폼 --> 
		    <div class="modal fade" id="backDropModal" data-bs-backdrop="static" tabindex="-1" style="display: none;" aria-hidden="true">
		        <div class="modal-dialog">
		            <div class="modal-content">
		
		                <!-- Modal Header -->
		                <div class="modal-header">
		                    <h4 class="modal-title">운동 등록하기</h4>
		                    <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
		                </div>
		
		                <!-- Modal body -->
		                <div class="modal-body">
		                <input type="text" id="employeeNumInput" name="employeeNum" style="display: none;">
		                <%-- <input type="hidden" id="writer" value="U">
		                <input type="hidden" id="exDate" value="${exDate }"> --%>
		                    <div class="form-group">
		                        <label for="form-title" class="col-form-label">운동명 : </label>
		                        <input type="text" class="form-control" id="name"  maxlength="40">
		                    </div>
		                    <div class="row g-2">
			                    <div class="col mb-0">
			                      <label for="emailBackdrop" class="form-label">무게 : </label>
			                      <input type="text" class="form-control" id="weight">
			                    </div>
			                    <div class="col mb-0">
			                      <label for="emailBackdrop" class="form-label">횟수 : </label>
			                      <input type="number" class="form-control" id="exCount" min="1" value="1">
			                    </div>
			                    <div class="col mb-0">
			                      <label for="dobBackdrop" class="form-label">세트수 : </label>
			                      <input type="number" class="form-control" id="ptSet" min="1" value="1">
			                    </div>
			                </div>
		                    <!-- <div class="form-group">
		                        <label for="form-desc" class="col-form-label">내용 : </label> 
		                        <textarea class="form-control" id="coment" maxlength="300" required></textarea>
		                        아무것도 입력하지 않았을 때 undefined가 출력되어 일단은 required로 막아둠
		                    </div> -->
		                </div>
		
		                <!-- Modal footer -->
		                <div class="modal-footer">
		                	<button type="button" class="btn btn-outline-secondary x" data-bs-dismiss="modal">취소</button>
		                    <button type="button" class="btn btn-primary" id="addTypeForm">추가</button>
		                </div>
		            </div>
		        </div>
		    </div>
                		
	                		 <!-- Modal -->
	                		 
							 <!-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h1 class="modal-title fs-5" id="exampleModalLabel">운동 추가</h1>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							      
									<input type="text" id="employeeNumInput" name="employeeNum" style="display: none;"> 
							        
							        운동명 :<input type="text" name="name" id="name"><br>
							        무게 : <input type="text" name="weight" id="weight"><br>
							        횟수 :<input type="text" name="exCount" id="exCount"><br>
							        세트 :<input type="text" name="ptSet" id="ptSet"><br>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							        <button type="button" id="addTypeForm" class="btn btn-primary">운동 추가</button>
							      </div>
							    </div>
							  </div>
							</div>  -->

              </div>
              <!-- / Content --> 
              
              
              

              <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
          </div>
        <!-- / Layout page -->
      <div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->
  

    <c:import url="/WEB-INF/views/layout/js.jsp"></c:import>
    <script type="text/javascript">
    function passValueToModal() {
        var employeeNum = document.querySelector('th').innerText;
        var modal = new bootstrap.Modal(document.getElementById('backDropModal'));
        // 여기서는 employeeNum을 모달에 적합한 방식으로 전달할 수 있습니다.
        // 예를 들어, 모달 내의 입력 필드 값으로 설정할 수 있습니다.
        var inputField = document.getElementById('employeeNumInput');
        inputField.value = employeeNum;
        console.log(employeeNum)
        
        $('#addTypeForm').on('click', function(event) {
            event.preventDefault(); // 기본 제출 동작 방지
            console.log("운동 추가 버튼이 클릭되었습니다.");
            // Ajax를 사용하여 폼 데이터 서버로 전송
            $.ajax({
                type: "POST",
                url: "/trainer/addType",
                data: {
                    employeeNum: $('#employeeNumInput').val(),
                    name: $('#name').val(),
                    weight: $('#weight').val(),
                    exCount: $('#exCount').val(),
                    ptSet: $('#ptSet').val()
                }, // 폼 데이터 직렬화하여 전송
                success: function(response) {
                    alert("운동 추가 성공");
                    location.reload();
                },
                error: function(error) {
                    console.log("에러 발생", error);
                }
            });
        });
        
    }
    
  //운동 진행률
	function progress(){
		
		$.ajax({
			url:"progress.cl",
			data:{
				ptTypeNum:${ptTypeNum},
				},
			success:function(result){
				
				console.log("진행률 : " + result);
				
				$(".progress-bar").text(result + "%");
				$(".progress-bar").attr("aria-valuenow", result);
				$('.progress-bar').css({"width": result + "%"});
				
			},
			error:function(){
				console.log("진행률 조회용 ajax 통신 실패");
			}
		})

	}
    
    //운동완료 체크시 상태변경
    $(document).on("click", ".check", function(){
    	
    	var exNo = $(this).parent().parent().parent().children().eq(0).val();
    	
    	console.log(exNo);
    	
    	
    	$.ajax({
    		url:"checkEx.cl",
    		data:{exNo:exNo},
    		success:function(result){
    			
    			console.log("완료 : " + result);
    			load();
    			progress();
    			
    		},
    		error:function(){
    			
    			console.log("운동완료 ajax 통신 실패");
    		}
    	})
    	
    })
    </script>
  </body>
</html>