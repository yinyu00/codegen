package com.kangpaas.monitormgnt.controller;

import com.kangpaas.monitormgnt.service.${table.NameFU}Service;
import com.kangpaas.sdk.monitormgnt.vo.${table.NameFU}Vo;
import com.kangpaas.sdk.common.vo.DeleteIdListVo;
import com.kangpaas.sdk.common.vo.PlatformResult;
import com.kangpaas.sdk.common.vo.RequestPageVo;
import com.kangpaas.sdk.common.vo.ResponsePageVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 功能描述: XXXXXX接口
 *
 * @author Duwei
 * @date 2019-4-25 0025 下午 2:05
 */
@Api(value = "XXXXXXAPI", tags = "XXXXXX接口规格")
@RequestMapping("/api/v1/monitormgnt/${table.NameFL}")
@RestController
public class ${table.NameFU}Controller {

    @Autowired
    private ${table.NameFU}Service ${table.NameFL}Service;

    @ApiOperation(value = "get${table.NameFU}List", notes = "查询XXXXXX列表")
    @PostMapping(value = "/query")
    public PlatformResult<ResponsePageVo<${table.NameFU}Vo>> select${table.NameFU}List(@RequestBody RequestPageVo<${table.NameFU}Vo> pageVo) {
        return ${table.NameFL}Service.select${table.NameFU}List(pageVo);
    }

    @ApiOperation(value = "select", notes = "查询单个资源详情")
    @GetMapping("/{id}")
    public PlatformResult select${table.NameFU}ById(@PathVariable Long id) {
        return ${table.NameFL}Service.select${table.NameFU}ById(id);
    }

    @ApiOperation(value = "insert", notes = "新建资源")
    @PostMapping
    public PlatformResult insert${table.NameFU}(@RequestBody ${table.NameFU}Vo ${table.NameFL}Vo) {
        return ${table.NameFL}Service.insert${table.NameFU}(${table.NameFL}Vo);
    }

    @ApiOperation(value = "update", notes = "更新资源")
    @PutMapping
    public PlatformResult update${table.NameFU}(@RequestBody ${table.NameFU}Vo ${table.NameFL}Vo) {
        return ${table.NameFL}Service.update${table.NameFU}(${table.NameFL}Vo);
    }

    @ApiOperation(value = "delete", notes = "删除单个资源")
    @DeleteMapping("/{id}")
    public PlatformResult delete${table.NameFU}(@PathVariable Long id) {
        return ${table.NameFL}Service.delete${table.NameFU}ById(id);
    }

    @ApiOperation(value = "batchDel", notes = "批量删除资源")
    @DeleteMapping("/batchDel")
    public PlatformResult batchDel(@RequestBody DeleteIdListVo deleteIdListVo) {
        return ${table.NameFL}Service.batchDelByIdList(deleteIdListVo.getDelIdList());
    }

    @ApiOperation(value = "exist", notes = "存在性校验")
    @PostMapping("/exist")
    public PlatformResult exist(@RequestBody ${table.NameFU}Vo vo) {
        return ${table.NameFL}Service.exist(vo);
    }

}
