
package ${param.voPackage}.${param.module};

import lombok.Data;
import org.apache.ibatis.type.Alias;

/**
* 功能描述: ${table.comments}SV
*
* @author ${param.author}
* @version 1.0 ${param.date}
*/
@Alias("${table.NameFU}SV")
@Data
public class ${table.NameFU}SV {

    /**
     * 编码
     */
    private String id;

    /**
     * 名称
     */
    private String name;

}
