package ${param.basePackage}.service.${param.module};

import com.github.pagehelper.PageInfo;
import ${param.basePackage}.model.${param.module}.${table.NameFU};
import java.util.List;

/**
 * 功能描述: ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
public interface ${table.NameFU}Service {

    /**
     * 根据id查看详情
     * @param id 物理主键
     * @return 实体对象
     */
    ${table.NameFU} getById(Long id);

    /**
     * 新增记录
     * @param ${table.NameFL} 新增对象
     * @return 操作结果
     */
    int insert(${table.NameFU} ${table.NameFL});

    /**
     * 更新记录
     * @param ${table.NameFL} 更新对象
     * @return 更新结果
     */
     int update(${table.NameFU} ${table.NameFL});

    /**
     * 根据主键删除
     * @param id 待删除资源主键
     * @return 删除结果
     */
    int deleteById(Long id);


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
    PageInfo<${table.NameFU}> queryByCondition(String ${table.NameFL}Name, int pageIndex, int pageSize);

}