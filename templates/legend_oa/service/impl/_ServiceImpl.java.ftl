package ${param.basePackage}.service.${param.module}.impl;

import com.legend.framework.mybatis.core.conditions.query.QueryWrapper;
import com.legend.framework.mybatis.core.metadata.IPage;
import com.legend.framework.mybatis.extension.plugins.pagination.Page;
import com.legend.framework.mybatis.extension.service.impl.BaseServiceImpl;
import com.legend.framework.shiro.util.SubjectUtil;

import ${param.basePackage}.mapper.${param.module}.${table.NameFU}Mapper;
import ${param.basePackage}.service.${param.module}.${table.NameFU}Service;
import ${param.basePackage}.model.${param.module}.${table.NameFU};
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

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
     * @param ${table.NameFL}Name 分页查询条件
     * @return 列表
     */
    @Override
    public IPage<${table.NameFU}> queryByCondition(String ${table.NameFL}Name, int pageIndex, int pageSize) {
        Page<${table.NameFU}> page = new Page<>(pageIndex, pageSize);

        QueryWrapper<${table.NameFU}> wrapper = new QueryWrapper<>();
        if(!StringUtils.isEmpty(${table.NameFL}Name)) wrapper.eq("${table.NameFL}_name", ${table.NameFL}Name);

        return baseMapper.selectPage(page, wrapper);
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
}
