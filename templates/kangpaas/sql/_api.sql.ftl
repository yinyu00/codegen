INSERT INTO `api` (`api_id`, `display_name`, `key`, `url`, `request_method`, `is_accessable`, `description`, `is_valid`, `tenant_id`, `creator`, `gmt_create`, `updater`, `gmt_modified`)
VALUES
('${param.apiIdPrefix}1', '查询列表', 'get${table.NameFU}List', '${param.baseUri}${table.NameFL}/query', 'post', '1', '查询列表', '1', '1', 'root', sysdate(), 'root', sysdate())
    ,
('${param.apiIdPrefix}2', '查询详情', 'query groups', '${param.baseUri}${table.NameFL}/{param}', 'get', '1', '查询详情', '1', '1', 'root', sysdate(), 'root', sysdate())
    ,
('${param.apiIdPrefix}3', '新建', 'insert', '${param.baseUri}${table.NameFL}', 'post', '1', '新建', '1', '1', 'root', sysdate(), 'root', sysdate())
    ,
('${param.apiIdPrefix}4', '更新', 'update', '${param.baseUri}${table.NameFL}', 'put', '1', '更新', '1', '1', 'root', sysdate(), 'root', sysdate())
    ,
('${param.apiIdPrefix}5', '删除', 'add group', '${param.baseUri}${table.NameFL}/{param}', 'delete', '1', '删除', '1', '1', 'root', sysdate(), 'root', sysdate())
    ,
('${param.apiIdPrefix}6', '批量删除', 'exist group', '${param.baseUri}${table.NameFL}/batchDel', 'delete', '1', '批量删除', '1', '1', 'root', sysdate(), 'root', sysdate())
    ,
('${param.apiIdPrefix}7', '存在性校验', 'exist', '${param.baseUri}${table.NameFL}/exist', 'put', '1', '存在性校验', '1', '1', 'root', sysdate(), 'root', sysdate());