package ${param.basePackage}.service.${param.module};

import com.legend.framework.mybatis.core.metadata.IPage;
import com.legend.framework.mybatis.extension.service.IService;
import ${param.basePackage}.model.${param.module}.${table.NameFU};

import java.util.List;

/**
 * 功能描述: ${table.comments} 接口服务
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
public interface ${table.NameFU}Service extends IService<${table.NameFU}> {

    /**
     * 批量删除
     * @param idList 待删除资源Id数组
     * @return 删除结果
     */
    int batchDel(List<Long> idList);

    /**
     * 查询列表
     * @param ${table.NameFL}Name 分页查询条件
     * @return 列表
     */
    IPage<${table.NameFU}> queryByCondition(String ${table.NameFL}Name, int pageIndex, int pageSize);

}
