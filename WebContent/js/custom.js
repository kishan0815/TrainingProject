
document.getElementById("nameAlert").style.display = "none";
document.getElementById("emailAlert").style.display = "none";
document.getElementById("passwordAlert").style.display = "none";
document.getElementById("lemailAlert").style.display = "none";
document.getElementById("lpasswordAlert").style.display = "none";
document.getElementById("regButton").disabled = true;
document.getElementById("loginButton").disabled = true;

var b1=false;
var b2=[false,false];
var b3=[false,false];


function validateName(id,alertId){	
	if(document.getElementById(id).value.length == 0){
		document.getElementById(alertId).style.display = "inline-block";
		document.getElementById(alertId).style.padding = 0;
		document.getElementById(alertId).innerHTML = "Name is required"
		b1=false;
		enableRegisterButton();
	}
	else{
		document.getElementById(alertId).style.display = "none";
		b1=true;
		enableRegisterButton();
	}
}
function validateEmail(id,alertId,status){	
	var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if(document.getElementById(id).value.length == 0){
		document.getElementById(alertId).style.display = "inline-block";
		document.getElementById(alertId).style.padding = 0;
		document.getElementById(alertId).innerHTML = "Email is required"
		b2[status]=false;
		if(status == 0){
			enableRegisterButton();
		}
		else{
			enableLoginButton()
		}
	}
	else{
		document.getElementById(alertId).style.display = "none";
		var email = document.getElementById(id).value;
		if(!re.test(String(email).toLowerCase())){
			document.getElementById(alertId).style.padding = 0;
			document.getElementById(alertId).style.display = "inline-block";
			document.getElementById(alertId).innerHTML = "Invalid Email"
			b2[status]=false;
			if(status == 0){
				enableRegisterButton();
			}
			else{
				enableLoginButton()
			}
	    }
		else{
			document.getElementById(alertId).style.display = "none";
			b2[status] = true;
			if(status == 0){
				enableRegisterButton();
			}
			else{
				enableLoginButton()
			}
		}
	}
}
function validatePassword(id,alertId,status){	
	if(document.getElementById(id).value.length == 0){
		document.getElementById(alertId).style.display = "inline-block";
		document.getElementById(alertId).style.padding = 0;
		document.getElementById(alertId).innerHTML = "Password is required"
		b3[status]=false;
		if(status == 0){
			enableRegisterButton();
		}
		else{
			enableLoginButton()
		}
	}
	else{
		document.getElementById(alertId).style.display = "none";
		b3[status]=true;
		if(status == 0){
			enableRegisterButton();
		}
		else{
			enableLoginButton()
		}
	}
}
function enableRegisterButton(){
	if(b1 && b2[0] && b3[0]){
		document.getElementById("regButton").disabled = false;
	}
	else{
		document.getElementById("regButton").disabled = true;
	}
}
function enableLoginButton(){
	if(b2[1] && b3[1]){
		document.getElementById("loginButton").disabled = false;
	}
	else{
		document.getElementById("loginButton").disabled = true;
	}
}