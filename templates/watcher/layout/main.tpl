{{* 主要的模板父类 *}}
<!DOCTYPE html>
<html>
<head>
    <title>{{$title|default:'守望者舆情监控系统'}}</title>
    <link rel="stylesheet" href="{{$base}}watcher/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="{{$base}}watcher/static/css/main.css">

    <script src="{{$base}}watcher/static/js/jquery.min.js"></script>
    <script src="{{$base}}watcher/static/js/echarts/echarts.js"></script>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-default navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="/" tabindex="-1">守望者</a>
        </div>

        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="/watcher/country" tabindex="-1">情绪趋势</a></li>
            <li><a href="/watcher/user" tabindex="-1">传播用户</a></li>
            <li><a href="/watcher/map" tabindex="-1">传播地图</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li class="navbar-form" role="search">
              <div class="input-group">
                <input id="searchInput" type="text" class="form-control nav-item-dark" placeholder="Search" tabindex="1">
                <span class="input-group-btn">
                  <button id="searchButton" class="btn btn-default nav-item-dark" tabindex="-1">搜索</button>
                </span>
              </div>
            </li>
            <li><a href="/about" tabindex="-1">关于</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div>
    </nav>

    {{block name=content}}{{/block}}

</div>

<footer class="stick-bottom">
  <div class="container">
    <p class="text-center">Designed and built with all the love in the world by <a href="mailto:zhang1437@gmail.com" tabindex="-1">Yuri</a> at <a href="http://www.xmu.edu.cn" target="_blank" tabindex="-1">XMU</a></p>
  </div>
</footer>

<script src="{{$base}}watcher/static/js/bootstrap.min.js"></script>

</body>
</html>