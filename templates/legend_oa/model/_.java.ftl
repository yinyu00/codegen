package ${param.voPackage}.${param.module};

import com.legend.framework.mybatis.annotation.TableName;
import com.legend.oa.core.model.BaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

/**
* 功能描述: ${table.comments}
*
* @author ${param.author}
* @version 1.0 ${param.date}
*/
@Alias("${table.NameFU}")
@ApiModel(description = "${table.comments}对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("${table.Name}")
@ToString
public class ${table.NameFU} extends BaseModel {

<#list columns as column>
<#if column.colName != 'id' && column.colName != 'create_by' && column.colName != 'create_time' && column.colName != 'update_by' && column.colName != 'update_time' && column.colName != 'del_flag' >
    /**
     * ${column.comments}
     */
    @ApiModelProperty("${column.comments}")
    private ${column.dbType} ${column.colNameFL};

</#if>
</#list>
}
