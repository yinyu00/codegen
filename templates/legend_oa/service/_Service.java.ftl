package ${param.basePackage}.service.${param.module};

import com.legend.framework.mybatis.core.metadata.IPage;
import com.legend.framework.mybatis.extension.service.BaseService;
import ${param.basePackage}.model.${param.module}.${table.NameFU};

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
    IPage<${table.NameFU}> listByWrapper(String query, int pageIndex, int pageSize);

    /**
     * 查询列表
     * @param query 查询参数
     * @return 列表
     */
    IPage<${table.NameFU}> listBySQL(String query, int pageIndex, int pageSize);

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
