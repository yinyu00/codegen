package ${param.basePackage}.service;

import ${param.voPackage}.${table.NameFU}Vo;
import ${param.basePackage}.entity.${table.NameFU}Entity;
import cn.vpclub.bulk.common.vo.RequestPageVo;
import cn.vpclub.common.page.PageData;

import java.util.List;

/**
 * 功能描述: ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
public interface ${table.NameFU}Service {

    /**
     * 查询列表
     * @param pageVo 分页查询条件
     * @return 列表
     */
    PageData<${table.NameFU}Entity> listBySql(RequestPageVo<${table.NameFU}Vo> pageVo);

    /**
     * 查询列表
     * @param pageVo 分页查询条件
     * @return 列表
     */
    PageData<${table.NameFU}Entity> listByWrapper(RequestPageVo<${table.NameFU}Vo> pageVo);

    /**
     * 根据id查看详情
     * @param ${table.NameFL}Id 物理主键
     * @return 实体对象
     */
    ${table.NameFU}Vo select${table.NameFU}ById(Long ${table.NameFL}Id);

    /**
     * 插入记录
     * @param ${table.NameFL}Vo 插入对象
     * @return 操作结果
     */
    int insert${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo);

    /**
     * 更新记录
     * @param ${table.NameFL}Vo 更新对象
     * @return 更新结果
     */
     int update${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo);

    /**
     * 单个删除
     * @param ${table.NameFL}Id 删除资源主键
     * @return 删除结果
     */
    int delete${table.NameFU}ById(Long ${table.NameFL}Id);

    /**
     * 批量查询
     * @param idList 待查询记录Id数组
     * @return 查询结果
     */
    List<${table.NameFU}Entity> batchSelectByIdList(List<Long> idList);

    /**
     * 批量删除
     * @param idList 待删除资源Id数组
     * @return 删除结果
     */
    int batchDelByIdList(List<Long> idList);

    /**
     * 存在性校验
     * @param ${table.NameFL}Vo 校验对象
     * @return 校验结果
     */
    int exist(${table.NameFU}Vo ${table.NameFL}Vo);

}