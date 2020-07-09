<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${param.basePackage}.mapper.${table.NameFU}Mapper">

    <!-- 集成列 -->
    <sql id="columns">
    <#assign x = 0>
    <#assign size = columns?size>
    <#list columns as column>
        <#assign x = x+1>
        `${column.colName}`<#if x lt size>,</#if>
    </#list>
    </sql>

    <!--查询单个-->
    <select id="getById" resultType="${param.basePackage}.model.${table.NameFU}">
        select
        <include refid="columns"/>
        from ${table.Name}
        where
        <#list columns as column><#if column.primaryKey> ${column.colName} = ${r"#"}{id} </#if></#list>
    </select>

    <select id="queryByCondition" resultType="${param.basePackage}.model.${table.NameFU}" >
        SELECT
        <include refid="columns"/>
        FROM ${table.Name}
    </select>

    <!--通过主键删除-->
    <delete id="deleteById" parameterType="long">
        update ${table.Name} set `del_flag` = 1 where
        <#list columns as column><#if column.primaryKey>${column.colName}</#if></#list>
         = ${r"#"}{id}
    </delete>

    <!--批量删除-->
    <delete id="batchDelete">
        UPDATE ${table.Name} set del_flag = 1
        WHERE
        <#list columns as column><#if column.primaryKey> ${column.colName} </#if></#list>
        IN <foreach close=")" collection="idList" index="index" item="item" open="(" separator=",">
        ${r"#"}{item}
        </foreach>
    </delete>
</mapper>
