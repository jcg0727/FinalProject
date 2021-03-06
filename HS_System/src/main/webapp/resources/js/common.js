var formData = "";


//팝업창들 뛰우기
//새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	event.stopPropagation();
	winleft = (window.screen.width/2) - (WinWidth/2);
	wintop = (window.screen.height/2)- (WinHeight/2);
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
							+"height="+ WinHeight +", top="+ wintop +", left=" 
							+ winleft +", resizable=yes, status=yes"  );
	win.focus() ; 
}

// 팝업창 닫기
function CloseWindow(parentURL){
	if(parentURL){
		window.opener.parent.location.href=parentURL;
	}else{
		window.opener.location.reload(true);	
	}
	window.close();
}


// 목록 검색
function list_go(page,url){
	if(!url) url= window.location.href;
	
	var jobForm=$('#jobForm');
	
	if(!page) page=1;

	jobForm.find("[name='page']").val(page);

	if($('select[name="perPageNum"]').val()){
		jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	}
	
	console.log(jobForm.find("[name='perPageNum']").val());
	
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
}

// 사용자 사진 출력
function MemberPictureThumb(targetObj, fileName, contextPath){ // (대상, 이미지파일명)
	targetObj.style.backgroundImage="url('"+contextPath+"/academic/management_st/getPicture.do?picture="+fileName+"')";
	targetObj.style.backgroundPosition="center";
	targetObj.style.backgroundRepeat="no-repeat";
	targetObj.style.backgroundSize="cover";
}


//spring_security redirect loginForm
function AjaxErrorSecurityRedirectHandler(status){
	if(status == '302'){
		alert('세션이 만료되었습니다.\n로그인 하세요.');
		location.reload();
	}else{
		alert('시스템 장애로 실행이 불가합니다.');
		history.go(-1);
	}
}

//파일 이름 입력
function inputFileName(inputFile, target){
	var index = inputFile.value.lastIndexOf('\\');
	var fileName = inputFile.value.substring(index);
	fileName = fileName.replace('\\','');
	$(target).val(fileName);
};


//파일업로드
function fileUpload(fileObject, url){
	var formData = new FormData();
    var inputFile = $(fileObject).prop('files')[0];
    
    formData.append("uploadFile", inputFile);
    
    var tempKey;
    $.ajax({
        url: url,
        processData : false,
        contentType: false,
        dataType: 'json',
        async: false, 
        data: formData,
        type: 'POST',
        success: function(result) {
        	tempKey = result;
        }
    });
    
    return tempKey;
}

function inputTypeHidden(input, target){
	$(target).append(input);
}

function printData(data,target,templateObject,removeClass){
	var template=Handlebars.compile($(templateObject).html());
	
	var html = template(data);
	$(removeClass).remove();
	$(target).append(html);
}

function printPagination(pageMaker, target, templateObject, removeClass){
	var pageNum = new Array(pageMaker.endPage - pageMaker.startPage + 1);
	
	for(var i=0; i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i]=pageMaker.startPage+i;
	}
	
	pageMaker.pageNum = pageNum;
	pageMaker.prevPageNum = pageMaker.startPage-1;
	pageMaker.nextPageNum = pageMaker.endPage+1;
	
	var template=Handlebars.compile($(templateObject).html());
	
	var html = template(pageMaker);
	$(target + ' '+removeClass).remove();
	$(target).append(html);
	
}

Handlebars.registerHelper("registDate", function(registDate) {
	 var dateObj = new Date(registDate);
	 var year = dateObj.getFullYear();
	 var month = dateObj.getMonth() + 1;
	 
	 if(month == '1' || month == '2' || month == '3' || month == '4' || month == '5' || month == '6' || month == '7' || month == '8' || month == '9') {
		 month = '0' + month;
	 }
	 
	 var date = dateObj.getDate();
	 if(date == '1' || date == '2' || date == '3' || date == '4' || date == '5' || date == '6' || date == '7' || date == '8' || date == '9') {
		 date = '0' + date;
	 }
	 
	 return year + "-" + month + "-" + date;
});

Handlebars.registerHelper("extractYear", function(registDate) {
	 var dateObj = new Date(registDate);
	 var year = dateObj.getFullYear();
	 
	 return year;
});

Handlebars.registerHelper("extractSemester", function(registDate) {
	 var dateObj = new Date(registDate);
	
	 var semester = null;
	 var year = dateObj.getFullYear();
	 var month = dateObj.getMonth() + 1;
	 var date = dateObj.getDate();
	
	 if(month == '2' || month == '3' || month == '4' || month == '5' || month == '6' || month == '7' || month == '8') {
		 semester = "1학기"
	 } else {
		 semester = "2학기"
	 }
		 
	 return semester;
});


Handlebars.registerHelper("checkCousel", function(status){
	if(status != '수락'){
		return status;
	}else{
		return "<button>상담실 가기</button>";
	}
});

// Handler로 if문 사용하기(커스텀)
Handlebars.registerHelper('ifEquals', function(arg1, arg2, options) {
    return (arg1 == arg2) ? options.fn(this) : options.inverse(this);
});


//로딩화면 출력
function  LoadingWithMask() {
    //화면의 높이와 너비를 구합니다.
    var maskHeight = $(window).height();
    var maskWidth  = $(window).width();
     
    //화면에 출력할 마스크를 설정해줍니다.
    var mask       ="<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
    var loadingImg ='';
      
    loadingImg +="<div id='loadingImg'>";
    loadingImg +=" <img src='/hs/resources/image/spinner.gif' style='position: absolute; z-index:8000; display: block; margin: 0px auto; left : 400px; top : 300px;'/>";
    loadingImg +="</div>"; 
  
    //화면에 레이어 추가
    $('body')
        .prepend(mask)
        .prepend(loadingImg)
        
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
    $('#mask').css({
            'width' : '100%'
            ,'height': '100vh'
            ,'opacity' :'0.3'
    });
  
    //마스크 표시
    $('#mask').show();  
  
    //로딩중 이미지 표시
    $('#loadingImg').show();
}

//로딩화면 제거
function closeLoadingWithMask() {
    $('#mask, #loadingImg').hide();
    $('#mask, #loadingImg').remove(); 
}

Date.prototype.YYYYMMDDHHMMSS = function(){
	var yyyy = this.getFullYear().toString();
	var MM = pad(this.getMonth() + 1,2);
	var dd = pad(this.getDate(),2);
	var hh = pad(this.getHours(),2);
	var mm = pad(this.getMinutes(),2);
	var ss = pad(this.getSeconds(),2);
	
	return yyyy+"/"+MM+"/"+dd+" "+hh+":"+mm+":"+ss;
};

function pad(number,length){
	var str = "" + number;
	while(str.length < length){
		str = '0'+str;
	}
	return str;
}

Handlebars.registerHelper("inc", function(value, options){
    return parseInt(value) + 1;
});

Handlebars.registerHelper("outSignActive", function(value, options){
	if(value == outListPage) {
		return "active";
	}
	
})







Handlebars.registerHelper("inSignActive", function(value, option){
	if(value == inListPage) {
		return "active";
	}
})

Handlebars.registerHelper("activeBtn", function(value1, value2, option){
	if(value1 == value2) {
		return "active";
	}
});

