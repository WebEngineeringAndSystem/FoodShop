function checkUser(userNode)
{
	var name = userNode.value;
	
	var namereg = new RegExp("^[a-zA-Z0-9]{5,12}$");
	
	var spanNode = document.getElementById("userspan");
	
	if(name.match(namereg))
		spanNode.innerHTML = "".fontcolor("#0f0");
	else
		spanNode.innerHTML = "用户名错误".fontcolor("red");
}

var psw;
function checkPsw(pswNode)
{
	psw = pswNode.value;
	
	var pswreg = new RegExp("^[a-zA-Z0-9]{5,12}$");
	
	var spanNode = document.getElementById("pawspan");
	
	if(psw.match(pswreg))
		spanNode.innerHTML = "".fontcolor("green");
	else
		spanNode.innerHTML = "密码错误".fontcolor("red");
}

function checkRepsw(repswNode)
{
	var repsw = repswNode.value;
	
	var spanNode = document.getElementById("repswspan");
	if(repsw==psw)
		spanNode.innerHTML = "".fontcolor("green");
	else
		spanNode.innerHTML = "两次密码不一致".fontcolor("red");
}

function checkMail(mailNode)
{
	var mail = mailNode.value;
	
	var mailreg = RegExp("\\w+@\\w+(\\.\\w)+");
	var spanNode = document.getElementById("mailspan");
	
	if(mail.match(mailreg))
		spanNode.innerHTML = "".fontcolor("green");
	else
		spanNode.innerHTML = "请输入正确的邮箱".fontcolor("red");	
}

function checkmit(mitNode)
{
	var mit =mitNode.value;
	var spanNode = document.getElementById("mitspan");
	spanNode.innerHTML = "123123".fontcolor("red");	

}

function checkForm()
{
	var form = document.forms[0];
	
	with(form)
	{
		if(checkUser(user))
			return true;
		else
			return false;
	}
}