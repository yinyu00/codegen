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
                           onblur="" th:value='${r"$"}{${table.NameFL}?.${column.colNameFL}}' />
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
            console.log("record id is " + $('#<#list columns as column><#if column.primaryKey>${column.colNameFL}</#if></#list>').val());

            $.ajax({
                url : '/${table.NameFL}',
                type: $('#<#list columns as column><#if column.primaryKey>${column.colNameFL}</#if></#list>').val()==="" ? "POST" : "PUT",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify({
                <#list columns as column>
                    "${column.colNameFL}": $('#${column.colName}').val(),
                </#list>
                })//数据转换成JSON格式
            }).done(function (resp) {
                let data = eval(resp);
                console.log(data);
                if (data.code==="000000") {
                    reload();
                    $('#${table.NameFL}Info').window('close');
                }
            });
        });
        $('#btn_cancel_${table.NameFL}').bind('click', function() {
            $('#${table.NameFL}Info').window('close');
        });
    });

</script>

</body>
</html>