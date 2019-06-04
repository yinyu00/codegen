
delete from `api` where `api_id` in (
'${param.apiIdPrefix}1',
'${param.apiIdPrefix}2',
'${param.apiIdPrefix}3',
'${param.apiIdPrefix}4',
'${param.apiIdPrefix}5',
'${param.apiIdPrefix}6',
'${param.apiIdPrefix}7'
);

delete from `menu_api` where `api_id` in (
'${param.apiIdPrefix}1',
'${param.apiIdPrefix}2',
'${param.apiIdPrefix}3',
'${param.apiIdPrefix}4',
'${param.apiIdPrefix}5',
'${param.apiIdPrefix}6',
'${param.apiIdPrefix}7'
);

INSERT INTO `api` (`api_id`, `display_name`, `key`, `url`, `request_method`, `is_accessable`, `description`, `is_valid`, `tenant_id`, `creator`, `gmt_create`, `updater`, `gmt_modified`)
VALUES
('${param.apiIdPrefix}1', '查询列表', 'get${table.NameFU}List', '${param.baseUri}${table.NameFL}/query', 'post', '1', '查询列表', '1', '1', 'root', sysdate(), 'root', sysdate()),
('${param.apiIdPrefix}2', '查询详情', 'query groups', '${param.baseUri}${table.NameFL}/{param}', 'get', '1', '查询详情', '1', '1', 'root', sysdate(), 'root', sysdate()),
('${param.apiIdPrefix}3', '新建', 'insert', '${param.baseUri}${table.NameFL}', 'post', '1', '新建', '1', '1', 'root', sysdate(), 'root', sysdate()),
('${param.apiIdPrefix}4', '更新', 'update', '${param.baseUri}${table.NameFL}', 'put', '1', '更新', '1', '1', 'root', sysdate(), 'root', sysdate()),
('${param.apiIdPrefix}5', '删除', 'add group', '${param.baseUri}${table.NameFL}/{param}', 'delete', '1', '删除', '1', '1', 'root', sysdate(), 'root', sysdate()),
('${param.apiIdPrefix}6', '批量删除', 'exist group', '${param.baseUri}${table.NameFL}/batchDel', 'delete', '1', '批量删除', '1', '1', 'root', sysdate(), 'root', sysdate()),
('${param.apiIdPrefix}7', '存在性校验', 'exist', '${param.baseUri}${table.NameFL}/exist', 'post', '1', '存在性校验', '1', '1', 'root', sysdate(), 'root', sysdate());

INSERT INTO `menu_api` (`api_id`, `menu_id`)
VALUES
('${param.apiIdPrefix}1',, '${param.menuId}'),
('${param.apiIdPrefix}2',, '${param.menuId}'),
('${param.apiIdPrefix}3',, '${param.menuId}'),
('${param.apiIdPrefix}4',, '${param.menuId}'),
('${param.apiIdPrefix}5',, '${param.menuId}'),
('${param.apiIdPrefix}6',, '${param.menuId}'),
('${param.apiIdPrefix}7',, '${param.menuId}');


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
