<%--
  Created by IntelliJ IDEA.
  User: 86150
  Date: 2022/11/9
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>message</title>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p class="fs-1 text-warning text-center">我 的 留 言</p>
<div class="container">
  <form action="/demo2_war_exploded/message" class="needs-validation" novalidate>
    <div class="form-group">
      <label  class="h2" for="uname">标题</label>
      <input type="text" class="form-control" id="uname" placeholder="Enter title" name="title" required>
      <div class="valid-feedback">验证成功！</div>
      <div class="invalid-feedback">请输入标题！</div>
    </div>
    <div class="form-group">
      <label class="h3" for="pwd">内容</label>
      <textarea  class="form-control" id="pwd" placeholder="Enter text" name="text" required></textarea>
      <div class="valid-feedback">验证成功！</div>
      <div class="invalid-feedback">请输入内容！</div>
    </div>
    <div class="row">&nbsp;</div>
    <button type="submit" class="btn btn-primary">提交</button>
  </form>
</div>

<script>
  // 如果验证不通过禁止提交表单
  (function() {
    'use strict';
    window.addEventListener('load', function() {
      // 获取表单验证样式
      var forms = document.getElementsByClassName('needs-validation');
      // 循环并禁止提交
      var validation = Array.prototype.filter.call(forms, function(form) {
        form.addEventListener('submit', function(event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  })();
</script>

</body>
</html>
