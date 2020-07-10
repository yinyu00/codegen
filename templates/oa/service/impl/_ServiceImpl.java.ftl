package ${param.basePackage}.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import ${param.basePackage}.mapper.${table.NameFU}Mapper;
import ${param.basePackage}.service.${table.NameFU}Service;
import ${param.voPackage}.${table.NameFU};
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
public class ${table.NameFU}ServiceImpl implements ${table.NameFU}Service {

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
     * 根据id加载数据
     * @param id 物理主键
     * @return 操作结果
     */
    @Override
    public ${table.NameFU} getById(Long id) {
        Assert.notNull(id, "id不能空");

        return ${table.NameFL}Mapper.getById(id);
    }

    /**
     * 插入记录
     * @param ${table.NameFL} 插入对象
     * @return 操作结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public int insert(${table.NameFU} ${table.NameFL}) {
        return ${table.NameFL}Mapper.insert(${table.NameFL});
    }

    /**
     * 更新记录
     * @param ${table.NameFL} 更新对象
     * @return 更新结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public int update(${table.NameFU} ${table.NameFL}) {
        ${table.NameFU} ${table.NameFL}Po = ${table.NameFL}Mapper.getById(${table.NameFL}.getId());

        BeanUtils.copyProperties(${table.NameFL}, ${table.NameFL}Po);

        return ${table.NameFL}Mapper.update(${table.NameFL}Po);
    }

    /**
     * 单个删除
     * @param id 待删除记录主键
     * @return 删除结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public int deleteById(Long id) {
        return ${table.NameFL}Mapper.deleteById(id);
    }

    /**
     * 批量删除
     * @param idList 待删除Id数组
     * @return 删除结果
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    @Override
    public int batchDel(List<Long> idList) {
        return 0;
    }

    /**
     * 查询列表
     * @param ${table.NameFL}Name 分页查询条件
     * @return 列表
     */
    @Override
    @SuppressWarnings("unchecked")
    public PageInfo<${table.NameFU}> queryByCondition(String ${table.NameFL}Name, int pageIndex, int pageSize) {
        PageHelper.startPage(pageIndex, pageSize);

        return new PageInfo<>(${table.NameFL}Mapper.queryByCondition(${table.NameFL}Name));
    }

}