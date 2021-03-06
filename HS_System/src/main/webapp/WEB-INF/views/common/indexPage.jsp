<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>

</head>
  
<title>H.S.System</title>
  
<body>  
  <div class="content-wrapper" style="background-color:#fff;">
  	<iframe name="ifr" src="" frameborder="0" style="width:100%;height:85vh;"></iframe>
  </div>
  
<script>
window.addEventListener('message', event => {
	  history.pushState(null, null, event.data);
});

function subMenu(mcode){
	if(mcode!="M000000"){
		$.getJSON("subMenu?mCode="+mcode,function(data){
			console.log(data);
			printData(data,'.'+mcode,$('#subMenu-list-template'),'.subMenu');
		});
	}else{
		$('.subMenuList').html("");			
	}
}

function goPage(url,mCode){
	if (typeof(history.pushState) == 'function') {
		var renewURL = location.href;
		
		var param = "";
		if(mCode == 'M010200'){
			if(renewURL.includes('currentPage=')){
				console.log(renewURL);
      			param = renewURL.substring(renewURL.indexOf(".do")+4);
      			param = param.substring(param.lastIndexOf('mCode=')+13);
	   			renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);
      		}else{
	   			renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);
      		}
		}else{
   			renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);
		}
		
		if (mCode != 'M000000') {
	        renewURL += "?mCode="+mCode+param;
	        if($('.'+mCode)){
	        	var upcode = $('.'+mCode).attr('upcode')
	        	$('.'+upcode).addClass('menu-is-opening').addClass('menu-open');
	        	
	        	upcode = $('.'+upcode).attr('upcode');
	        	if($('.'+upcode)){
	        		$('.'+upcode).addClass('menu-is-opening').addClass('menu-open');
	        	}
	        }
	    }
	    history.pushState(mCode, null, renewURL);
	 
	} else {
	    location.hash = "#"+mCode;
	}
	$('iframe[name="ifr"]').attr("src","<%=request.getContextPath()%>"+url);
}
</script>

<!-- handlebars  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script type="text/x-handlebars-template"  id="subMenu-list-template" >
{{#each .}}
  <li class="nav-item subMenu">
    <a href="#" class="nav-link">
      <i class=""></i>
      <p>{{mname}}</p>
    </a>
  </li> 
{{/each}}
</script>
<script>
window.onload=function(){
	goPage('${menu.url}','${menu.mcode}');
// 	subMenu('${menu.mcode}'.substring(0,3)+"0000");
}
</script>

</body>
