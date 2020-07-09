package ${param.basePackage}.service.impl;

import com.blueneedles.common.mybatis.Page;
import ${param.basePackage}.mapper.${table.NameFU}Mapper;
import ${param.basePackage}.service.I${table.NameFU}Service;
import ${param.voPackage}.po.${table.NameFU}Po;
import ${param.voPackage}.vo.${table.NameFU}SearchVo;
import ${param.voPackage}.vo.${table.NameFU}Vo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.util.List;

/**
 * 功能描述: ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@Service
public class ${table.NameFU}ServiceImpl implements I${table.NameFU}Service {

    /**
     * LOGGER日志
     */
    private static final Logger LOG = LoggerFactory.getLogger(${table.NameFU}ServiceImpl.class);

    private ${table.NameFU}Mapper ${table.NameFL}Mapper ;
    @Autowired
    public ${table.NameFU}ServiceImpl(${table.NameFU}Mapper ${table.NameFL}Mapper) {
        this.${table.NameFL}Mapper = ${table.NameFL}Mapper;
    }

    /**
     * 根据id查看详情
     * @param ${table.NameFL}Id 物理主键
     * @return 操作结果
     */
    @Override
    public ${table.NameFU}Po select${table.NameFU}ById(Long ${table.NameFL}Id) {
        Assert.notNull(${table.NameFL}Id, "${table.NameFL}Id不能空");

        return ${table.NameFL}Mapper.selectByPrimaryKey(${table.NameFL}Id);
    }

    /**
     * 插入记录
     * @param ${table.NameFL}Vo 插入对象
     * @return 操作结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Integer insert${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo) {
        ${table.NameFU}Po ${table.NameFL}Po = new ${table.NameFU}Po();

        BeanUtils.copyProperties(${table.NameFL}Vo, ${table.NameFL}Po);

        return ${table.NameFL}Mapper.insert(${table.NameFL}Po);
    }

    /**
     * 更新记录
     * @param ${table.NameFL}Vo 更新对象
     * @return 更新结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Integer update${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo) {
        ${table.NameFU}Po ${table.NameFL}Po = ${table.NameFL}Mapper.selectByPrimaryKey(${table.NameFL}Vo.get${table.NameFU}Id());

        BeanUtils.copyProperties(${table.NameFL}Vo, ${table.NameFL}Po);

        return ${table.NameFL}Mapper.updateByPrimaryKey(${table.NameFL}Po);
    }

    /**
     * 单个删除
     * @param ${table.NameFL}Id 待删除记录主键
     * @return 删除结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Integer delete${table.NameFU}ById(Long ${table.NameFL}Id) {
        return ${table.NameFL}Mapper.deleteByPrimaryKey(${table.NameFL}Id);
    }

    /**
     * 批量查询
     * @param idList 待查询记录Id数组
     * @return 查询结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Page<${table.NameFU}Po> batchSelectByIdList(List<Long> idList) {
        return null;
    }

    /**
     * 批量删除
     * @param idList 待删除Id数组
     * @return 删除结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Integer batchDelByIdList(List<Long> idList) {
        return null;
    }

    /**
     * 查询列表
     * @param searchVo 分页查询条件
     * @return 列表
     */
    @Override
    @SuppressWarnings("unchecked")
    public Page<${table.NameFU}Po> select${table.NameFU}List(${table.NameFU}SearchVo searchVo) {
        Integer pageNum = searchVo.getPageNum();
        Integer pageSize = searchVo.getPageSize();
        if (null != pageNum && null != pageSize) {
            PageHelper.startPage(pageNum, pageSize);
        }

        return new Page<>(${table.NameFL}Mapper.select${table.NameFU}List(searchVo));
    }


    /**
    * 存在性校验
    * @param ${table.NameFL}Vo 校验对象
    * @return 校验结果
    */
    public Integer exist(${table.NameFU}Vo ${table.NameFL}Vo) {
        return null;
    }
}
