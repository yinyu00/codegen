<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${param.basePackage}.dao.${table.NameFU}Mapper">
    <resultMap id="BaseResultMap" type="${param.basePackage}.entity.${table.NameFU}">
        <!--
          WARNING - @mbg.generated
        -->
<#list columns as column>
    <#if column.primaryKey>
        <id column="${column.colName}" jdbcType="${column.dataTypeUpperCase}" property="${column.colNameFL}"/>
    <#else>
        <result column="${column.colName}" jdbcType="${column.dataTypeUpperCase}" property="${column.colNameFL}"/>
    </#if>
</#list>
    </resultMap>

    <resultMap id="voMap" type="${param.voPackage}.${table.NameFU}Vo">
        <!--
          WARNING - @mbg.generated
        -->
<#list columns as column>
    <#if column.primaryKey>
        <id column="${column.colName}" jdbcType="${column.dataTypeUpperCase}" property="${column.colNameFL}"/>
    <#else>
        <result column="${column.colName}" jdbcType="${column.dataTypeUpperCase}" property="${column.colNameFL}"/>
    </#if>
</#list>
    </resultMap>


    <!-- SQL查询条件明确，禁止conditions(便于索引) -->
    <sql id="conditions"><!-- Search Condition, 主要用于列表等模糊查询 -->
        <trim prefix="where " prefixOverrides="and |or">
<!--
            <if test="columnName != null"> and upper(column___name) like CONCAT('%','${r"$"}{@com.kangpaas.common.core.utils.StringUtil@genFuzzyStr(columnName)}','%')</if>
-->
<#list columns as column>
            <if test="${column.colNameFL} != null"> and ${column.colName} = ${r"#"}{${column.colNameFL}}</if>
</#list>
        </trim>
    </sql>
    <!-- SQL查询条件明确，禁止conditions(便于索引) -->
    <sql id="conditions2"><!-- Search Condition, 主要用户校验等精确查询 -->
        <trim prefix="where " prefixOverrides="and |or">
<!--
            <if test="columnName != null"> and upper(column___name) = upper(${r"#"}{columnName})</if>
-->
            <#list columns as column>
            <if test="${column.colNameFL} != null"> and ${column.colName} = ${r"#"}{${column.colNameFL}}</if>
</#list>
        </trim>
    </sql>
    <!-- 集成列 -->
    <sql id="columns">
    <#assign x = 0>
    <#assign size = columns?size>
    <#list columns as column>
        <#assign x = x+1>
        ${column.colName}<#if x lt size>,</#if>
    </#list>
    </sql>

    <select id="select${table.NameFU}List" parameterType="${param.voPackage}.${table.NameFU}Vo" resultMap="voMap" >
        SELECT
        <include refid="columns"/>
        FROM ${table.Name}
        <include refid="conditions"/>
    </select>

    <select id="select${table.NameFU}" parameterType="${param.voPackage}.${table.NameFU}Vo" resultMap="voMap" >
        SELECT
        <include refid="columns"/>
        FROM ${table.Name}
        <include refid="conditions2"/>
    </select>

    <select id="batchSelectByIdList" >
        SELECT
        <include refid="columns"/>
        FROM ${table.Name}
        WHERE
        <#list columns as column>
            <#if column.primaryKey>
                ${column.colName}
            </#if>
        </#list>
        IN
        <foreach close=")" collection="idList" index="index" item="item" open="(" separator=",">
        ${r"#"}{item}
        </foreach>
    </select>

    <delete id="batchDelByIdList">
        DELETE FROM ${table.Name}
        WHERE
        <#list columns as column>
            <#if column.primaryKey>
                ${column.colName}
            </#if>
        </#list>
        IN
        <foreach close=")" collection="idList" index="index" item="item" open="(" separator=",">
        ${r"#"}{item}
        </foreach>
    </delete>
</mapper>
