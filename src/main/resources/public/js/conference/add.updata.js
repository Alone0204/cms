layui.use(['form','laydate','layer'], function () {
    var laydate = layui.laydate;
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery;



    /**
     * 关闭弹出框
     */
    $("#closeBtn").click(function (){
        //当你在iframe页面关闭自身时
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭
    });

    //时间选择器
    laydate.render({
        elem: '#createTime'
        ,type: 'datetime'
        ,min: new Date().toLocaleString()
        ,max: 2 //2天后
        ,trigger: 'click'
    });
    //时间选择器
    laydate.render({
        elem: '#endTime'
        ,type: 'datetime'
        ,min: new Date().toLocaleString()
        ,max: 2 //2天后
        ,trigger: 'click'
    });


    //提交按钮监听
    form.on("submit(addOrUpdate)", function (data) {
        console.log(data)
        var index = top.layer.msg('数据提交中，请稍候', {
            icon: 16, //图标
            time: false,
            shade: 0.8
        });

        var url=ctx + "/conference/toAddOrUpdate";

        //post提交方式
        $.post(url, data.field, function (res) {
            //登录成功
            if (res.code == 200) {
                top.layer.msg("操作成功！",{icon:6});
                top.layer.close(index);
                //关闭弹出层
                layer.closeAll("iframe");
                //刷新父页面
                parent.location.reload();
            } else {
                layer.msg(
                    res.msg, {
                        icon: 5
                    }
                );
            }
        });
        //阻止表单提交
        return false;
    });

    /**
     * 加载下拉框-会议房间
     */
    $.ajax({
        type:"post",
        url: ctx+"/conference/queryAllRoom",
        data:{},
        success:function (data){
            if (data!=null){
                var opt=null;
                for (var i=0;i<data.length;i++){
                    if ($("[name='roomNumber']").val()==data[i]){
                        opt="<option  selected>"+data[i] +"</option>";
                    }else {
                        opt="<option >"+data[i] +"</option>";
                    }
                    $("#roomNumber").append(opt);
                }
            }
            //重新渲染下拉框
            layui.form.render("select")
        }
    })
    /**
     * 加载下拉框-等级
     */
    $.ajax({
        type:"post",
        url: ctx+"/conference/queryAllRank",
        data:{},
        success:function (data){
            if (data!=null){
                //当隐藏域id与循环id相同时设置选中
                var opt=null;
                var value=null;
                for (var i=0;i<data.length;i++){
                    if (data[i]==1){
                        value="班级会议"
                    }else {
                        value="小组会议"
                    }
                    if ($("[name='rankId']").val()==data[i]){
                        opt="<option selected value='"+data[i]+"'>"+value+"</option>";
                    }else {
                        opt="<option value='"+data[i]+"'>"+value+"</option>";
                    }
                    $("#rank").append(opt);
                }
            }
            //重新渲染下拉框
            layui.form.render("select")
        }
    })



});