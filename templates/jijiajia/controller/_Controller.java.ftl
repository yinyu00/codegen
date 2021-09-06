package ${param.basePackage}.controller;

import ${param.basePackage}.entity.${table.NameFU}Entity;
import ${param.basePackage}.vo.${table.NameFU}Vo;
import ${param.basePackage}.service.${table.NameFU}Service;
import cn.vpclub.bulk.common.vo.RequestPageVo;
import cn.vpclub.bulk.common.util.ResultUtil;
import cn.vpclub.common.page.PageData;
import cn.vpclub.common.utils.Result;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 功能描述: ${table.comments}接口
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@Api(value = "${table.comments}API", tags = "${table.comments}接口规格")
@RequestMapping("${param.baseUri}${table.NameFL}")
@RestController
@Slf4j
@AllArgsConstructor
public class ${table.NameFU}Controller {

    private final ${table.NameFU}Service ${table.NameFL}Service;

    @ApiOperation(value = "get${table.NameFU}List", notes = "查询列表")
    @PostMapping(value = "/query")
    public Result<PageData<${table.NameFU}Vo>> select${table.NameFU}List(@RequestBody RequestPageVo<${table.NameFU}Vo> pageVo) {
        return ResultUtil.ok(${table.NameFL}Service.listBySql(pageVo));
    }

    @ApiOperation(value = "select${table.NameFU}", notes = "查询单个资源详情")
    @GetMapping("/{id}")
    public Result<${table.NameFU}Vo> select${table.NameFU}ById(@PathVariable Long id) {
        return ResultUtil.ok(${table.NameFL}Service.select${table.NameFU}ById(id));
    }

    @ApiOperation(value = "add${table.NameFU}", notes = "新增${table.comments}")
    @PostMapping
    public Result<Integer> insert${table.NameFU}(@RequestBody ${table.NameFU}Vo ${table.NameFL}Vo) {
        if(log.isDebugEnabled()) {
            log.debug("AppLayerController.insert${table.NameFU} 被触发, ${table.NameFL}Vo = {}", ${table.NameFL}Vo);
        }

        return ResultUtil.ok(${table.NameFL}Service.insert${table.NameFU}(${table.NameFL}Vo));
    }

    @ApiOperation(value = "update${table.NameFU}", notes = "更新${table.comments}")
    @PutMapping
    public Result<Integer> update${table.NameFU}(@RequestBody ${table.NameFU}Vo ${table.NameFL}Vo) {
        if(log.isDebugEnabled()) {
            log.debug("AppLayerController.update${table.NameFU} 被触发, ${table.NameFL}Vo = {}", ${table.NameFL}Vo);
        }

        return ResultUtil.ok(${table.NameFL}Service.update${table.NameFU}(${table.NameFL}Vo));
    }

    @ApiOperation(value = "delete${table.NameFU}", notes = "删除${table.comments}")
    @DeleteMapping("/{id}")
    public Result<Integer> delete${table.NameFU}(@PathVariable Long id) {
        if(log.isDebugEnabled()) {
            log.debug("AppLayerController.delete${table.NameFU} 被触发, id = {}", id);
        }

        return ResultUtil.ok(${table.NameFL}Service.delete${table.NameFU}ById(id));
    }

    @ApiOperation(value = "batchDelete${table.NameFU}", notes = "批量删除${table.comments}")
    @DeleteMapping("/batchDel")
    public Result<Integer> batchDel(@RequestBody List<Long> deleteIdList) {
        if(log.isDebugEnabled()) {
            log.debug("AppLayerController.batchDel 被触发, deleteIdList = {}", deleteIdList);
        }

        return ResultUtil.ok(${table.NameFL}Service.batchDelByIdList(deleteIdList));
    }

    @ApiOperation(value = "check${table.NameFU}Exist", notes = "存在性校验")
    @PostMapping("/exist")
    public Result<Integer> exist(@RequestBody ${table.NameFU}Vo vo) {
        if(log.isDebugEnabled()) {
            log.debug("AppLayerController.exist 被触发, vo = {}", vo);
        }

        return ResultUtil.ok(${table.NameFL}Service.exist(vo));
    }

}