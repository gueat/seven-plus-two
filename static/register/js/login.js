$(function(){
	$("#fxdc").on({
		"mouseenter":function(){
			$(".fxdc_left").css("display","block");
		},
		"mouseleave":function(){
			$(".fxdc_left").css("display","none");
		}
	})

	var flag1 = false;
	var flag2 = false;
	
	$(".sub").on("click",function(){
		if(!($("#txt input").val())){
			$("#txt i").css("display","block");
			$("#txt input").css("border","solid 1px red");
		}
		else{
			$("#txt i").css("display","none");
			$("#txt input").css("border","");
			flag1 = true;
		}
		if(!($("#psd input").val())){
			$("#psd i").css("display","block");
			$("#psd input").css("border","solid 1px red");
		}
		else{
			$("#psd i").css("display","none");
			$("#psd input").css("border","");
			flag2 = true;
		}
		
		
		
	})
	$("#txt input").keyup(function(){
		$("#txt i").css("display","none");
		$("#txt input").css("border","");
	})
	$("#psd input").keyup(function(){
		$("#psd i").css("display","none");
		$("#psd input").css("border","");
	})
	
	$(".sub").click(function(){
		if (flag1 && flag2){
			$('form').submit();
			console.log("提交")
		} else {
			$("#psd i").css("display","block");
		}
	})
	

})