<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/menu2.css" />
</head>
<body>
<title>�Խ���</title>
</head>
<body>
<!-- �Խ��� -->
<div id="menu1" class="tabcontent">
	<div class="listinfo1">
		<span>��ü 1248 | ������ 1/84 </span>
	</div>
	<div class="listinfo2">	
		<span>����:</span>
		<a href="#" >������</a>
		<a href="#" >�ۼ���</a>
	</div>	
	<br><br>
	
	<!-- �Խ��� -->
	<table id="myTable">
		<colgroup>
			<col style="width:40%;" />
			<col style="width:5%;" />
			<col style="width:5%;" />
			<col style="width:20%;" />
			<col style="width:20%;" />		
		</colgroup>
		<thead>
		  <tr>
		  		<th scope="col">����</th>
		    	<th scope="col">��ȣ</th>
		    	<th scope="col">�з�</th>
		    	<th scope="col">�ۼ���</th>
		    	<th scope="col">�ۼ���</th>
		  		<th scope="col">��ȸ��</th>
		  </tr>
		</thead> 
		<tbody>
			<tr>
				<td class="">[�����н����߼���] ����ο� ���л�Ȱ - CTL Letter 7��ȣ</td>
				<td class="">NO.1</td>
				<td class="">����</td>
				<td class="">�̷��������ſ� �����н����߼��� ȫ�浿 </td>
				<td class="">2020-07-11</td>
				<td class="">452</td>
			</tr>
			
			<tr>
				<td class="">[�����н����߼���] ����ο� ���л�Ȱ - CTL Letter 7��ȣ</td>
				<td class="">NO.1</td>
				<td class="">����</td>
				<td class="">�̷��������ſ� �����н����߼��� ȫ�浿 </td>
				<td class="">2020-07-11</td>
				<td class="">452</td>
			</tr>
			
			<tr>
				<td class="">[�����н����߼���] ����ο� ���л�Ȱ - CTL Letter 7��ȣ</td>
				<td class="">NO.1</td>
				<td class="">����</td>
				<td class="">�̷��������ſ� �����н����߼��� ȫ�浿 </td>
				<td class="">2020-07-11</td>
				<td class="">452</td>
			</tr>	
			
			<tr>
				<td class="">[�����н����߼���] ����ο� ���л�Ȱ - CTL Letter 7��ȣ</td>
				<td class="">NO.1</td>
				<td class="">����</td>
				<td class="">�̷��������ſ� �����н����߼��� ȫ�浿 </td>
				<td class="">2020-07-11</td>
				<td class="">452</td>
			</tr>			
	 </tbody>
	</table>
</div>	
	
<br><br>
<!-- ��������ȣ -->
<div class="divPage">
	<< < 1 2 3 4 5 > >>
</div>

<br><br>
<!-- �˻� -->
<div class="divSearch">
   	<form name="frmSearch" method="post" action="">
        <select name="search">
            <option value="title">����</option>
            <option value="content">����</option>
            <option value="name">�ۼ���</option>
        </select>   
        
        <input type="text" name="searchKeyword" title="�˻�">   
		<input type="submit" value="�˻�"><br><br>
    
    	<strong>�α�˻��� :</strong> ���� , ���� , ���� , �ܼҸ� 
   </form>
</div>

<script>
function myFunction() {
  var filter, table, tr, td, i, txtValue;
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
</body>
</html>