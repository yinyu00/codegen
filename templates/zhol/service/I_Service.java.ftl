package ${param.basePackage}.service;

import com.github.pagehelper.PageInfo;
import ${param.voPackage}.bo.${table.NameFU}Bo;
import ${param.voPackage}.vo.${table.NameFU}SearchVo;
import ${param.voPackage}.vo.${table.NameFU}Vo;
import java.util.List;

/**
 * 功能描述: ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
public interface I${table.NameFU}Service {

    /**
     * 查询列表
     * @param searchVo 分页查询条件
     * @return 列表
     */
    PageInfo<${table.NameFU}Bo> select${table.NameFU}List(${table.NameFU}SearchVo searchVo);

    /**
     * 根据id查看详情
     * @param ${table.NameFL}Id 物理主键
     * @return 实体对象
     */
    ${table.NameFU}Bo select${table.NameFU}ById(Long ${table.NameFL}Id);

    /**
     * 插入记录
     * @param ${table.NameFL}Vo 插入对象
     * @return 操作结果
     */
    Integer insert${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo);

    /**
     * 更新记录
     * @param ${table.NameFL}Vo 更新对象
     * @return 更新结果
     */
     Integer update${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo);

    /**
     * 单个删除
     * @param ${table.NameFL}Id 删除资源主键
     * @return 删除结果
     */
     Integer delete${table.NameFU}ById(Long ${table.NameFL}Id);

    /**
     * 批量查询
     * @param idList 待查询记录Id数组
     * @return 查询结果
     */
    PageInfo<${table.NameFU}Bo> batchSelectByIdList(List<Long> idList);

    /**
     * 批量删除
     * @param idList 待删除资源Id数组
     * @return 删除结果
     */
    Integer batchDelByIdList(List<Long> idList);

    /**
     * 存在性校验
     * @param ${table.NameFL}Vo 校验对象
     * @return 校验结果
     */
    Integer exist(${table.NameFU}Vo ${table.NameFL}Vo);

}
