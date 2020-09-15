package ${param.basePackage}.api.controller.feign.${param.module};

import com.legend.framework.common.vo.ComboBoxVo;
import com.legend.framework.common.response.LegendResponse;
import com.legend.framework.mybatis.extension.plugins.pagination.Page;
import com.legend.framework.shiro.util.SubjectUtil;
import com.legend.oa.contract.model.sys.User;

import ${param.basePackage}.contract.feign.${param.module}.${table.NameFU}Contract;
import ${param.basePackage}.contract.model.${param.module}.${table.NameFU};
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * 功能描述: ${table.comments}Feign接口
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@Api(value = "${table.comments} Feign-Client", tags = "${table.comments} Feign-Client 接口规格")
@RequestMapping("/${param.module}/${table.NameFL}")
@RestController
@Slf4j
public class ${table.NameFU}FeignController {

    private ${table.NameFU}Contract ${table.NameFL}Contract;
    @Autowired
    public void set${table.NameFU}Contract(${table.NameFU}Contract ${table.NameFL}Contract) {
        this.${table.NameFL}Contract = ${table.NameFL}Contract;
    }

    @ApiOperation(value = "分页查询${table.comments}", notes = "分页查询${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "query", value = "查询条件"),
        @ApiImplicitParam(name = "pageIndex", value = "当前页码", defaultValue = "1"),
        @ApiImplicitParam(name = "pageSize" , value = "页面条数", defaultValue = "10"),
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @PostMapping("/list")
    public LegendResponse<Page<${table.NameFU}>> list(
        @RequestParam(value = "query", required = false) String query,
        @RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
        @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize) {
        User user = SubjectUtil.getUser(User.class);
        return ${table.NameFL}Contract.list(user.getPrimaryCompanyId(), query, pageIndex, pageSize);
    }

    @ApiOperation(value = "查询${table.comments}, 仅返回编码和名称", notes = "查询${table.comments}, 仅返回编码和名称")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "companyId", value = "租户编号"),
        @ApiImplicitParam(name = "query", value = "查询条件"),
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @PostMapping("/select")
    public LegendResponse<List<ComboBoxVo>> select(
            @RequestParam(value = "query", required = false) String query) {
        User user = SubjectUtil.getUser(User.class);
        return ${table.NameFL}Contract.select(user.getPrimaryCompanyId(), query);
    }

    @ApiOperation(value = "查询单个${table.comments}", notes = "查询单个${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @GetMapping("/{id}")
    public LegendResponse<${table.NameFU}> getById(@PathVariable String id) {
        return ${table.NameFL}Contract.getById(id);
    }

    @ApiOperation(value = "新增${table.comments}", notes = "新增${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @PostMapping
    public LegendResponse<String> insert(@RequestBody ${table.NameFU} ${table.NameFL}) {
        User user = SubjectUtil.getUser(User.class);
        if (StringUtils.isEmpty(${table.NameFL}.getId())) {
            ${table.NameFL}.setCompanyId(user.getPrimaryCompanyId());
            ${table.NameFL}.setCreateBy(user.getId());
            ${table.NameFL}.setCreateTime(new Date());
        } else {
            ${table.NameFL}.setUpdateBy(user.getId());
            ${table.NameFL}.setUpdateTime(new Date());
        }

        return ${table.NameFL}Contract.insert(${table.NameFL});
    }

    @ApiOperation(value = "删除${table.comments}", notes = "删除${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @PostMapping("/del/{id}")
    public LegendResponse<String> deleteById(@PathVariable String id) {
        return ${table.NameFL}Contract.deleteById(id);
    }

    @ApiOperation(value = "批量删除${table.comments}", notes = "批量删除${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @PostMapping("/batchDel")
    public LegendResponse<String> batchDel(@RequestBody List<String> ids) {
        return ${table.NameFL}Contract.batchDel(ids);
    }

    @ApiOperation(value = "根据编号批量查询${table.comments},", notes = "根据编号批量查询${table.comments}")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "ids", value = "编号列表"),
        @ApiImplicitParam(name = "Authorization", required = true, dataType = "string", value = "access_token", paramType = "header")
    })
    @PostMapping("/selectByIds")
    public LegendResponse<List<${table.NameFU}>> selectByIds(@RequestBody List<String> ids) {
        return ${table.NameFL}Contract.selectByIds(ids);
    }
}
