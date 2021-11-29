package ${param.basePackage}.entity;

import cn.runzogroup.biz.web.entity.BizEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.sql.Timestamp;

/**
 * 功能描述: ${table.comments}实体类
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@Data
@TableName("${table.Name}")
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "${table.NameFU}对象", description = "${table.comments}")
public class ${table.NameFU} extends BizEntity {
<#list columns as column>
    <#if column.colNameFL != "id" &&
    column.colNameFL != "tenantId" &&
            column.colNameFL != "createUser" &&
            column.colNameFL != "createDept" &&
            column.colNameFL != "createTime" &&
            column.colNameFL != "updateUser" &&
            column.colNameFL != "updateTime" &&
            column.colNameFL != "status" &&
            column.colNameFL != "isDeleted">
    /**
     * ${column.comments}
     */
    @ApiModelProperty(value = "${column.comments}")
    private ${column.dbType} ${column.colNameFL};
    </#if>
</#list>


    public QueryWrapper<${table.NameFU}> toQueryWrapper() {
        QueryWrapper<${table.NameFU}> qw = new QueryWrapper<>();
        return qw;
    }

}
