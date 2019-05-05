<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.kangpaas.monitormgnt.dao.MonitorTemplateMapper">
    <resultMap id="BaseResultMap" type="com.kangpaas.monitormgnt.entity.${table.NameFU}">
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
    <sql id="conditions"><!-- Search Condition -->
        <trim prefix="where " prefixOverrides="and |or">
<#list columns as column>
            <if test="${column.colNameFL} != null"> and ${column.colName} = {${column.colNameFL}}</if>
</#list>
        </trim>
    </sql>
    <!-- 集成列 -->
    <sql id="coloumn">

    <#list columns as column>
        ${column.colName},
    </#list>
    </sql>

    <select id="select${table.NameFU}List" parameterType="com.kangpaas.sdk.monitormgnt.vo.${table.NameFU}Vo" resultMap="BaseResultMap" >
        SELECT
        <include refid="coloumn"/>
        FROM ${table.Name}
        <include refid="conditions"/>
    </select>
</mapper>
