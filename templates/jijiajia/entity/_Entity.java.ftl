package ${param.basePackage}.entity;

import cn.vpclub.common.entity.BaseVpEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.sql.Timestamp;

/**
 * 功能描述: ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@Data
@TableName("${table.Name}")
@EqualsAndHashCode(callSuper = true)
public class ${table.NameFU}Entity extends BaseVpEntity {
<#list columns as column>
    /** ${column.colName}: ${column.comments} */
    private ${column.dbType} ${column.colNameFL};
</#list>

}
