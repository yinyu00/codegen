package ${param.basePackage}.core.mapper.${param.module};

import com.legend.framework.mybatis.core.mapper.BaseMapper;
import ${param.basePackage}.contract.model.${param.module}.${table.NameFU};
import ${param.basePackage}.contract.model.${param.module}.${table.NameFU}SV;
import com.legend.framework.mybatis.extension.plugins.pagination.Page;
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
     * 查询单条记录
     * @param id 编号
     * @return StockInWarrant
     */
    ${table.NameFU} selectOneById(@Param("id") String id);


    /**
     * 批量删除记录
     * @param idList 删除Id列表
     */
    int batchDel(@Param("idList") List<String> idList);

    /**
     * 查询列表
     * @param page 分页参数
     * @param query 查询参数
     */
    Page<${table.NameFU}> listBySQL(Page<${table.NameFU}> page, @Param("query") String query);

    /**
     * 查询列表
     * @param query 查询参数
     */
    List<${table.NameFU}SV> select(@Param("query") String query);

}
