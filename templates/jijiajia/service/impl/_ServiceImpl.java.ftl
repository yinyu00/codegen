package ${param.basePackage}.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.vpclub.common.exception.RenException;
import cn.vpclub.common.utils.Result;

import ${param.basePackage}.dao.${table.NameFU}Mapper;
import ${param.basePackage}.entity.${table.NameFU}Entity;
import ${param.basePackage}.service.${table.NameFU}Service;
import ${param.voPackage}.${table.NameFU}Vo;
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
 * 功能描述: ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
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
    public Result<${table.NameFU}Vo> select${table.NameFU}ById(Long ${table.NameFL}Id) {
        if (${table.NameFL}Id == null) {
            throw new RenException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        ${table.NameFU}Vo ${table.NameFL}Vo = new ${table.NameFU}Vo();
        ${table.NameFU} ${table.NameFL} = ${table.NameFL}Mapper.selectByPrimaryKey(${table.NameFL}Id);
        if (${table.NameFL} != null) {
            BeanUtils.copyProperties(${table.NameFL}, ${table.NameFL}Vo);
        } else {
            return Result.success();
        }
        return Result.success(${table.NameFL}Vo);
    }

    /**
     * 插入记录
     * @param ${table.NameFL}Vo 插入对象
     * @return 操作结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Result insert${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo) {
        if (null == ${table.NameFL}Vo) {
            throw new RenException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        OperatorUtil.insert(${table.NameFL}Vo);

        ${table.NameFU}Entity ${table.NameFL}Entity = new ${table.NameFU}Entity();
        BeanUtils.copyProperties(${table.NameFL}Vo, ${table.NameFL}Entity);

        ${table.NameFL}Mapper.insert(${table.NameFL});

        return Result.success();
    }

    /**
     * 更新记录
     * @param ${table.NameFL}Vo 更新对象
     * @return 更新结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Result update${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo) {
        if (${table.NameFL}Vo == null || ${table.NameFL}Vo.get${table.NameFU}Id() == null) {
            throw new RenException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        OperatorUtil.update(${table.NameFL}Vo);

        ${table.NameFU}Entity ${table.NameFL}Entity = new ${table.NameFU}Entity();
        BeanUtils.copyProperties(${table.NameFL}Vo, ${table.NameFL}Entity);

        ${table.NameFL}Mapper.updateByPrimaryKey(${table.NameFL});

        return Result.success();
    }

    /**
     * 单个删除
     * @param ${table.NameFL}Id 待删除记录主键
     * @return 删除结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Result delete${table.NameFU}ById(Long ${table.NameFL}Id) {
        if (null ==  ${table.NameFL}Id) {
            throw new RenException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        ${table.NameFL}Mapper.deleteByPrimaryKey(${table.NameFL}Id);

        return Result.success();
    }

    /**
     * 批量查询
     * @param idList 待查询记录Id数组
     * @return 查询结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Result batchSelectByIdList(List<Long> idList) {
        if (CollectionUtil.isEmpty(idList)) {
            throw new RenException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        List<${table.NameFU}Vo> ${table.NameFL}VoList = ${table.NameFL}Mapper.batchSelectByIdList(idList);
        return Result.success(${table.NameFL}VoList);
    }

    /**
     * 批量删除
     * @param idList 待删除Id数组
     * @return 删除结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Result batchDelByIdList(List<Long> idList) {
        if (CollectionUtil.isEmpty(idList)) {
            throw new RenException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        ${table.NameFL}Mapper.batchDelByIdList(idList);

        return Result.success();
    }

    /**
     * 查询列表
     * @param pageVo 分页查询条件
     * @return 列表
     */
    @Override
    @SuppressWarnings("unchecked")
    public Result<ResponsePageVo<${table.NameFU}Vo>> select${table.NameFU}List(RequestPageVo<${table.NameFU}Vo> pageVo) {
        if (pageVo == null) {
            return Result.success();
        }
        ${table.NameFU}Vo ${table.NameFL}Vo = new ${table.NameFU}Vo();
        if (pageVo.getData() != null) {
            BeanUtils.copyProperties(pageVo.getData(), ${table.NameFL}Vo);
        }
        PageHelper.startPage(pageVo.getPageNo(), pageVo.getPageSize());
        List<${table.NameFU}Vo> ${table.NameFL}List = ${table.NameFL}Mapper.select${table.NameFU}List(${table.NameFL}Vo);
        return Result.success(${table.NameFL}List, new PageInfo(${table.NameFL}List).getTotal());
    }


    /**
    * 存在性校验
    * @param ${table.NameFL}Vo 校验对象
    * @return 校验结果
    */
    public Result exist(${table.NameFU}Vo ${table.NameFL}Vo) {
        Long originId = appLayerVo.get${table.NameFU}Id();
        ${table.NameFL}Vo.set${table.NameFU}Id(null);

        List<${table.NameFU}Vo> ${table.NameFL}List = ${table.NameFL}Mapper.select${table.NameFU}(${table.NameFL}Vo);
        if(CollectionUtil.isEmpty(${table.NameFL}List)) {
            return Result.success(CommonConstant.INT_ONE);  // 无重复记录
        }

        for(${table.NameFU}Vo ${table.NameFL} : ${table.NameFL}List) {
            if(${table.NameFL}.get${table.NameFU}Id().equals(originId)) {
                continue; // 跳过相同id的记录
            }

            return Result.success(CommonConstant.INT_ZERO); // 有重复记录
        }

        return Result.success(CommonConstant.INT_ONE);  // 无重复记录
    }
}
