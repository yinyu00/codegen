package com.kangpaas.monitormgnt.service;

import com.kangpaas.monitormgnt.entity.${table.NameFU};
import com.kangpaas.sdk.monitormgnt.vo.${table.NameFU}Vo;
import tk.mybatis.mapper.common.Mapper;
import org.springframework.stereotype.Component;
import java.util.List;

/**
 * XXXXXX
 *
 * @author jinw
 * @version 1.0  2019-04-29
 **/
@Component
public interface ${table.NameFU}Mapper extends Mapper<${table.NameFU}> {

    /**
     * 批量删除记录
     * @param deleteIdList 待删除id列表
     * @return 删除结果
     */
    //void batchDel${table.NameFU}(List<Long> deleteIdList);

    /**
     *  查询列表
     * @param ${table.NameFL}Vo 查询条件
     * @return 列表
     */
    List<${table.NameFU}Vo> select${table.NameFU}List(${table.NameFU}Vo ${table.NameFL}Vo);

    /**
      * 批量删除
      * @param idList 删除ID列表
      */
    void batchDelByIdList(@Param("idList") List<Long> idList);
}
