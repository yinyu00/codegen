package ${param.basePackage}.service;

import ${param.voPackage}.bo.${table.NameFU}Bo;
import ${param.voPackage}.po.${table.NameFU}Po;
import ${param.voPackage}.vo.${table.NameFU}SearchVo;
import com.baomidou.dynamic.datasource.annotation.DS;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.common.Mapper;
import java.util.List;

/**
 * 功能描述: ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@Component
public interface ${table.NameFU}Mapper extends Mapper<${table.NameFU}Bo> {

    /**
     * 根据对象模糊查询
     * @param ${table.NameFL}Vo 模糊查询条件
     * @return 列表
     */
    List<${table.NameFU}Bo> select${table.NameFU}List(${table.NameFU}SearchVo ${table.NameFL}Vo);

    /**
     * 根据对象精确查询
     * @param ${table.NameFL}Po 精确查询条件
     * @return 列表
     */
    List<${table.NameFU}Po> select${table.NameFU}(${table.NameFU}Po ${table.NameFL}Po);

    /**
     * 根据主键批量查询
     * @param idList 查询Id列表
     * @return 列表
     */
    List<${table.NameFU}Po> batchSelectByIdList(@Param("idList") List<Long> idList);

    /**
     * 批量删除记录
     * @param idList 删除Id列表
     */
    void batchDelByIdList(@Param("idList") List<Long> idList);

    /**
     * 存在性校验
     * @param ${table.NameFL}Po 校验对象
     * @return 校验结果
     */
    Integer exist(${table.NameFU}Po ${table.NameFL}Po);

}
