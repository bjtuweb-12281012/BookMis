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
              <td width="20%">ְ���ʺ�</td>
              <td><input name="employeeid" type="text"  size="25" ></td>
            </tr>
            <tr> 
              <td>����</td>
              <td><input name="name" type="text" size="25" ></td>
            </tr>
            <tr> 
              <td>����</td>
              <td><input name="password" type="text" size="25" ></td>
            </tr>
            <tr> 
              <td>�Ա�</td>
              <td>              
			  <select name="gender" >
			  <option value="��" >��</option>
			  <option value="Ů" >Ů</option>
			  </select></td>
            </tr>
            <tr> 
              <td>��ϵ��ַ</td>
              <td><input name="address" type="text" size="25" ></td>
            </tr>
            <tr> 
              <td>E-mail</td>
              <td><input name="email" type="text" size="25" ></td>
            </tr>
            <tr> 
              <td>�绰</td>
              <td><input name="phone" type="text" size="25" ></td>
            </tr>
            <tr> 
              <td>��������</td>
              <td><input name="task" type="text" size="25" ></td>
            </tr>
            <tr> 
              <td colspan="2"><div align="center">
                  <input type="submit" value=" �½� ">&nbsp;&nbsp;&nbsp;&nbsp;
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