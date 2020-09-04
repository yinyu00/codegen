package ${param.basePackage}.core.service.${param.module}.impl;

import com.legend.framework.common.util.ComboBoxUtil;
import com.legend.framework.mybatis.core.conditions.query.QueryWrapper;
import com.legend.framework.common.vo.ComboBoxVo;
import com.legend.framework.mybatis.extension.plugins.pagination.Page;
import com.legend.framework.mybatis.extension.service.impl.BaseServiceImpl;

import ${param.basePackage}.core.mapper.${param.module}.${table.NameFU}Mapper;
import ${param.basePackage}.core.service.${param.module}.${table.NameFU}Service;
import ${param.basePackage}.contract.model.${param.module}.${table.NameFU};
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
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
     * @param companyId 租户编号
     * @param query 查询参数
     * @param pageIndex 当前页码
     * @param pageSize 每页记录数
     * @return 列表
     */
    @Override
    public Page<${table.NameFU}> listByWrapper(String companyId, String query, int pageIndex, int pageSize) {
        Page<${table.NameFU}> page = new Page<>(pageIndex, pageSize);

        QueryWrapper<${table.NameFU}> wrapper = new QueryWrapper<>();
        wrapper.eq("company_id", companyId);
        if(StringUtils.isNotEmpty(query)) {
            wrapper.eq("${table.NameFL}_name", query);
        }

        return baseMapper.selectPage(page, wrapper);
    }

    /**
     * 查询列表
     * @param companyId 租户编号
     * @param query 查询参数
     * @param pageIndex 当前页码
     * @param pageSize 每页记录数
     * @return 列表
     */
    @Override
    public Page<${table.NameFU}> listBySQL(String companyId, String query, int pageIndex, int pageSize) {
        Page<${table.NameFU}> page = new Page<>(pageIndex, pageSize);
        return baseMapper.listBySQL(page, companyId, query);
    }

    /**
     * 查询列表
     * @param companyId 租户编号
     * @param query 查询条件
     * @return 列表
     */
    public List<ComboBoxVo> select(String companyId, String query) {
        List<${table.NameFU}> ${table.NameFL}List = baseMapper.select(companyId, query);

        List<ComboBoxVo> result = new ArrayList<>();
            if (CollectionUtils.isNotEmpty(${table.NameFL}List)) {
            result = ComboBoxUtil.buildComboBox(${table.NameFL}List, "id", "name");
        }
        return result;
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
