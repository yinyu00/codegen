package ${param.basePackage}.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import ${param.basePackage}.mapper.${table.NameFU}Mapper;
import ${param.basePackage}.service.I${table.NameFU}Service;
import ${param.voPackage}.bo.${table.NameFU}Bo;
import ${param.voPackage}.vo.${table.NameFU}Vo;
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
public class ${table.NameFU}ServiceImpl implements I${table.NameFU}Service {

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
    public ${table.NameFU}Bo select${table.NameFU}ById(Long ${table.NameFL}Id) {
        return null;
    }

    /**
     * 插入记录
     * @param ${table.NameFL}Vo 插入对象
     * @return 操作结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Integer insert${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo) {
        return null;
    }

    /**
     * 更新记录
     * @param ${table.NameFL}Vo 更新对象
     * @return 更新结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Integer update${table.NameFU}(${table.NameFU}Vo ${table.NameFL}Vo) {
        return null;
    }

    /**
     * 单个删除
     * @param ${table.NameFL}Id 待删除记录主键
     * @return 删除结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Integer delete${table.NameFU}ById(Long ${table.NameFL}Id) {
        return null;
    }

    /**
     * 批量查询
     * @param idList 待查询记录Id数组
     * @return 查询结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public Page<${table.NameFU}Bo> batchSelectByIdList(List<Long> idList) {
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
     * @param pageVo 分页查询条件
     * @return 列表
     */
    @Override
    @SuppressWarnings("unchecked")
    public Page<${table.NameFU}Bo> select${table.NameFU}List(${table.NameFU}Vo pageVo) {
        return null;
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
