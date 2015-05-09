{{* 首页 *}}
{{block name=content}}
<script type="text/javascript">
    $("ul.navbar-nav li[role!='about']").html('');{{*清除导航栏中原本的搜索框*}}
    // $("ul.navbar-right li[role='search']").html('');{{*清除导航栏中原本的搜索框*}}
</script>
<div class="row text-center head-title">
    <h1>守望者舆情监控&nbsp<small>v0.1</small></h1>
    <p>Yuri</p>
</div>

{{* 搜索框 *}}
<div class="row center-block" style="width: 40%;">
    <form class="input-group" action="/watcher/country" method="get">
      <input name="topic" type="text" class="form-control nav-item-dark" placeholder="微博话题" tabindex="1">
      <span class="input-group-btn">
        <button class="btn btn-default nav-item-dark" tabindex="-1">搜索</button>
      </span>
    </form>
    <ul class="list-inline" style="margin-top: 10px;">
      {{foreach from=$hotTopic item=item key=key name=name}}
        <li><a class="label label-default" style="background-color: #222;color: #9d9d9d;" href="/watcher/country?topic={{$item}}">{{$item}}</a></li>
      {{/foreach}}
    </ul>
</div>

<div cl>

</div>

{{* 全国整体情绪展示 *}}
<div class="row text-center">
    <h4 id="chartTitle" style="z-index: 2;position: absolute; margin: 5% 0 0 47%;display: none;">实时情绪概况</h4>
</div>
<di class="row" style="z-index: 1;">
    <div class="center-block" id="wholeCountry" style="height: 500px;width: 50%;"></div>
</div>
<script type="text/javascript">
require.config({
    paths: {
        echarts: '.{{$base}}watcher/static/js/echarts'
    }
});

require(
    [
        'echarts',
        'echarts/chart/map'
    ],
    function(ec) {
        var option = {
            title: {
                show: false,
                text: '实时情绪概况',
                subtext: '',
                x: 'center',
                y: '50',
                textStyle: {
                    fontSize: 25,
                    fontWeight: 'bolder',
                    color: '#9d9d9d'
                }
            },
            dataRange: {
                show: false,
                min: -100,
                max: 100,
                x: 1000,
                y: 'center',
                text: ['高', '低'], // 文本，默认为数值文本
                calculable: true,
                color: ['green', '#9d9d9d', 'red']
            },
            series: [{
                name: '测试数据',
                type: 'map',
                mapType: 'china',
                hoverable: false,
                dataRangeHoverLink: false,
                mapValueCalculation: 'average',
                roam: false, //首页概况图禁止缩放
                itemStyle: {
                    normal: {
                        label: {
                            show: true
                        }
                    },
                    emphasis: {
                        label: {
                            show: true
                        }
                    }
                },
                data: [{
                    name: '山西',
                    value: 50
                },{
                    name: '福建',
                    value: -50
                },{
                    name: '四川',
                    value: 0
                }]
            }]
        };

        var chart = ec.init(document.getElementById('wholeCountry'));
        chart.setOption(option);

        $('#wholeCountry').mouseenter(function(){
            $('#chartTitle').stop(true).fadeIn("slow");
        }).mouseleave(function(){
            $('#chartTitle').stop(true).fadeOut("slow");
        });
    });
</script>
{{/block}}
