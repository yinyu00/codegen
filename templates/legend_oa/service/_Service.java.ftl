package ${param.basePackage}.core.service.${param.module};

import com.legend.framework.mybatis.extension.plugins.pagination.Page;
import com.legend.framework.mybatis.extension.service.BaseService;
import ${param.basePackage}.contract.model.${param.module}.${table.NameFU};
import ${param.basePackage}.contract.model.${param.module}.${table.NameFU}SV;

import java.util.List;

/**
 * 功能描述: ${table.comments} 接口服务
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
public interface ${table.NameFU}Service extends BaseService<${table.NameFU}> {
    /**
     * 查询列表
     * @param query 查询条件
     * @return 列表
     */
    Page<${table.NameFU}> listByWrapper(String query, int pageIndex, int pageSize);

    /**
     * 查询列表
     * @param query 查询参数
     * @return 列表
     */
    Page<${table.NameFU}> listBySQL(String query, int pageIndex, int pageSize);

    /**
     * 查询列表
     * @param query 查询条件
     * @return 列表
     */
    List<${table.NameFU}SV> select(String query);

    /**
     * 批量删除
     * @param idList 待删除资源Id数组
     * @return 删除结果
     */
    int batchDel(List<String> idList);

    /**
     * 查询单条记录
     * @param id 编号
     * @return ${table.NameFU}
     */
    ${table.NameFU} selectOneById(String id);


}
