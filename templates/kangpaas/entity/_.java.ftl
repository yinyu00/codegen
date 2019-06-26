package ${param.basePackage}.entity;

import lombok.Data;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.sql.Timestamp;

/**
 * 功能描述: ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
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
     * @return true if two object equals, false otherwise
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
<#assign x = 0>
<#assign size = columns?size>
        return
<#list columns as column>
  <#assign x = x+1>
    Objects.equals(${column.colNameFL},that.${column.colNameFL})<#if x lt size>&&<#else>;</#if>
</#list>
    }

    /**
     * 覆盖 hashCode 算法
     * @return hash code of the current object
     */
    @Override
    public int hashCode() {
<#assign xx = 0>
        return Objects.hash(
<#list columns as column>
  <#assign xx = xx+1>
        ${column.colNameFL}<#if xx lt size>,</#if>
</#list>
        );
    }

}
