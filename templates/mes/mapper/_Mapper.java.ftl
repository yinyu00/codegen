package ${param.basePackage}.mapper.${param.module};

import com.legend.framework.mybatis.core.mapper.BaseMapper;
import ${param.basePackage}.model.${param.module}.${table.NameFU};
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 功能描述: ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
public interface ${table.NameFU}Mapper extends BaseMapper<${table.NameFU}> {

    /**
     * 批量删除记录
     * @param idList 删除Id列表
     */
    int batchDel(@Param("idList") List<Long> idList);

}
