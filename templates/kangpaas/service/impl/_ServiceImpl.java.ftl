package ${param.basePackage}.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kangpaas.common.core.constant.CommonConstant;
import ${param.basePackage}.dao.${table.NameFU}Mapper;
import ${param.basePackage}.entity.${table.NameFU};
import ${param.basePackage}.service.${table.NameFU}Service;
import com.kangpaas.common.core.exception.BusinessException;
import com.kangpaas.common.core.exception.ErrorCodeEnum;
import com.kangpaas.common.core.utils.CollectionUtil;
import com.kangpaas.common.core.utils.OperatorUtil;
import com.kangpaas.common.core.utils.StringUtil;
import com.kangpaas.sdk.common.vo.PlatformResult;
import com.kangpaas.sdk.common.vo.RequestPageVo;
import com.kangpaas.sdk.common.vo.ResponsePageVo;
import com.kangpaas.sdk.monitormgnt.vo.${table.NameFU}Vo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * ${table.NameFL}
 *
 * @author ${param.author}
 * @version 1.0  2019-04-29
 **/
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class ${table.NameFU}ServiceImpl implements ${table.NameFU}Service {

    /**
     * LOGGER日志
     */
    private static final Logger LOG = LoggerFactory.getLogger(${table.NameFU}ServiceImpl.class);

    @Autowired
    private ${table.NameFU}Mapper ${table.NameFL}Mapper ;

    public ${table.NameFU}ServiceImpl(${table.NameFU}Mapper ${table.NameFL}Mapper) {
        this.${table.NameFL}Mapper = ${table.NameFL}Mapper;
    }

    /**
     * 根据id查看详情
     * @param ${table.NameFL}Id 物理主键
     * @return 操作结果
     */
    @Override
    public PlatformResult<${table.NameFU}Vo> select${table.NameFU}ById(Long ${table.NameFL}Id) {
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
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public PlatformResult insert${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo) {
        try {
            if (null == ${table.NameFL}Vo) {
                throw new BusinessException(ErrorCodeEnum.SYS_PARAM_NULL);
            }

            OperatorUtil.insert(${table.NameFL}Vo);

            ${table.NameFU} ${table.NameFL} = new ${table.NameFU}();
            BeanUtils.copyProperties(${table.NameFL}Vo, ${table.NameFL});

            ${table.NameFL}Mapper.insert(${table.NameFL});
        }
        catch (Exception ex) {
            LOG.error(ErrorCodeEnum.${table.Name?upper_case}_CREATE_ERR.getMessage(), ex);
            return PlatformResult.failure(ErrorCodeEnum.${table.Name?upper_case}_CREATE_ERR.getCode(), ErrorCodeEnum.${table.Name?upper_case}_CREATE_ERR.getMessage());
        }

        return PlatformResult.success();
    }

    /**
     * 更新信息
     * @param ${table.NameFL}Vo
     * @return 更新结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public PlatformResult update${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo) {
        try {
            if (${table.NameFL}Vo == null || ${table.NameFL}Vo.get${table.NameFU}Id() == null) {
                throw new BusinessException(ErrorCodeEnum.SYS_PARAM_NULL);
            }

            OperatorUtil.update(${table.NameFL}Vo);

            ${table.NameFU} ${table.NameFL} = new ${table.NameFU}();
            BeanUtils.copyProperties(${table.NameFL}Vo, ${table.NameFL});

            ${table.NameFL}Mapper.updateByPrimaryKey(${table.NameFL});
        }
        catch (Exception ex) {
            LOG.error(ErrorCodeEnum.${table.Name?upper_case}_UPDATE_ERR.getMessage(), ex);
            return PlatformResult.failure(ErrorCodeEnum.${table.Name?upper_case}_UPDATE_ERR.getCode(), ErrorCodeEnum.${table.Name?upper_case}_UPDATE_ERR.getMessage());
        }

        return PlatformResult.success();
    }

    /**
     *  单个删除
     * @param ${table.NameFL}Id 待删除id
     * @return 删除结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public PlatformResult delete${table.NameFU}ById(Long ${table.NameFL}Id) {
        try {
            if (null ==  ${table.NameFL}Id) {
                throw new BusinessException(ErrorCodeEnum.SYS_PARAM_NULL);
            }

            ${table.NameFL}Mapper.deleteByPrimaryKey(${table.NameFL}Id);
        }
        catch (Exception ex) {
            LOG.error(ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR.getMessage(), ex);
            return PlatformResult.failure(ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR.getCode(), ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR.getMessage());
        }

        return PlatformResult.success();
    }

    /**
     * 批量查询
     * @param idList 待查询记录Id数组
     * @return 查询结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public PlatformResult batchSelectByIdList(List<Long> idList) {
        try {
            if (null ==  idList || idList.isEmpty()) {
                throw new BusinessException(ErrorCodeEnum.SYS_PARAM_NULL);
            }

            List<${table.NameFU}Vo> ${table.NameFL}VoList = ${table.NameFL}Mapper.batchSelectByIdList(idList);
            return PlatformResult.success(${table.NameFL}VoList);
        }
        catch (Exception ex) {
            LOG.error(ErrorCodeEnum.MONITOR_LOG_TEMPLATE_DELETE_ERR.getMessage(), ex);
            return PlatformResult.failure(ErrorCodeEnum.MONITOR_LOG_TEMPLATE_DELETE_ERR.getCode(), ErrorCodeEnum.MONITOR_LOG_TEMPLATE_DELETE_ERR.getMessage());
        }
    }

    /**
     * 批量删除
     * @param idList 待删除Id数组
     * @return 删除结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public PlatformResult batchDelByIdList(List<Long> idList) {
        try {
            if (null ==  idList || idList.isEmpty()) {
                throw new BusinessException(ErrorCodeEnum.SYS_PARAM_NULL);
            }

            ${table.NameFL}Mapper.batchDelByIdList(idList);
        }
        catch (Exception ex) {
            LOG.error(ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR.getMessage(), ex);
            return PlatformResult.failure(ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR.getCode(), ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR.getMessage());
        }

        return PlatformResult.success();
    }

    /**
     * 查询列表
     * @param pageVo 分页查询条件
     * @return 列表
     */
    @Override
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


    /**
    * 存在性校验
    * @param ${table.NameFL}Vo 校验对象
    * @return 校验结果
    */
    public PlatformResult exist(${table.NameFU}Vo ${table.NameFL}Vo) {
    List<${table.NameFU}Vo> ${table.NameFL}List = ${table.NameFL}Mapper.select${table.NameFU}(${table.NameFL}Vo);
        if(${table.NameFL}List == null || ${table.NameFL}List.isEmpty()) {
            return PlatformResult.success(CommonConstant.INT_ONE);  // 无重复记录
        }

        for(${table.NameFU}Vo ${table.NameFL} : ${table.NameFL}List) {
            if(${table.NameFL}.get${table.NameFU}Id().equals(${table.NameFL}Vo.get${table.NameFU}Id())) {
                continue; // 跳过相同id的记录
            }

            return PlatformResult.success(CommonConstant.INT_ZERO); // 有重复记录
        }

        return PlatformResult.success(CommonConstant.INT_ONE);  // 无重复记录
    }
}
