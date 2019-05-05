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
    //PlatformResult batchDel${table.NameFU}(List<Long> deleteIdList);

    /**
     * 查询列表
     * @param pageVo 分页查询条件
     * @return 列表
     */
    PlatformResult<ResponsePageVo<${table.NameFU}Vo>> select${table.NameFU}List(RequestPageVo<${table.NameFU}Vo> pageVo);

}
