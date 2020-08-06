package ${param.voPackage}.${param.module};

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import org.apache.ibatis.type.Alias;

import com.legend.framework.mybatis.annotation.IdType;
import com.legend.framework.mybatis.annotation.TableId;
import com.legend.framework.mybatis.annotation.TableName;
import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.ToString;

/**
* 功能描述: ${table.comments}
*
* @author ${param.author}
* @version 1.0 ${param.date}
*/
@Alias("${table.NameFU}")
@ApiModel(description = "${table.comments}对象")
@Data
@TableName("${table.Name}")
@ToString
public class ${table.NameFU} implements Serializable {

<#list columns as column>
<#if column.primaryKey == true>
    @TableId(type = IdType.ASSIGN_ID)
</#if>
    @ApiModelProperty(value = "${column.comments}")
    private ${column.dbType} ${column.colNameFL};

</#list>
}
