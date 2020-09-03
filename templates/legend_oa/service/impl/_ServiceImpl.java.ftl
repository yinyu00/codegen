package ${param.basePackage}.core.service.${param.module}.impl;

import com.legend.framework.mybatis.core.conditions.query.QueryWrapper;
import com.legend.framework.mybatis.extension.plugins.pagination.Page;
import com.legend.framework.mybatis.extension.service.impl.BaseServiceImpl;

import ${param.basePackage}.core.mapper.${param.module}.${table.NameFU}Mapper;
import ${param.basePackage}.core.service.${param.module}.${table.NameFU}Service;
import ${param.basePackage}.contract.model.${param.module}.${table.NameFU};
import ${param.basePackage}.contract.model.${param.module}.${table.NameFU}SV;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;

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
public class ${table.NameFU}ServiceImpl  extends BaseServiceImpl<${table.NameFU}Mapper, ${table.NameFU}> implements ${table.NameFU}Service {

    /**
     * 查询列表
     * @param query 查询参数
     * @param pageIndex 当前页码
     * @param pageSize 每页记录数
     * @return 列表
     */
    @Override
    public Page<${table.NameFU}> listByWrapper(String query, int pageIndex, int pageSize) {
        Page<${table.NameFU}> page = new Page<>(pageIndex, pageSize);

        QueryWrapper<${table.NameFU}> wrapper = new QueryWrapper<>();
        if(StringUtils.isNotEmpty(query)) {
            wrapper.eq("${table.NameFL}_name", query);
        }

        return baseMapper.selectPage(page, wrapper);
    }

    /**
     * 查询列表
     * @param query 查询参数
     * @param pageIndex 当前页码
     * @param pageSize 每页记录数
     * @return 列表
     */
    @Override
    public Page<${table.NameFU}> listBySQL(String query, int pageIndex, int pageSize) {
        Page<${table.NameFU}> page = new Page<>(pageIndex, pageSize);
        return baseMapper.listBySQL(page, query);
    }

    /**
     * 查询列表
     * @param query 查询条件
     * @return 列表
     */
    public List<${table.NameFU}SV> select(String query) {
        return baseMapper.select(query);
    }

    /**
     * 批量删除
     * @param ids 待删除Id数组
     * @return 删除结果
     */
    @Override
    public int batchDel(List<String> ids) {
        return baseMapper.batchDel(ids);
    }

    /**
     * 查询单条记录
     * @param id 编号
     * @return ${table.NameFU}
     */
    public ${table.NameFU} selectOneById(String id) {
        return baseMapper.selectOneById(id);
    }

}
