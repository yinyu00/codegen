<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${param.basePackage}.mapper.${param.module}.${table.NameFU}Mapper">

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
    <select id="getById" resultType="${param.basePackage}.model.${param.module}.${table.NameFU}">
        select
        <include refid="columns"/>
        from ${table.Name}
        where
        <#list columns as column><#if column.primaryKey> ${column.colName} = ${r"#"}{id} </#if></#list>
    </select>

    <!--新增-->
    <insert id="insert" parameterType="${param.basePackage}.model.${param.module}.${table.NameFU}">
        insert into ${table.Name}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#list columns as column>
            <if test="${column.colNameFL} != null">`${column.colName}`,</if>
            </#list>
        </trim>
        values
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#list columns as column>
            <if test="${column.colNameFL} != null">${r"#"}{${column.colNameFL}},</if>
            </#list>
        </trim>
    </insert>


    <!--修改-->
    <update id="update" parameterType="${param.basePackage}.model.${param.module}.${table.NameFU}">
        update ${table.Name}
        <set>
            <#list columns as column>
                <#if !column.primaryKey>
                    <#if column.dbType == 'Date'>
                        <if test="${column.colNameFL} != null">
                            `${column.colName}` = ${r"#"}{${column.colNameFL}},
                        </if>
                    <#else>
                        <if test="${column.colNameFL} != null and ${column.colNameFL} != ''">
                            `${column.colName}` = ${r"#"}{${column.colNameFL}},
                        </if>
                    </#if>
                </#if>
            </#list>
        </set>
        where `id` = ${r"#"}{id}
    </update>

    <select id="queryByCondition" resultType="${param.basePackage}.model.${param.module}.${table.NameFU}" >
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
    <delete id="batchDel">
        UPDATE ${table.Name} set del_flag = 1
        WHERE
        <#list columns as column><#if column.primaryKey> ${column.colName} </#if></#list>
        IN <foreach close=")" collection="idList" index="index" item="item" open="(" separator=",">
        ${r"#"}{item}
        </foreach>
    </delete>
</mapper>
