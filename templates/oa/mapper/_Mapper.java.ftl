package ${param.basePackage}.mapper;

import ${param.voPackage}.po.${table.NameFU};
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
public interface ${table.NameFU}Mapper extends Mapper<${table.NameFU}> {

    /**
     * 根据名称查询
     * @param ${table.NameFL}Name 模糊查询条件
     * @return 列表
     */
    List<${table.NameFU}> queryByCondition(String ${table.NameFL}Name);

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
    Integer exist(${table.NameFU} ${table.NameFL});

}
