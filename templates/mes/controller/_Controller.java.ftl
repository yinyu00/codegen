package ${param.basePackage}.controller.${param.module};

import com.legend.framework.common.response.LegendResponse;
import com.legend.framework.mybatis.core.metadata.IPage;

import ${param.basePackage}.service.${param.module}.${table.NameFU}Service;
import ${param.basePackage}.model.${param.module}.${table.NameFU};
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 功能描述: ${table.comments}接口
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@Api(value = "${table.comments}API", tags = "${table.comments}接口规格")
@RequestMapping("/${table.NameFL}")
@RestController
@Slf4j
public class ${table.NameFU}Controller {

    private ${table.NameFU}Service ${table.NameFL}Service;
    @Autowired
    public void set${table.NameFU}Service(${table.NameFU}Service ${table.NameFL}Service) {
        this.${table.NameFL}Service = ${table.NameFL}Service;
    }


    @ApiOperation(value = "分页查询${table.comments}", notes = "分页查询${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "${table.NameFL}Name", value = "查询名称"),
        @ApiImplicitParam(name = "pageIndex", value = "当前页码", defaultValue = "1"),
        @ApiImplicitParam(name = "pageSize" , value = "页面条数", defaultValue = "10"),
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @PostMapping("/list")
    public LegendResponse<IPage<${table.NameFU}>> list(
        @RequestParam(value = "${table.NameFL}Name", required = false) String ${table.NameFL}Name,
        @RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
        @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize) {
        return LegendResponse.ok(${table.NameFL}Service.queryByCondition(${table.NameFL}Name, pageIndex, pageSize));
    }


    @ApiOperation(value = "查询单个${table.comments}", notes = "查询单个${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @GetMapping("/{id}")
    public ${table.NameFU} getById(@PathVariable String id) {
        return ${table.NameFL}Service.getById(id);
    }

    @ApiOperation(value = "新增${table.comments}", notes = "新增${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @PostMapping
    public LegendResponse<String> insert(@RequestBody ${table.NameFU} ${table.NameFL}) {
        if(log.isDebugEnabled()) {
            log.debug("${table.NameFU}Controller.insert 被触发, ${table.NameFL} = {}", ${table.NameFL});
        }

        if (${table.NameFL}Service.insert(${table.NameFL})) {
            return LegendResponse.ok("添加${table.comments}成功");
        }
        return LegendResponse.error("添加${table.comments}失败");
    }

    @ApiOperation(value = "更新${table.comments}", notes = "更新${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @PutMapping
    public LegendResponse<String> update${table.NameFU}(@RequestBody ${table.NameFU} ${table.NameFL}) {
        if(log.isDebugEnabled()) {
            log.debug("${table.NameFU}Controller.update 被触发, ${table.NameFL} = {}", ${table.NameFL});
        }

        if (${table.NameFL}Service.update(${table.NameFL})) {
            return LegendResponse.ok("修改${table.comments}成功");
        }
        return LegendResponse.error("修改${table.comments}失败");
    }

    @ApiOperation(value = "删除${table.comments}", notes = "删除${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @DeleteMapping("/{id}")
    public LegendResponse<String> deleteById(@PathVariable String id) {
        if(log.isDebugEnabled()) {
            log.debug("${table.NameFU}Controller.delete 被触发, id = {}", id);
        }

        if (${table.NameFL}Service.removeById(id)) {
            return LegendResponse.ok("删除${table.comments}成功");
        }
        return LegendResponse.error("删除${table.comments}失败");
    }

    @ApiOperation(value = "批量删除${table.comments}", notes = "批量删除${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @DeleteMapping("/batchDel")
    public LegendResponse<String> batchDel(@RequestBody List<String> ids) {
        if(log.isDebugEnabled()) {
            log.debug("${table.NameFU}Controller.batchDel 被触发, ids = {}", ids);
        }

        if (${table.NameFL}Service.batchDel(ids) > 0) {
            return LegendResponse.ok("批量删除${table.comments}成功");
        }
        return LegendResponse.error("批量删除${table.comments}失败");
    }

}
