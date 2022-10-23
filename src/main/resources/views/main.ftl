<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>CMS-班级管理系统</title>
    <#include "common.ftl">
</head>
<body class="layui-layout-body layuimini-all">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header header">
        <div class="layui-logo">
            <a href="">
                <img src="images/logo.png" alt="logo">
                <h1>CMS-班级管理</h1>
            </a>
        </div>
        <a>
            <div class="layuimini-tool"><i title="展开" class="fa fa-outdent" data-side-fold="1"></i></div>
        </a>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item mobile layui-hide-xs" lay-unselect>
                <a href="javascript:;" data-check-screen="full"><i class="fa fa-arrows-alt"></i></a>
            </li>
            <li class="layui-nav-item layuimini-setting">
                <a href="javascript:;">${(user.trueName)!""}</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" data-iframe-tab="${ctx}/user/toSettingPage" data-title="基本资料" data-icon="fa fa-gears">基本资料</a>
                    </dd>
                    <dd>
                        <a href="javascript:;" data-iframe-tab="${ctx}/user/toPasswordPage" data-title="修改密码" data-icon="fa fa-gears">修改密码</a>
                    </dd>
                    <dd>
                        <a href="javascript:;" class="login-out">退出登录</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item layuimini-select-bgcolor mobile layui-hide-xs" lay-unselect>
                <a href="javascript:;"></a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll layui-left-menu">
            <#if roles??>
            <ul class="layui-nav layui-nav-tree layui-left-nav-tree layui-this" id="currency">
                <#if roles?seq_contains(10)>
                <li class="layui-nav-item">
                    <a href="javascript:;" class="layui-menu-tips"><i class="fa fa-street-view"></i><span class="layui-left-nav"> 班级服务</span> <span class="layui-nav-more"></span></a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-1" data-tab="bug/index" target="_self"><i class="fa fa-tty"></i><span class="layui-left-nav"> bug集锦</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-2" data-tab="brush/index" target="_self"><i class="fa fa-ellipsis-h"></i><span class="layui-left-nav"> 快乐刷题</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-5" data-tab="crew/speed" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 进度汇总</span></a>
                        </dd>
                        <dd class="">
                            <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-13" data-tab="user/myq" target="_self"><i class="layui-icon layui-icon-face-smile"></i><span class="layui-left-nav"> 摸鱼圈</span></a>
                        </dd>
                    </dl>
                </li>
                </#if>
                <#if roles?seq_contains(20)>
                <li class="layui-nav-item">
                    <a href="javascript:;" class="layui-menu-tips"><i class="fa fa-flag"></i><span class="layui-left-nav"> 会议管理</span> <span class="layui-nav-more"></span></a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-3" data-tab="conferenceRoom/index" target="_self"><i class="fa fa-handshake-o"></i><span class="layui-left-nav"> 会议室</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-4" data-tab="conference/index" target="_self"><i class="fa fa-calendar-plus-o"></i><span class="layui-left-nav"> 会议预约</span></a>
                        </dd>
                        <dd>
                            <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-4" data-tab="conferenceQuestions/index" target="_self"><i class="fa fa-user-o"></i><span class="layui-left-nav"> 我的会议</span></a>
                        </dd>
                    </dl>
                </li>
                </#if>
                <#if roles?seq_contains(30)>
                <li class="layui-nav-item">
                <a href="javascript:;" class="layui-menu-tips"><i class="fa fa-home"></i><span class="layui-left-nav"> 统计报表</span> <span class="layui-nav-more"></span></a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-10" data-tab="dataAnalysis/toDataAnalysis" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 数据分析</span></a>
                    </dd>
                </dl>
            </li>
                </#if>
                <#if roles?seq_contains(40)>
                <li class="layui-nav-item">
                        <a href="javascript:;" class="layui-menu-tips"><i class="fa fa-gears"></i><span class="layui-left-nav"> 系统设置</span> <span class="layui-nav-more"></span></a>
                        <dl class="layui-nav-child">
                                <dd>
                                    <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-11" data-tab="user/index" target="_self"><i class="fa fa-user"></i><span class="layui-left-nav"> 学生管理</span></a>
                                </dd>
                                <dd class="">
                                    <a href="javascript:;" class="layui-menu-tips" data-type="tabAdd" data-tab-mpi="m-p-i-12" data-tab="role/index" target="_self"><i class="fa fa-tachometer"></i><span class="layui-left-nav"> 角色管理</span></a>
                                </dd>
                        </dl>
                    </li>
                </#if>
                <span class="layui-nav-bar" style="top: 201px; height: 0px; opacity: 0;"></span>
            </ul>
            </#if>
        </div>
    </div>

    <div class="layui-body">
        <div class="layui-tab" lay-filter="layuiminiTab" id="top_tabs_box">
            <ul class="layui-tab-title" id="top_tabs">
                <li class="layui-this" id="layuiminiHomeTabId" lay-id="user/status"><i class="fa fa-home"></i> <span>首页</span></li>
            </ul>

            <ul class="layui-nav closeBox">
                <li class="layui-nav-item">
                    <a href="javascript:;"> <i class="fa fa-dot-circle-o"></i> 页面操作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" data-page-close="other"><i class="fa fa-window-close"></i> 关闭其他</a></dd>
                        <dd><a href="javascript:;" data-page-close="all"><i class="fa fa-window-close-o"></i> 关闭全部</a></dd>
                    </dl>
                </li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div id="layuiminiHomeTabIframe" class="layui-tab-item layui-show">
                </div>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript" src="${ctx}/js/main.js"></script>
</body>
</html>
