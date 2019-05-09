package com.kangpaas.cmp.service;

import com.kangpaas.sdk.monitormgnt.vo.${table.NameFU}Vo;
import com.kangpaas.sdk.common.vo.PlatformResult;
import com.kangpaas.sdk.common.vo.RequestPageVo;
import com.kangpaas.sdk.common.vo.ResponsePageVo;
import java.util.List;

/**
 * XXXXXX
 *
 * @author jinw
 * @version 1.0  2019-04-29
 **/
public interface ${table.NameFU}Service {

    /**
     *  批量删除
     * @param deleteIdList 待删除id列表
     * @return 删除结果
     */
    PlatformResult batchDel${table.NameFU}(List<Long> deleteIdList);

    /**
     * 查询列表
     * @param pageVo 分页查询条件
     * @return 列表
     */
    PlatformResult<ResponsePageVo<${table.NameFU}Vo>> select${table.NameFU}List(RequestPageVo<${table.NameFU}Vo> pageVo);


    /**
     * 根据id查看详情
     * @param ${table.NameFL}Id 物理主键
     * @return
     */
    PlatformResult select${table.NameFU}ById(Long ${table.NameFL}Id);

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
     * 批量删除
     * @param idList 待删除资源ID
     * @return 删除结果
     */
    PlatformResult batchDelByIdList(List<Long> idList);
}
