package ${param.voPackage};

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

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
@ApiModel(description = "${table.comments}返回对象")
@Data
@ToString
public class ${table.NameFU} {
private static final long serialVersionUID = 5434608093422494801L;

<#list columns as column>
    @ApiModelProperty(value = "${column.comments}")
    <#if column.dbType == "Date">
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
    </#if>
    private ${column.dbType} ${column.colNameFL};

</#list>
}
