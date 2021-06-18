<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<c:set var="store" value="${info.store}"/>
<c:set var="storeImgList" value="${info.storeImgList}"/>
<c:set var="categoryList" value="${info.categoryList}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			.store_modify_box > input {
			    border: solid 1px black;
			    box-shadow: none;
			    font-size: 1.2rem;
			    box-sizing: border-box;
			    width: 40%;
			    padding: 15px 15px;
			    margin-bottom: 10px;
			}
			.store_modify_box label {
				margin: 10px 0;
				display: block;
			}
			.store_modify_box img {
				width: 150px;
				height: 150px;
				margin-bottom: 20px;
			}
			.modify_btn {
			    font-size: 14px;
			    padding: 12px 0 13px;
			    background: #ee2c30;
			    line-height: 25.85px;
			    font-weight: 700;
			    width: 40%;
			    text-align: center;
			    color: #fff;
			    border-radius: 2px;
			    letter-spacing: 2.16px;
			    cursor: pointer;
			    margin: 10px 0;
			}
			#addr_btn {
				cursor: pointer;
			}
		</style>
		<script type="text/javascript">
			function store_modify() {
				
				var store_name = $('#store_name').val()
				var category = $('input[name="category"]:checked').val()
				var introduce = $('#introduce').val()
				var addr = $('#addr').val() + ' ' + $('#detailAddress').val() 
				var tel = $('#tel').val()
				var opening_hours = $('#opening_hours').val()
				var closed_days = $('#closed_days').val()
				var parking = $('input[name="parking"]:checked').val()
				var max_num_people = $('#max_num_people').val()
				
				var opening_hours_test =  /^((?=.{1,11}$)([01][0-9]|2[0-3]):(00|30)~([01][0-9]|2[0-3]):(00|30))|(([01][0-9]|2[0-3]):(00|30)~([01][0-9]|2[0-3]):(00|30) \/ ([01][0-9]|2[0-3]):(00|30)~([01][0-9]|2[0-3]):(00|30))$/
				
				if(store_name===''||introduce===''||addr===''||tel===''||
						closed_days===''||max_num_people==='') {
					alert('모든 정보를 기입해주세요');
				}
				
				if(!opening_hours_test.test(opening_hours)) {
					alert('영업시간은 hh:mm~hh:mm 또는hh:mm~hh:mm / hh:mm~hh:mm 형식으로 작성해주세요.\n또한 분은 00분과 30분만 가능합니다.')
					return
				}
				
				$.ajax({
					type: 'post', 
					url: '/poing/store/modify.do', 
					data: {'store_name':store_name, 'category':category, 'introduce':introduce, 'addr':addr,
						'tel':tel, 'opening_hours':opening_hours, 'closed_days':closed_days, 'parking':parking, 'max_num_people':max_num_people},
					success:function (data) {
						if(data==='error') {
							alert('정보 수정에 실패했습니다.')
							return
						}
						
						alert('정보를 수정하였습니다.')
					},
					error:function () {
						alert('에러가 발생했습니다.')
					}
				})
				
			}
			
			function delImg(img) {
				
				if(!confirm('해당 사진을 삭제하시겠습니까?')) {
					return
				}
				
				img_cnt--
				
				$.ajax({
					type: 'post', 
					url: '/poing/store/deleteImg.do', 
					data: {'img':img},
					success:function (data) {

			        	var state = data.state
			        	
			        	if(state==='error') {
			        		alert('사진을 삭제하는데 실패했습니다.')
			        	}
			        	
			        	setImg(data)
			        	if(img_cnt==9) {
			        		addImgBtn()
			        		addEvent()
			        	}
			        		
					},
					error:function () {
						alert('에러가 발생했습니다.')
					}
				})
			}
			
			function setImg(data) {

	        	var imgList = data.imgList
	        	
	        	var item = ''
	        	
	        	var idx = $('#store_idx').val()
				
				$('#img_box').empty()

	        	for(var i=0; i<imgList.length; i++) {
					item += '<img onclick="delImg(\'' + imgList[i] + '\')" style="float: left; margin-left: 10px" src="/poing/resources/store/' + idx + '/' + imgList[i] + '">'
	        	}
	        	
				$('#img_box').append(item)

			}
			
		</script>
	</head>
	<body>
		<div class="store_modify_box">
			<h1>매장 정보 수정</h1>
			
			<input id="store_idx" type="hidden" value="${store.idx}">
			
			<label>매장명</label>
			<input id="store_name" value="${store.store_name}">
			
			<label>카테고리</label>
			<div>
				<c:forEach var="cate" items="${categoryList}">
					<c:choose>
						<c:when test="${cate.category_name == store.category}">
							<input checked="checked" name="category" type="radio" value="${cate.category_name}">
							${cate.category_name}
						</c:when>
						<c:otherwise>
							<input name="category" type="radio" value="${cate.category_name}">
							${cate.category_name}
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
						
			<label>매장 소개</label>
			<input id="introduce" value="${store.introduce}">
			
			<label>매장 주소</label>
			<input id="addr" value="${store.addr}" disabled="disabled">
			
			<input id="addr_btn" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="detailAddress" placeholder="상세주소">
			
			<label>전화</label>
			<input id="tel" value="${store.tel}">
			
			<label>영업시간</label>
			<input id="opening_hours" value="${store.opening_hours}">
			
			<label>휴무일</label>
			<input id="closed_days" value="${store.closed_days}">
			
			<label>주차</label>
			<div>
				<c:choose>
					<c:when test="${store.parking == '가능'}">
						<input checked="checked" name="parking" type="radio" value="가능">
						가능
						<input name="parking" type="radio" value="불가능">
						불가능
					</c:when>
					<c:otherwise>
						<input name="parking" type="radio" value="가능">
						가능
						<input checked="checked" name="parking" type="radio" value="불가능">
						불가능
					</c:otherwise>
				</c:choose>
			</div>
					
			<label>최대 인원 수</label>
			<input id="max_num_people" type="number" value="${store.max_num_people}"> <br>
				
			<button onclick="store_modify()" class="modify_btn">수정하기</button>
			
			<hr>
			
			<label>메인 이미지 (변경하시려면 이미지를 클릭하세요)</label>
			<form id="main_img_form" enctype="multipart/form-data">
				<input id="main_img" name="main_img" type="file" style="display: none;">
			</form>
			<label for="main_img" style="display: inline;">
				<img id="mainImg" src="${contextPath}/resources/store/${store.idx}/${store.main_img}">
			</label>
			
			 <br>
			
			<label>매장 이미지 (삭제하시려면 이미지를 클릭하세요)</label>
			<div id="img_box" style="overflow: hidden;">
				<c:forEach var="img" items="${storeImgList}">
					<img onclick="delImg('${img}')" style="float: left; margin-left: 10px" src="${contextPath}/resources/store/${store.idx}/${img}">
				</c:forEach>
			</div>
			
			<script type="text/javascript">
				
				var img_cnt = 0
			
				$(document).ready(function() {
					img_cnt = parseInt($('#img_cnt').val())
					
					addEvent()
					
					$('#main_img').change(function() {

						if( $('#main_img').val() == '' ) {
							return
						}

						var formData = new FormData($("#main_img_form")[0])
						
						$.ajax({
		                    type : 'post',
		                    url : '/poing/store/uploadMainImg.do',
		                    data : formData,
		                    processData : false,
		                    contentType : false,
		                    success : function(data) {

					        	var state = data.state
					        	
					        	if(state==='error') {
					        		alert('에러가 발생함')
					        		return
					        	}
					        	
					        	var path = $('#mainImg').attr('src')
					        	
					        	path = path.substring(0, path.lastIndexOf('/')+1)
					        	
					        	var mainImg = data.mainImg

								path += mainImg

					        	$('#mainImg').attr('src', path)
		                    },
		                    error : function(error) {
								alert('에러가 발생했습니다.')
		                    }
		                })
					})
				})
				
				function addEvent() {
					$('#add_img').change(function() {
						
						if( $('#add_img').val() == '' ) {
							return
						}

						readURL(this)
						
	        			img_cnt++
	        			
	        			if(img_cnt!=10)
							addImgBtn()
					})
				}
				
	        	function readURL(input) {
	        		if (input.files && input.files[0]) {
	        			var reader = new FileReader()
	        			reader.onload = function(e) {
	        				$('#new_img').attr('src', e.target.result)
	        				$('#add_label').attr('for', '')
	        				$('#add_label').removeAttr('id')
							$('#add_img').removeAttr('id')
							$('#new_img').removeAttr('id')
							addEvent()
	        			}
	        			reader.readAsDataURL(input.files[0])
	        		}
	        	}
				
	        	function addImgBtn() {
					
					var item = ''
					
					item += '<input id="add_img" type="file" name="upload_img' + img_cnt + '" style="display: none;">'
					item += '<label id="add_label" for="add_img" style="float: left; margin-right: 10px;">'
					item += '<img id="new_img" src="${contextPath}/resources/icon_plus.png">'
					item += '</label>'
					
					$('#img_form').append(item)
	        	}
	        	
	        	function uploadImg() {
					var formData = new FormData($("#img_form")[0])
					
	                $.ajax({
	                    type : 'post',
	                    url : '/poing/store/uploadImg.do',
	                    data : formData,
	                    processData : false,
	                    contentType : false,
	                    success : function(data) {

				        	var state = data.state
				        	
				        	if(state==='error') {
				        		alert('에러가 발생합')
				        		return
				        	}
				        	
	                    	setImg(data)

	        				$('#img_form').empty()
							
	        				if(img_cnt!=10) {
								addImgBtn()
								addEvent()
	        				}
	                    },
	                    error : function(error) {
							alert('에러가 발생했습니다.')
	                    }
	                })
	        	}
			</script>
			<c:set var="storeImgListSize" value="${fn:length(storeImgList)}"/>
			<input id="img_cnt" type="hidden" value="${storeImgListSize}">
			<label>이미지 추가 (이미지는 메인 이미지 제외 최대 10장까지 가능합니다.)</label>
			<div id="img_add_box" style="overflow: hidden;">
				<form id="img_form" action="/poing/store/uploadImg.do" method="post" enctype="multipart/form-data">
					<c:choose>
						<c:when test="${storeImgListSize!='10'}">
							<input id="add_img" type="file" name="upload_img${fn:length(storeImgList)}" style="display: none;">
							<label id="add_label" for="add_img" style="float: left; margin-right: 10px;">
								<img id="new_img" src="${contextPath}/resources/icon_plus.png">
							</label>
						</c:when>
					</c:choose>
				</form>
			</div>
			
			<button onclick="uploadImg()" class="modify_btn">등록하기</button>
			
		</div>
		
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		    function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수
		
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('addr').value = roadAddr;
		            }
		        }).open();
		    }
		</script>
	</body>
</html>