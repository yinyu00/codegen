package ${param.voPackage}.dto;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * 功能描述: ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@Data
@ToString
public class ${table.NameFU}Example {

<#list columns as column>
    /** ${column.colName}: ${column.comments} */
    private ${column.dbType} ${column.colNameFL};

</#list>
}
