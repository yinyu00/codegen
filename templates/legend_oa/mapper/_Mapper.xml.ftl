<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${param.basePackage}.mapper.${param.module}.${table.NameFU}Mapper">
    <resultMap id="boMap" type="${param.basePackage}.model.${param.module}.${table.NameFU}">
        <#list columns as column>
            <#if column.primaryKey>
        <id column="${column.colName}" jdbcType="${column.dataTypeUpperCase}" property="${column.colNameFL}"/>
            <#else>
        <result column="${column.colName}" jdbcType="${column.dataTypeUpperCase}" property="${column.colNameFL}"/>
            </#if>
        </#list>
    </resultMap>

    <!-- 集成列 -->
    <sql id="columns">
        <#assign x = 0>
        <#assign size = columns?size>
        <#list columns as column>
            <#assign x = x+1>
        t.${column.colName}<#if x lt size>,</#if>
        </#list>
    </sql>

    <!--批量删除-->
    <delete id="batchDel">
        UPDATE `${table.Name}`
           SET `del_flag` = 1
         WHERE <#list columns as column><#if column.primaryKey>`${column.colName}`</#if></#list> IN
        <foreach close=")" collection="idList" index="index" item="item" open="(" separator=",">
        ${r"#"}{item}
        </foreach>
    </delete>

    <select id="listBySQL" parameterType="java.lang.String" resultMap="boMap" >
        SELECT <include refid="columns"/>
          FROM ${table.Name} t
         WHERE t.`del_flag` = 0
<if test="query != null and query != ''">
           AND t.`name` = ${r"#"}{query}
</if>
    </select>

    <select id="selectOneById" parameterType="java.lang.String" resultMap="boMap" >
        SELECT <include refid="columns"/>
        FROM ${table.Name} t
        WHERE t.`del_flag` = 0 AND t.`id` = ${r"#"}{id}
    </select>
</mapper>
