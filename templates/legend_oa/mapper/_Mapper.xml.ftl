<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${param.basePackage}.mapper.${param.module}.${table.NameFU}Mapper">

    <!--批量删除-->
    <delete id="batchDel">
        UPDATE `${table.Name}`
           SET `del_flag` = 1
         WHERE <#list columns as column><#if column.primaryKey>`${column.colName}`</#if></#list> IN
        <foreach close=")" collection="idList" index="index" item="item" open="(" separator=",">
        ${r"#"}{item}
        </foreach>
    </delete>
</mapper>
