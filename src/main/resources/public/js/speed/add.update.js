layui.use(['form', 'layer'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery;

    /**
     * 关闭弹出层
     *
     */
    $("#closeBtn").click(function (){
        var index = parent.layer.getFrameIndex(window.name);// 得到当前iframe层的索引
        parent.layer.close(index);// 执行关闭
    });

    form.on('submit(addOrUpdateSaleChance)',function (data) {
        console.log(data.field);

        if (isNaN(data.field.codeSpStart) || isNaN(data.field.codeSpEnd) || isNaN(data.field.videoSpStart) || isNaN(data.field.videoSpEnd)){
            layer.msg("视频进度或代码进度只能填写数字！");
            return false;
        }

        if (data.field.codeSpEnd<data.field.codeSpStart || data.field.videoSpEnd<data.field.videoSpStart){
            layer.msg("进度截止不能小于进度起始！");
            return false;
        }

        var index= top.layer.msg("数据提交中,请稍后...",{icon:16,time:false,shade:0.8});
        var url = ctx+"/crew/insert";
        var speedId=$("input[name='id']").val();
        if(speedId !=null && speedId != ''){
            url=ctx+"/crew/update";
        }

        console.log(data.field);

        $.post(url,data.field,function (res) {
            if(res.code==200){
                top.layer.msg("操作成功");
                top.layer.close(index);
                layer.closeAll("iframe");
                // 刷新父页面
                parent.location.reload();
            }else{
                layer.msg(res.msg);
            }
        });
        return false;
    });

});