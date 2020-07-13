<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style>
.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

.active, .accordion:hover {
  background-color: #ccc;
}

.accordion:after {
  content: '\002B';
  color: #777;
  font-weight: bold;
  float: right;
  margin-left: 5px;
}

.active:after {
  content: "\2212";
}

.panel {
  padding: 0 18px;
  background-color: white;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
}
</style>
<title>�Խ���</title>
</head>
<body>

<!-- �ϴ� �ǰ� �Ǵ� ���� �Ű� - ���ڵ��޴� -->
<button class="accordion">
	<p>Ȩ�������� ���� ����/���ǻ����� ������ �Ʒ��� �����ּ���. �ش� �������� �����ڿ��� ���޵˴ϴ�.<br> 
	- <strong>�������� �� �Խ����� �Խ� ���뿡 ���� ����</strong>�� �ش� �Խù��� ǥ��� ����ó�� ���μ�(VOC)�� ������ �ֽñ� �ٶ��ϴ�. </p>
</button>
	
<div class="panel">
	<span>�ǰ� �Ǵ� �����Ű� </span>
	<textarea rows="10" cols="15" id="ir1" name="content" style="width:400px; height:40px; "> �α��� �� �ۼ��� �����մϴ�. </textarea>
	<button>����</button>
</div>

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
</script>
</body>
</html>