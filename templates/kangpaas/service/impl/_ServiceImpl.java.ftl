package com.kangpaas.cmp.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kangpaas.monitormgnt.dao.${table.NameFU}Mapper;
import com.kangpaas.monitormgnt.entity.${table.NameFU};
import com.kangpaas.monitormgnt.service.${table.NameFU}Service;
import com.kangpaas.common.core.exception.BusinessException;
import com.kangpaas.common.core.exception.ErrorCodeEnum;
import com.kangpaas.common.core.utils.CollectionUtil;
import com.kangpaas.common.core.utils.OperatorUtil;
import com.kangpaas.common.core.utils.StringUtil;
import com.kangpaas.sdk.common.vo.PlatformResult;
import com.kangpaas.sdk.common.vo.RequestPageVo;
import com.kangpaas.sdk.common.vo.ResponsePageVo;
import com.kangpaas.sdk.monitormgnt.vo.${table.NameFU}Vo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ${table.NameFL}
 *
 * @author jinw
 * @version 1.0  2019-04-29
 **/
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class ${table.NameFU}ServiceImpl implements ${table.NameFU}Service {

    private ${table.NameFU}Mapper ${table.NameFL}Mapper ;
    public ${table.NameFU}ServiceImpl(${table.NameFU}Mapper ${table.NameFL}Mapper) {
        this.${table.NameFL}Mapper = ${table.NameFL}Mapper;
    }

    /**
     *根据管理域id查看详情
     * @param ${table.NameFL}Id 物理主键
     * @return
     */
    public PlatformResult select${table.NameFU}ById(Long ${table.NameFL}Id) {
        if (${table.NameFL}Id == null) {
            throw new BusinessException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        ${table.NameFU}Vo ${table.NameFL}Vo = new ${table.NameFU}Vo();
        ${table.NameFU} ${table.NameFL} = ${table.NameFL}Mapper.selectByPrimaryKey(${table.NameFL}Id);
        if (${table.NameFL} != null) {
            BeanUtils.copyProperties(${table.NameFL}, ${table.NameFL}Vo);
        } else {
            return PlatformResult.success();
        }
        return PlatformResult.success(${table.NameFL}Vo);
    }

    /**
     *  插入记录
     * @param ${table.NameFL}Vo
     * @return 操作结果
     */
    public PlatformResult insert${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo) {
        if (null == ${table.NameFL}Vo) {
            throw new BusinessException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        ${table.NameFU} ${table.NameFL} = new ${table.NameFU}();
        BeanUtils.copyProperties(${table.NameFL}Vo, ${table.NameFL});

        ${table.NameFL}Mapper.insert(${table.NameFL});
        return PlatformResult.success();
    }

    /**
     * 更新一个管理域信息
     * @param ${table.NameFL}Vo
     * @return 更新结果
     */
    public PlatformResult update${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo) {
        if (${table.NameFL}Vo == null || ${table.NameFL}Vo.get${table.NameFU}Id() == null) {
            throw new BusinessException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        ${table.NameFU} ${table.NameFL} = new ${table.NameFU}();
        BeanUtils.copyProperties(${table.NameFL}, ${table.NameFL});

        ${table.NameFL}Mapper.updateByPrimaryKey(${table.NameFL});
        return PlatformResult.success();
    }

    /**
     *  单个删除
     * @param ${table.NameFL}Id 待删除id
     * @return 删除结果
     */
    public PlatformResult delete${table.NameFU}ById(Long ${table.NameFL}Id) {
        if (null ==  ${table.NameFL}Id) {
            throw new BusinessException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        ${table.NameFL}Mapper.deleteByPrimaryKey(${table.NameFL}Id);
        return PlatformResult.success();
    }


    /**
    *  批量删除
    * @param deleteIdList 待删除id列表
    * @return 删除结果
    */
    //public PlatformResult batchDel${table.NameFU}(List<Long> deleteIdList) {
    //    ${table.NameFL}Mapper.batchDel${table.NameFU}(deleteIdList);
    //    return PlatformResult.success();
    //}

    /**
    *  查询管理域列表
    * @param pageVo 分页查询条件
    * @return 管理域列表
    */
    public PlatformResult<ResponsePageVo<${table.NameFU}Vo>> select${table.NameFU}List(RequestPageVo<${table.NameFU}Vo> pageVo) {
        if (pageVo == null) {
            return PlatformResult.success();
        }
        ${table.NameFU}Vo ${table.NameFL}Vo = new ${table.NameFU}Vo();
        if (pageVo.getData() != null) {
            BeanUtils.copyProperties(pageVo.getData(), ${table.NameFL}Vo);
        }
        PageHelper.startPage(pageVo.getPageNo(), pageVo.getPageSize());
        List<${table.NameFU}Vo> ${table.NameFL}List = ${table.NameFL}Mapper.select${table.NameFU}List(${table.NameFL}Vo);
        return PlatformResult.success(${table.NameFL}List, new PageInfo(${table.NameFL}List).getTotal());
    }

}