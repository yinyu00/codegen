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
package ${param.basePackage}.service.impl;

import ${param.basePackage}.entity.${table.NameFU};
import ${param.basePackage}.mapper.${table.NameFU}Mapper;
import ${param.basePackage}.service.${table.NameFU}Service;
import cn.runzogroup.biz.web.service.impl.BizServiceImpl;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;

/**
* ${table.comments} 服务实现类
*
* @author BladeX
* @since 2021-10-08
*/
@Service
public class ${table.NameFU}ServiceImpl extends BizServiceImpl<${table.NameFU}Mapper, ${table.NameFU}> implements ${table.NameFU}Service {

@Override
public IPage<${table.NameFU}> selectPage(IPage<${table.NameFU}> page, ${table.NameFU} ${table.NameFL}) {
    return page.setRecords(baseMapper.selectPage(page, ${table.NameFL}));
    }

}