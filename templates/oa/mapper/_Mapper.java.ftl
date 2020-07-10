package ${param.basePackage}.mapper;

import ${param.voPackage}.${table.NameFU};
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * 功能描述: ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@Mapper
public interface ${table.NameFU}Mapper {

    /**
     * 根据名称查询
     * @param ${table.NameFL}Name 模糊查询条件
     * @return 列表
     */
    List<${table.NameFU}> queryByCondition(String ${table.NameFL}Name);

    /**
    * 根据名称查询
    * @param id 主键
    * @return 实体对象
    */
    ${table.NameFU} getById(Long id);

    /**
    * 新增数据
    *
    * @param ${table.NameFL} 实例对象
    * @return 影响行数
    */
    int insert(${table.NameFU} ${table.NameFL});

    /**
    * 修改数据
    *
    * @param ${table.NameFL} 实例对象
    * @return 影响行数
    */
    int update(${table.NameFU} ${table.NameFL});

    /**
    * 通过主键删除数据
    *
    * @param id 主键
    * @return 影响行数
    */
    int deleteById(Long id);

    /**
     * 批量删除记录
     * @param idList 删除Id列表
     */
    int batchDel(@Param("idList") List<Long> idList);


}