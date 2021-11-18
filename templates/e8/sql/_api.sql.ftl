
set @parent_id = 1123598815738675201;
set @menu_id = 1123598815738775000;

delete from `blade_menu` where id between @menu_id and @menu_id+4;
INSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
VALUES (@menu_id, @parent_id, '${table.NameLL}', '${table.comments}', 'menu', '/${table.schema}/${table.NameLL}', NULL, 1, 1, 0, 1, NULL, 0),
(@menu_id+1, @menu_id, '${table.NameLL}_add', '新增', 'add', '/${table.schema}/${table.NameLL}/add', 'plus', 1, 2, 1, 1, NULL, 0),
(@menu_id+2, @menu_id, '${table.NameLL}_edit', '修改', 'edit', '/${table.schema}/${table.NameLL}/edit', 'form', 2, 2, 2, 1, NULL, 0),
(@menu_id+3, @menu_id, '${table.NameLL}_delete', '删除', 'delete', '/api/${table.schema}/${table.NameLL}/remove', 'delete', 3, 2, 3, 1, NULL, 0),
(@menu_id+4, @menu_id, '${table.NameLL}_view', '查看', 'view', '/${table.schema}/${table.NameLL}/view', 'file-text', 4, 2, 2, 1, NULL, 0);

-- ${param.baseUri}${table.NameFL}/query - post
{
    "success": 1,
    "data": {
        "result": [
            {
<#assign x = 0>
<#assign size = columns?size>
<#list columns as column>
<#assign x = x+1>
                "${column.colNameFL}": "${column.colNameFL}-value"<#if x lt size>,</#if>
</#list>
            }
        ],
        "totalSize": 1
    }
}

-- ${param.baseUri}${table.NameFL}/{param} - get
{
    "success": 1,
    "data": {
<#assign x = 0>
<#assign size = columns?size>
<#list columns as column>
    <#assign x = x+1>
        "${column.colNameFL}": "${column.colNameFL}-value"<#if x lt size>,</#if>
</#list>
    }
}

-- ${param.baseUri}${table.NameFL} - post
{
<#assign x = 0>
<#assign size = columns?size>
<#list columns as column>
    <#assign x = x+1>
    "${column.colNameFL}": "${column.colNameFL}-value"<#if x lt size>,</#if>
</#list>
}
{
    "success":1
}

-- ${param.baseUri}${table.NameFL} - put
{
<#assign x = 0>
<#assign size = columns?size>
<#list columns as column>
<#assign x = x+1>
    "${column.colNameFL}": "${column.colNameFL}-value"<#if x lt size>,</#if>
</#list>
}
{
    "success":1
}

-- ${param.baseUri}${table.NameFL}/{param} - delete
{
    "success":1
}

-- ${param.baseUri}${table.NameFL}/batchDel - delete
{
    delIdList: [
        33,
        35
    ]
}
{
    "success":1,
}

-- ${param.baseUri}${table.NameFL}/exist - post
{
    templateName: "bbcc1",
    logTemplateId: 34
}
{
    "success":1,
    "data":1
}
