package ${param.voPackage}.vo;

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
public class ${table.NameFU}SearchVo  {
private static final long serialVersionUID = 5434608093422494801L;

    @ApiModelProperty(value = "页码，默认是第一页")
    private int pageNum = 1; //页码，默认是第一页

    @ApiModelProperty(value = "每页显示的记录数，默认是10")
    private int pageSize = 10; //每页显示的记录数，默认是10

<#list columns as column>
    @ApiModelProperty(value = "${column.comments}")
    private ${column.dbType} ${column.colNameFL};

</#list>
}
