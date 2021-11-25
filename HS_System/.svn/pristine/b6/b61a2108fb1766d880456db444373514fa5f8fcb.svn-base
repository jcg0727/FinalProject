<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>



function  changePicture_go(){
	//alert("click picture btn");
	var picture = $('input#inputFile')[0];
	
	var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
	
	//이미지 확장자 jpg 확인
	if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
		alert("이미지는 jpg 형식만 가능합니다.");
		return;
	} 
	//이미지 파일 용량 체크
	if(picture.files[0].size>1024*1024*1){
		alert("사진 용량은 1MB 이하만 가능합니다.");
		return;
	};

	document.getElementById('inputFileName').value=picture.files[0].name;
	
	if (picture.files && picture.files[0]) {
		 var reader = new FileReader();
		 
		 reader.onload = function (e) {
	        	//이미지 미리보기	        	
	        	$('div#pictureView')
	        	.css({'background-image':'url('+e.target.result+')',
					  'background-position':'center',
					  'background-size':'cover',
					  'background-repeat':'no-repeat'
	        		});
	        }
	        
	       reader.readAsDataURL(picture.files[0]);
	} 
	
	// 이미지 변경 확인
	$('input[name="uploadPicture"]').val(picture.files[0].name);
	
}

function modify_go(){
	var form=$('form[role="form"]');	
	form.submit();
}


//파일 이름 입력
function inputFileName(inputFile, target){
		var index = inputFile.value.lastIndexOf('\\');
		var fileName = inputFile.value.substring(index);
	fileName = fileName.replace('\\','');
	$(target).val(fileName);
};



function fileUpload(fileObject, url){
	var formData = new FormData();
    var inputFile = $(fileObject);
    var files = inputFile[0].files;
    console.log(files);
    
    for(var i=0; i<files.length; i++) {
        formData.append("uploadFile", files[i]);
    };
    
    $.ajax({
        url: url,
        processData : false,
        contentType: false,
        data: formData,
        type: 'POST',
        success: function(result) {
        	alert("upload success");
        }
    });
}

//팝업창 닫기
function CloseWindow(){
	window.opener.location.reload(true);	
	window.close();
}


</script>  





