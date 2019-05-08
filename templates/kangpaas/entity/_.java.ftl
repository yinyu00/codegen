package com.kangpaas.logmgmt.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Id;
import java.sql.Timestamp;

/**
 * ${table.NameFL}
 *
 * @author jinw
 * @version 1.0  2019-04-29
 **/
@Data
public class ${table.NameFU} implements java.io.Serializable {
<#list columns as column>
    /** ${column.colName}: ${column.comments} */
    <#if column.primaryKey>
    @Id
    @GeneratedValue(generator = "JDBC")//此处加上注解
    </#if>
    @Column(name = "${column.colName}", nullable = <#if column.nullable="Y">true<#else>false</#if>, length = ${column.dataLength})
    private ${column.dbType} ${column.colNameFL};
</#list>

    /**
    * 覆盖 equals 算法
    * @return
    */
    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        ${table.NameFU} that = (${table.NameFU}) o;
<#list columns as column>
<#if column.nullable="Y">
        if (${column.colNameFL} != null ? !${column.colNameFL}.equals(that.${column.colNameFL}) : that.${column.colNameFL} != null) {
            return false;
        }
<#else>
        if (!${column.colNameFL}.equals(that.${column.colNameFL})) {
            return false;
        }
</#if>
</#list>

        return true;
    }

    /**
    * 覆盖 hashCode 算法
    * @return
    */
    @Override
    public int hashCode() {
        int result = 0;

<#list columns as column>
        result = 31 * result + (${column.colNameFL} != null ? ${column.colNameFL}.hashCode() : 0);
</#list>

        return result;
    }

}
