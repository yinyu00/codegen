package ${param.basePackage}.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.vpclub.bulk.common.constant.CommonConstant;
import cn.vpclub.bulk.common.constant.ErrorCodeEnum;
import cn.vpclub.bulk.common.util.OperatorUtil;
import cn.vpclub.bulk.common.util.ResultUtil;
import cn.vpclub.bulk.common.vo.RequestPageVo;
import cn.vpclub.common.exception.RenException;
import cn.vpclub.common.page.PageData;
import cn.vpclub.common.utils.Result;

import ${param.basePackage}.dao.${table.NameFU}Mapper;
import ${param.basePackage}.entity.${table.NameFU}Entity;
import ${param.basePackage}.service.${table.NameFU}Service;
import ${param.voPackage}.${table.NameFU}Vo;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
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
@AllArgsConstructor
@Slf4j
public class ${table.NameFU}ServiceImpl implements ${table.NameFU}Service {

    private final ${table.NameFU}Mapper ${table.NameFL}Mapper ;

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
        ${table.NameFU}Entity ${table.NameFL}Entity = ${table.NameFL}Mapper.selectById(${table.NameFL}Id);
        if (${table.NameFL}Entity != null) {
            BeanUtils.copyProperties(${table.NameFL}Entity, ${table.NameFL}Vo);
        }
        return ResultUtil.ok(${table.NameFL}Vo);
    }

    /**
     * 插入记录
     * @param ${table.NameFL}Vo 插入对象
     * @return 操作结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Result<Integer> insert${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo) {
        if (null == ${table.NameFL}Vo) {
            throw new RenException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        ${table.NameFU}Entity ${table.NameFL}Entity = new ${table.NameFU}Entity();
        BeanUtils.copyProperties(${table.NameFL}Vo, ${table.NameFL}Entity);

        OperatorUtil.insert(${table.NameFL}Entity);
        int result = ${table.NameFL}Mapper.insert(${table.NameFL}Entity);

        return ResultUtil.ok(result);
    }

    /**
     * 更新记录
     * @param ${table.NameFL}Vo 更新对象
     * @return 更新结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Result<Integer> update${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo) {
        if (${table.NameFL}Vo == null || ${table.NameFL}Vo.getId() == null) {
            throw new RenException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        ${table.NameFU}Entity ${table.NameFL}Entity = new ${table.NameFU}Entity();
        BeanUtils.copyProperties(${table.NameFL}Vo, ${table.NameFL}Entity);

        OperatorUtil.update(${table.NameFL}Entity);
        int result = ${table.NameFL}Mapper.updateById(${table.NameFL}Entity);

        return ResultUtil.ok(result);
    }

    /**
     * 单个删除
     * @param ${table.NameFL}Id 待删除记录主键
     * @return 删除结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Result<Integer> delete${table.NameFU}ById(Long ${table.NameFL}Id) {
        if (null ==  ${table.NameFL}Id) {
            throw new RenException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        int result = ${table.NameFL}Mapper.deleteById(${table.NameFL}Id);

        return ResultUtil.ok(result);
    }

    /**
     * 批量查询
     * @param idList 待查询记录Id数组
     * @return 查询结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Result<List<${table.NameFU}Entity>> batchSelectByIdList(List<Long> idList) {
        if (CollUtil.isEmpty(idList)) {
            throw new RenException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        List<${table.NameFU}Entity> ${table.NameFL}EntityList = ${table.NameFL}Mapper.selectBatchIds(idList);
        return ResultUtil.ok(${table.NameFL}EntityList);
    }

    /**
     * 批量删除
     * @param idList 待删除Id数组
     * @return 删除结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Result<Integer> batchDelByIdList(List<Long> idList) {
        if (CollUtil.isEmpty(idList)) {
            throw new RenException(ErrorCodeEnum.SYS_PARAM_NULL);
        }

        int result = ${table.NameFL}Mapper.deleteBatchIds(idList);

        return ResultUtil.ok(result);
    }


    /**
     * 查询列表
     * @param pageVo 分页查询条件
     * @return 列表
     */
    @Override
    public Result<PageData<${table.NameFU}Vo>> listBySql(RequestPageVo<${table.NameFU}Vo> pageVo) {
        return null;
    }

    /**
     * 查询列表
     * @param pageVo 分页查询条件
     * @return 列表
     */
    @Override
    public Result<PageData<${table.NameFU}Vo>> listByWrapper(RequestPageVo<${table.NameFU}Vo> pageVo) {
        return null;
    }

    /**
    * 存在性校验
    * @param ${table.NameFL}Vo 校验对象
    * @return 校验结果
    */
    public Result exist(${table.NameFU}Vo ${table.NameFL}Vo) {
        Long originId = ${table.NameFL}Vo.getId();
        ${table.NameFL}Vo.setId(null);

        RequestPageVo<${table.NameFU}Vo> queryVo = new RequestPageVo<>();
        queryVo.setInstance(${table.NameFL}Vo);
        queryVo.setCurrent(1);
        queryVo.setSize(10);

        List<${table.NameFU}Vo> ${table.NameFL}List = listByWrapper(queryVo).getData().getRecords();
        if(CollUtil.isEmpty(${table.NameFL}List)) {
            return ResultUtil.ok(CommonConstant.INT_ONE);  // 无重复记录
        }

        for(${table.NameFU}Vo ${table.NameFL} : ${table.NameFL}List) {
            if(${table.NameFL}.getId().equals(originId)) {
                continue; // 跳过相同id的记录
            }

            return ResultUtil.ok(CommonConstant.INT_ZERO); // 有重复记录
        }

        return ResultUtil.ok(CommonConstant.INT_ONE);  // 无重复记录
    }
}
