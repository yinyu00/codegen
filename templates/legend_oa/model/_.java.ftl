package ${param.voPackage}.${param.module};

import com.legend.framework.mybatis.annotation.FieldStrategy;
import com.legend.framework.mybatis.annotation.TableField;
import com.legend.framework.mybatis.annotation.TableName;
import com.legend.framework.mybatis.core.model.BaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

/**
* 功能描述: ${table.comments}
*
* @author ${param.author}
* @version 1.0 ${param.date}
*/
@Alias("${table.NameFU}")
@ApiModel(description = "${table.comments}")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("${table.Name}")
@ToString
public class ${table.NameFU} extends BaseModel {

<#list columns as column>
<#if column.colName?lower_case != 'id' && column.colName?lower_case != 'company_id' && column.colName?lower_case != 'create_by' && column.colName?lower_case != 'create_time' && column.colName?lower_case != 'update_by' && column.colName?lower_case != 'update_time' && column.colName?lower_case != 'del_flag' >
    /**
     * ${column.comments}
     */
    @ApiModelProperty("${column.comments}")
<#if column.dbType == 'Long'>
    @TableField(updateStrategy= FieldStrategy.IGNORED)
</#if>
<#if column.nullable == "NO">
    @NotNull(message = "${column.colNameFL} 不能为空")
</#if>
<#if column.dataTypeUpperCase == "VARCHAR">
    @Size(max = ${column.dataLength})
</#if>
    private ${column.dbType} ${column.colNameFL};

</#if>
</#list>
}
