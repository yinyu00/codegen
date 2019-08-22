package ${param.basePackage}.service;

import ${param.basePackage}.entity.${table.NameFU};
import com.kangpaas.sdk.common.vo.PlatformResult;
import ${param.voPackage}.${table.NameFU}Vo;
import tk.mybatis.mapper.common.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import java.util.List;

/**
 * 功能描述: ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@Component
public interface ${table.NameFU}Mapper extends Mapper<${table.NameFU}> {

    /**
     * 根据对象模糊查询
     * @param ${table.NameFL}Vo 模糊查询条件
     * @return 列表
     */
    List<${table.NameFU}Vo> select${table.NameFU}List(${table.NameFU}Vo ${table.NameFL}Vo);

    /**
     * 根据对象精确查询
     * @param ${table.NameFL}Vo 精确查询条件
     * @return 列表
     */
    List<${table.NameFU}Vo> select${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo);

    /**
     * 根据主键批量查询
     * @param idList 查询Id列表
     * @return 列表
     */
    List<${table.NameFU}Vo> batchSelectByIdList(@Param("idList") List<Long> idList);

    /**
     * 批量删除记录
     * @param idList 删除Id列表
     */
    void batchDelByIdList(@Param("idList") List<Long> idList);

    /**
     * 存在性校验
     * @param ${table.NameFL}Vo 校验对象
     * @return 校验结果
     */
    PlatformResult exist(${table.NameFU}Vo ${table.NameFL}Vo);

}
