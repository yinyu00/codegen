package ${param.basePackage}.api.controller.${param.module};

import com.legend.framework.common.vo.ComboBoxVo;
import com.legend.framework.common.response.LegendResponse;
import com.legend.framework.mybatis.extension.plugins.pagination.Page;

import ${param.basePackage}.core.service.${param.module}.${table.NameFU}Service;
import ${param.basePackage}.contract.model.${param.module}.${table.NameFU};
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * 功能描述: ${table.comments}接口
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@Api(value = "${table.comments}API", tags = "${table.comments}接口规格")
@RequestMapping("/${param.module}/${table.NameFL}")
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
        @ApiImplicitParam(name = "companyId", value = "租户编号"),
        @ApiImplicitParam(name = "query", value = "查询条件"),
        @ApiImplicitParam(name = "pageIndex", value = "当前页码", defaultValue = "1"),
        @ApiImplicitParam(name = "pageSize" , value = "页面条数", defaultValue = "10"),
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @PostMapping("/list")
    public LegendResponse<Page<${table.NameFU}>> list(
        @RequestParam(value = "companyId", required = false) String companyId,
        @RequestParam(value = "query", required = false) String query,
        @RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
        @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize) {
        return LegendResponse.ok(${table.NameFL}Service.listBySQL(companyId, query, pageIndex, pageSize));
    }

    @ApiOperation(value = "查询${table.comments}, 仅返回编码和名称", notes = "查询${table.comments}, 仅返回编码和名称")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "companyId", value = "租户编号"),
        @ApiImplicitParam(name = "query", value = "查询条件"),
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @PostMapping("/select")
    public LegendResponse<List<ComboBoxVo>> select(
            @RequestParam(value = "companyId", required = false) String companyId,
            @RequestParam(value = "query", required = false) String query) {
        return LegendResponse.ok(${table.NameFL}Service.select(companyId, query));
    }

    @ApiOperation(value = "查询单个${table.comments}", notes = "查询单个${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @GetMapping("/{id}")
    public LegendResponse<${table.NameFU}> getById(@PathVariable("id") String id) {
        return LegendResponse.ok(${table.NameFL}Service.selectOneById(id));
    }

    @ApiOperation(value = "新增${table.comments}", notes = "新增${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @PostMapping
    public LegendResponse<String> insert(@RequestBody @Valid ${table.NameFU} ${table.NameFL}) {
        if(log.isDebugEnabled()) {
            log.debug("${table.NameFU}Controller.insert 被触发, ${table.NameFL} = {}", ${table.NameFL});
        }

        boolean result = StringUtils.isEmpty(${table.NameFL}.getId()) ? ${table.NameFL}Service.save(${table.NameFL}) : ${table.NameFL}Service.updateById(${table.NameFL});
        if (result) {
            return LegendResponse.ok("添加${table.comments}成功");
        }
        return LegendResponse.error("添加${table.comments}失败");
    }

    @ApiOperation(value = "删除${table.comments}", notes = "删除${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @PostMapping("/del/{id}")
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
    @PostMapping("/batchDel")
    public LegendResponse<String> batchDel(@RequestBody List<String> ids) {
        if(log.isDebugEnabled()) {
            log.debug("${table.NameFU}Controller.batchDel 被触发, ids = {}", ids);
        }

        if (${table.NameFL}Service.batchDel(ids) > 0) {
            return LegendResponse.ok("批量删除${table.comments}成功");
        }
        return LegendResponse.error("批量删除${table.comments}失败");
    }

    @ApiOperation(value = "根据编号批量查询${table.comments},", notes = "根据编号批量查询${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "ids", value = "编号列表"),
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @PostMapping("/selectByIds")
    public LegendResponse<List<${table.NameFU}>> selectByIds(@RequestBody List<String> ids) {
        return LegendResponse.ok(${table.NameFL}Service.selectByIds(ids));
    }

}
