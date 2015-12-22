<%@ page contentType="text/html; charset=GB2312" errorPage="../error.jsp" %>

<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
  <tr> 
    <td ><div align="center">
	      <table width="80%" border="0" cellpadding="1" cellspacing="1" class="td">
		  <form name="form" action="addEmployee" method="post" >
            <tr> 
              <td width="20%">职工帐号</td>
              <td><input name="employeeid" type="text"  size="25" ></td>
            </tr>
            <tr> 
              <td>姓名</td>
              <td><input name="name" type="text" size="25" ></td>
            </tr>
            <tr> 
              <td>密码</td>
              <td><input name="password" type="text" size="25" ></td>
            </tr>
            <tr> 
              <td>性别</td>
              <td>              
			  <select name="gender" >
			  <option value="男" >男</option>
			  <option value="女" >女</option>
			  </select></td>
            </tr>
            <tr> 
              <td>联系地址</td>
              <td><input name="address" type="text" size="25" ></td>
            </tr>
            <tr> 
              <td>E-mail</td>
              <td><input name="email" type="text" size="25" ></td>
            </tr>
            <tr> 
              <td>电话</td>
              <td><input name="phone" type="text" size="25" ></td>
            </tr>
            <tr> 
              <td>工作任务</td>
              <td><input name="task" type="text" size="25" ></td>
            </tr>
            <tr> 
              <td colspan="2"><div align="center">
                  <input type="submit" value=" 新建 ">&nbsp;&nbsp;&nbsp;&nbsp;
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div></td>
            </tr>
			</form>
          </table>

	</div></td>
  </tr>  
  <tr> 
    <td ><div align="center">
          <%@include file="../bottom.jsp" %>
        </div></td>
  </tr>
</table>
</div> 