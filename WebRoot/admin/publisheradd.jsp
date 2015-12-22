<%@ page contentType="text/html; charset=GB2312" errorPage="error.jsp" pageEncoding="UTF-8"%>

<div align="center" class="main">
<table width="900" border="0" cellspacing="1" cellpadding="1">
  <tr> 
    <td ><div align="center"><%@include file="top.jsp" %></div></td>
  </tr>
  <tr> 
    <td ><div align="center">
	      <table width="80%" border="0" cellpadding="1" cellspacing="1" class="td">
		  <form name="form" action="addPublisher" method="post" >
            <tr> 
              <td>出版社名</td>
              <td><input name="publishername" type="text" size="25" ></td>
            </tr>
            <tr> 
              <td>联系人</td>
              <td><input name="linkname" type="text" size="25" ></td>
            </tr>
            <tr> 
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
              <td>网址</td>
              <td><input name="website" type="text" size="25" ></td>
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