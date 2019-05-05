package com.kangpaas.monitormgnt.controller;

import com.kangpaas.monitormgnt.service.${table.NameFU}Service;
import com.kangpaas.sdk.monitormgnt.vo.${table.NameFU}Vo;
import com.kangpaas.sdk.common.vo.PlatformResult;
import com.kangpaas.sdk.common.vo.RequestPageVo;
import com.kangpaas.sdk.common.vo.ResponsePageVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 功能描述: 资源映射接口
 *
 * @author Duwei
 * @date 2019-4-25 0025 下午 2:05
 */
@Api(value = "资源映射API", tags = "资源映射接口规格")
@RequestMapping("/api/v1/monitormgnt/${table.NameFL}")
@RestController
public class ${table.NameFU}Controller {

    @Autowired
    private ${table.NameFU}Service ${table.NameFL}Service;

    @ApiOperation(value = "get${table.NameFU}List", notes = "查询资源映射列表")
    @PostMapping(value = "/query")
    public PlatformResult<ResponsePageVo<${table.NameFU}Vo>> selectCiList(@RequestBody RequestPageVo<${table.NameFU}Vo> pageVo) {
        return ${table.NameFL}Service.select${table.NameFU}List(pageVo);
    }
}
