package ${param.basePackage}.service;

import ${param.voPackage}.${table.NameFU}Vo;
import com.kangpaas.sdk.common.vo.PlatformResult;
import com.kangpaas.sdk.common.vo.RequestPageVo;
import com.kangpaas.sdk.common.vo.ResponsePageVo;
import java.util.List;

/**
 * ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0  2019-04-29
 **/
public interface ${table.NameFU}Service {

    /**
     * 查询列表
     * @param pageVo 分页查询条件
     * @return 列表
     */
    PlatformResult<ResponsePageVo<${table.NameFU}Vo>> select${table.NameFU}List(RequestPageVo<${table.NameFU}Vo> pageVo);

    /**
     * 根据id查看详情
     * @param ${table.NameFL}Id 物理主键
     * @return 实体对象
     */
    PlatformResult<${table.NameFU}Vo> select${table.NameFU}ById(Long ${table.NameFL}Id);

    /**
     * 插入记录
     * @param ${table.NameFL}Vo 资源信息
     * @return 操作结果
     */
    PlatformResult insert${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo);

    /**
     * 更新信息
     * @param ${table.NameFL}Vo 资源信息
     * @return 更新结果
     */
    PlatformResult update${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo);

    /**
     * 单个删除
     * @param ${table.NameFL}Id 删除资源
     * @return 删除结果
     */
    PlatformResult delete${table.NameFU}ById(Long ${table.NameFL}Id);

    /**
     * 批量查询
     * @param idList 待查询记录Id数组
     * @return 查询结果
     */
    PlatformResult batchSelectByIdList(List<Long> idList);

    /**
     * 批量删除
     * @param idList 待删除资源Id数组
     * @return 删除结果
     */
    PlatformResult batchDelByIdList(List<Long> idList);

    /**
     * 存在性校验
     * @param ${table.NameFL}Vo 校验对象
     * @return 校验结果
     */
    PlatformResult exist(${table.NameFU}Vo ${table.NameFL}Vo);

}
