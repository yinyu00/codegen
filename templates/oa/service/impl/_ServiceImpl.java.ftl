package ${param.basePackage}.service.${param.module}.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import ${param.basePackage}.mapper.${param.module}.${table.NameFU}Mapper;
import ${param.basePackage}.service.${param.module}.${table.NameFU}Service;
import ${param.basePackage}.model.${param.module}.${table.NameFU};
import com.legend.oa.core.util.IdWorkerUtils;
import com.legend.oa.core.util.SubjectUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.Date;
import java.util.List;

/**
 * 功能描述: ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@Service
@Slf4j
public class ${table.NameFU}ServiceImpl implements ${table.NameFU}Service {

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
    @Override
    public int insert(${table.NameFU} ${table.NameFL}) {
        ${table.NameFL}.setId(IdWorkerUtils.getFlowIdWorkerInstance().nextId());
        ${table.NameFL}.setCreateBy(SubjectUtil.getUserId());
        ${table.NameFL}.setCreateDate(new Date());
        return ${table.NameFL}Mapper.insert(${table.NameFL});
    }

    /**
* 更新记录
     * @param ${table.NameFL} 更新对象
     * @return 更新结果
     */
    @Override
    public int update(${table.NameFU} ${table.NameFL}) {
        ${table.NameFL}.setUpdateBy(SubjectUtil.getUserId());
        ${table.NameFL}.setUpdateDate(new Date());

        return ${table.NameFL}Mapper.update(${table.NameFL});
    }

    /**
     * 单个删除
     * @param id 待删除记录主键
     * @return 删除结果
     */
    @Override
    public int deleteById(Long id) {
        return ${table.NameFL}Mapper.deleteById(id);
    }

    /**
     * 批量删除
     * @param ids 待删除Id数组
     * @return 删除结果
     */
    @Override
    public int batchDel(List<Long> ids) {
        return ${table.NameFL}Mapper.batchDel(ids);
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