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
package ${param.basePackage}.controller;

import ${param.basePackage}.entity.${table.NameFU};
import ${param.basePackage}.service.${table.NameFU}Service;
import ${param.basePackage}.wrapper.${table.NameFU}Wrapper;
import cn.runzogroup.biz.web.controller.BizController;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;

import org.springblade.core.mp.support.Condition;
import org.springblade.core.mp.support.Query;
import org.springblade.core.tool.api.R;
import org.springframework.web.bind.annotation.*;

/**
 * ${table.comments} 控制器
 *
 * @author BladeX
 * @since 2021-10-08
 */
@RestController
@RequestMapping("/${table.NameFL}")
@Api(value = "${table.comments}", tags = "${table.comments}接口")
@AllArgsConstructor
public class ${table.NameFU}Controller extends BizController<${table.NameFU}Service, ${table.NameFU}> {
    /**
     * 分页 客户
     */
    @GetMapping("/list")
    @ApiOperationSupport(order = 2)
    @ApiOperation(value = "分页", notes = "传入BizEntity")
    @Override
    public R<IPage<${table.NameFU}>> list(${table.NameFU} entity, Query query) {
        IPage<${table.NameFU}> pages = bizService.selectPage(Condition.getPage(query), entity);
        return R.data(${table.NameFU}Wrapper.build().pageVO(pages));
    }

}
