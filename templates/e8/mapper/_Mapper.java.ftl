/*
*      Copyright (c) 2018-2028, Chill Zhuang All rights reserved.
*
*  Redistribution and use in source and binary forms, with or without
*  modification, are permitted provided that the following conditions are met:
*
*  Redistributions of source code must retain the above copyright notice,
*  this list of conditions and the following disclaimer.
*  Redistributions in binary form must reproduce the above copyright
*  notice, this list of conditions and the following disclaimer in the
*  documentation and/or other materials provided with the distribution.
*  Neither the name of the dreamlu.net developer nor the names of its
*  contributors may be used to endorse or promote products derived from
*  this software without specific prior written permission.
*  Author: Chill 庄骞 (smallchill@163.com)
*/
package ${param.basePackage}.mapper;

import ${param.basePackage}.entity.${table.NameFU};
import cn.runzogroup.biz.web.mapper.BizMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import java.util.List;

/**
 * ${table.comments} Mapper 接口
 *
 * @author BladeX
 * @since 2021-10-08
 */
public interface ${table.NameFU}Mapper extends BizMapper<${table.NameFU}> {

   /**
    * 自定义分页
    *
    * @param page
    * @param entity
    * @return
    */
   List<${table.NameFU}> selectPage(IPage page, ${table.NameFU} entity);

}
