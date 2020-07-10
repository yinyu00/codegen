<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${table.comments}</title>
</head>
<body>
<div class="easyui-layout" fit="true" border="false">
    <div data-options="region:'north',title:'查询'"
         style="height: 70px; background: #F4F4F4;">
        <form id="${table.NameFL}SearchForm">
            <table>
                <tr>
                    <!--
                    <#list columns as column>
                    <th>${column.comments}:</th>
                    <td>
                        <input name="${column.colName}Param" id="${column.colName}Param" />
                    </td>
                    </#list>
                    -->
                    <td>
                        <a href="#" id="btn_search_${table.NameFL}" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',split:false">
        <table id="${table.NameFL}Grid">
        </table>
    </div>
</div>

<div id="${table.NameFL}Info"></div>

<script type="text/javascript">
    $(function() {
        $("#${table.NameFL}Grid").datagrid({
            url : "/${table.NameFL}/list",
            loader: function (param, success, error) {
                //console.log(param, success, error);
                $.ajax({
                    type: "POST",
                    url : '/${table.NameFL}/list',
                    contentType: "application/json",
                    dataType: "json",
                    data: JSON.stringify(param)//数据转换成JSON格式
                }).done(function (data) {
                    if (data.code==='000000') {
                        success(data);
                    }
                    else {
                        $.messager.alert('加载数据失败');
                        error();
                    }
                }).fail(function () {
                    $.messager.alert('加载数据失败');
                });
            },
            iconCls : "icon-add",
            fitColumns : false,
            <#list columns as column>
                <#if column.primaryKey>
            idField : '${column.colNameFL}',
            sortName : '${column.colNameFL}',
                </#if>
            </#list>
            loadMsg : "正在努力为您加载数据",
            pagination : true,
            rownumbers : true,
            pageSize : 10,
            pageList : [ 10, 20, 30 ],
            sortOrder : "asc",
            singleSelect : true,
            remoteSort : false,
            columns : [
                [
                    <#list columns as column>
                    {
                        field : '${column.colNameFL}',
                        title : '${column.comments}',
                        width : 100,
                        //hidden : true,
                        //sortable : true,
                        //formatter : function(value, row, index) {return value;},
                    },
                    </#list>
                ]
            ],
            toolbar : [
                {
                    text : "添加",
                    iconCls : "icon-add",
                    handler : function() {
                        show${table.NameFU}Info("");
                    }
                },
                '-',
                {
                    text : "修改",
                    iconCls : "icon-edit",
                    handler : function() {
                        row = getSelected();
                        if (row) {
                            show${table.NameFU}Info(row.<#list columns as column><#if column.primaryKey>${column.colNameFL}</#if></#list>);
                        }
                    }
                },
                '-',
                {
                    text : "删除",
                    iconCls : "icon-del",
                    handler : function() {
                        del${table.NameFU}Info();
                    }
                }
            ]
        });

        $('#btn_search_${table.NameFL}').bind('click', function() {
            reload();
        });
    });

    var p = $('#${table.NameFL}Grid').datagrid('getPager');
    $(p).pagination({
        pageSize : 10,
        pageList : [ 10, 20, 30 ],
        beforePageText : '第',
        afterPageText : '页    共 {pages} 页',
        displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
    });

    function show${table.NameFU}Info(id) {
        $('#${table.NameFL}Info').dialog({
            title : '新增/修改用户信息',
            width : 480,
            height : 600,
            closed : true,
            cache : false,
            href : '/${table.NameFL}/page/${table.NameFL}Form?id=' + id,
            modal : true
        });
        $('#${table.NameFL}Info').window('open');
    }

    //选择行
    function getSelected() {
        var row = $('#${table.NameFL}Grid').datagrid('getSelected');
        if (!row) {
            alert("请选择数据");
            return;
        } else
            return row;
    }

    //删除行
    function del${table.NameFU}Info() {
        var row = $('#${table.NameFL}Grid').datagrid('getSelected');
        if (!row) {
            alert("请选择数据");
        } else {
            if(confirm("确定要删除选中记录么？")){
                $.ajax({
                    type: "DELETE",
                    url : '/${table.NameFL}/' + row.<#list columns as column><#if column.primaryKey>${column.colNameFL}</#if></#list>,
                    contentType: "application/json",
                    dataType: "json"
                }).done(function (data) {
                    reload();
                }).fail(function () {
                });
            }
        }
    }

    function reload() {
        let loadParam = {};
        <#list columns as column>
        // if($('#${column.colNameFL}Param').val())  loadParam["${column.colNameFL}"] = $('#${column.colNameFL}Param').val();
        </#list>

        $("#${table.NameFL}Grid").datagrid("load", loadParam);
    }
</script>
</body>

</html>