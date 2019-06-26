package ${param.basePackage}.controller;

import ${param.basePackage}.service.${table.NameFU}Service;
import ${param.voPackage}.${table.NameFU}Vo;
import com.kangpaas.sdk.common.vo.DeleteIdListVo;
import com.kangpaas.sdk.common.vo.PlatformResult;
import com.kangpaas.sdk.common.vo.RequestPageVo;
import com.kangpaas.sdk.common.vo.ResponsePageVo;
import com.kangpaas.sdk.core.exception.ErrorCodeEnum;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 功能描述: ${table.comments}接口
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@Api(value = "${table.comments}API", tags = "${table.comments}接口规格")
@RequestMapping("${param.baseUri}${table.NameFL}")
@RestController
public class ${table.NameFU}Controller {

    /**
     * LOGGER日志
     */
    private static final Logger LOG = LoggerFactory.getLogger(${table.NameFU}Controller.class);

    @Autowired
    private ${table.NameFU}Service ${table.NameFL}Service;

    @ApiOperation(value = "get${table.NameFU}List", notes = "查询列表")
    @PostMapping(value = "/query")
    public PlatformResult<ResponsePageVo<${table.NameFU}Vo>> select${table.NameFU}List(@RequestBody RequestPageVo<${table.NameFU}Vo> pageVo) {
        return ${table.NameFL}Service.select${table.NameFU}List(pageVo);
    }

    @ApiOperation(value = "select${table.NameFU}", notes = "查询单个资源详情")
    @GetMapping("/{id}")
    public PlatformResult select${table.NameFU}ById(@PathVariable Long id) {
        return ${table.NameFL}Service.select${table.NameFU}ById(id);
    }

    @ApiOperation(value = "add${table.NameFU}", notes = "新增${table.comments}")
    @PostMapping
    public PlatformResult insert${table.NameFU}(@RequestBody ${table.NameFU}Vo ${table.NameFL}Vo) {
        try {
            return ${table.NameFL}Service.insert${table.NameFU}(${table.NameFL}Vo);
        }
        catch (Exception ex) {
            LOG.error(ErrorCodeEnum.${table.Name?upper_case}_CREATE_ERR.getMessage(), ex);
            return PlatformResult.failure(ErrorCodeEnum.${table.Name?upper_case}_CREATE_ERR);
        }
    }

    @ApiOperation(value = "update${table.NameFU}", notes = "更新${table.comments}")
    @PutMapping
    public PlatformResult update${table.NameFU}(@RequestBody ${table.NameFU}Vo ${table.NameFL}Vo) {
        try {
            return ${table.NameFL}Service.update${table.NameFU}(${table.NameFL}Vo);
        }
        catch (Exception ex) {
            LOG.error(ErrorCodeEnum.${table.Name?upper_case}_UPDATE_ERR.getMessage(), ex);
            return PlatformResult.failure(ErrorCodeEnum.${table.Name?upper_case}_UPDATE_ERR);
        }
    }

    @ApiOperation(value = "delete${table.NameFU}", notes = "删除${table.comments}")
    @DeleteMapping("/{id}")
    public PlatformResult delete${table.NameFU}(@PathVariable Long id) {
        try {
            return ${table.NameFL}Service.delete${table.NameFU}ById(id);
        }
        catch (Exception ex) {
            LOG.error(ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR.getMessage(), ex);
            return PlatformResult.failure(ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR);
        }
    }

    @ApiOperation(value = "batchDelete${table.NameFU}", notes = "批量删除${table.comments}")
    @DeleteMapping("/batchDel")
    public PlatformResult batchDel(@RequestBody DeleteIdListVo deleteIdListVo) {
        try {
            return ${table.NameFL}Service.batchDelByIdList(deleteIdListVo.getDelIdList());
        }
        catch (Exception ex) {
            LOG.error(ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR.getMessage(), ex);
            return PlatformResult.failure(ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR);
        }
    }

    @ApiOperation(value = "check${table.NameFU}Exist", notes = "存在性校验")
    @PostMapping("/exist")
    public PlatformResult exist(@RequestBody ${table.NameFU}Vo vo) {
        return ${table.NameFL}Service.exist(vo);
    }

}
