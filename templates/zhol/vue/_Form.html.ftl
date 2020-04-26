<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div style="padding:10px">
    <form id="${table.NameFL}Form" method="post">
        <table>
            <#list columns as column>
            <#if column.primaryKey == false>
            <tr>
                <td><label for="${column.colName}">${column.comments}:</label></td>
                <td>
                    <input class="easyui-validatebox" type="text"
                           name="${column.colName}" id="${column.colName}" data-options="required:<#if column.nullable="YES">false<#else>true</#if>"
                           onblur="" th:value='${r"$"}{${table.NameFL}?.${column.colName}}' />
                </td>
            </tr>
            </#if>
            </#list>

            <tr>
                <td colspan="2" align="right">
                    <a id="btn_save_${table.NameFL}"   href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">确定</a>
                    <a id="btn_cancel_${table.NameFL}" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
                    <input type="hidden" name="<#list columns as column><#if column.primaryKey>${column.colNameFL}</#if></#list>" id="<#list columns as column><#if column.primaryKey>${column.colNameFL}</#if></#list>"
                           th:value="${r"$"}{${table.NameFL}?.<#list columns as column><#if column.primaryKey>${column.colNameFL}</#if></#list>}" />
                </td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript">
    $(function() {
        if ($('#<#list columns as column><#if column.primaryKey>${column.colNameFL}</#if></#list>').val() != '') {
            //$('#').attr('readonly','readonly'); //jquery1.6以下
            //$('#').prop("readonly", true);
            //$('#').css("background-color", "#eeeeee");
        }
        $('#btn_save_${table.NameFL}').bind('click', function() {
            alert($('#uid').val())
            $.ajax({
                url : '/user',
                type: $('#uid').val()==undefined ? "POST" : "PUT",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify({
                <#list columns as column>
                <#if column.primaryKey == false>
                    "${column.colName}": $('#${column.colName}').val(),
                </#if>
                </#list>
                })//数据转换成JSON格式
            }).done(function (data) {
                var data = eval('(' + data + ')');
                console.log(data.msg);
                if (data.code=="000000") {
                    $("#userGrid").datagrid("load", {
                        // uid : $('#uid').val(),
                        // username : $('#username').val(),
                        // email : $('#email').val(),
                        // mobile : $('#mobile').val(),
                        // union_id : $('#union_id').val(),
                        // password : $('#password').val(),
                        // enable_flag : $('#enable_flag').val(),
                        // certificate_type : $('#certificate_type').val(),
                        // certificate_no : $('#certificate_no').val(),
                        // create_date : $('#create_date').val(),
                        // wechat_qrcode_fid : $('#wechat_qrcode_fid').val(),
                        // wechat_head_image_url : $('#wechat_head_image_url').val(),
                        // wechat_nickname : $('#wechat_nickname').val(),
                        // mobile_visible_flag : $('#mobile_visible_flag').val(),
                    });
                    $('#userInfo').window('close');
                }
            }).fail(function () {
            });
        });
        $('#btn_cancel_${table.NameFL}').bind('click', function() {
            $('#${table.NameFL}Info').window('close');
        });
    });

</script>

</body>
</html>