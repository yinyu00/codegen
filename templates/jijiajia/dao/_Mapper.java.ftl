package ${param.basePackage}.dao;

import ${param.basePackage}.entity.${table.NameFU}Entity;

import cn.vpclub.common.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 功能描述: ${table.comments}
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@Mapper
public interface ${table.NameFU}Mapper extends BaseDao<${table.NameFU}Entity> {

}