<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.kangpaas.monitormgnt.dao.MonitorTemplateMapper">
    <resultMap id="BaseResultMap" type="com.kangpaas.monitormgnt.entity.MonitorTemplate">
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
</mapper>
