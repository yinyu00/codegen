package ${param.basePackage}.controller;

import ${param.basePackage}.service.${table.NameFU}Service;
import com.kangpaas.common.core.exception.ErrorCodeEnum;
import ${param.voPackage}.${table.NameFU}Vo;
import com.kangpaas.sdk.common.vo.DeleteIdListVo;
import com.kangpaas.sdk.common.vo.PlatformResult;
import com.kangpaas.sdk.common.vo.RequestPageVo;
import com.kangpaas.sdk.common.vo.ResponsePageVo;
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
 * @date 2019-4-25 0025 下午 2:05
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

    @ApiOperation(value = "select", notes = "查询单个资源详情")
    @GetMapping("/{id}")
    public PlatformResult select${table.NameFU}ById(@PathVariable Long id) {
        return ${table.NameFL}Service.select${table.NameFU}ById(id);
    }

    @ApiOperation(value = "add${table.NameFU}", notes = "新建${table.comments}")
    @PostMapping
    public PlatformResult insert${table.NameFU}(@RequestBody ${table.NameFU}Vo ${table.NameFL}Vo) {
        try {
            return ${table.NameFL}Service.insert${table.NameFU}(${table.NameFL}Vo);
        }
        catch (Exception ex) {
            LOG.error(ErrorCodeEnum.${table.Name?upper_case}_CREATE_ERR.getMessage(), ex);
            return PlatformResult.failure(ErrorCodeEnum.${table.Name?upper_case}_CREATE_ERR.getCode(), ErrorCodeEnum.${table.Name?upper_case}_CREATE_ERR.getMessage());
        }
    }

    @ApiOperation(value = "update", notes = "更新${table.comments}")
    @PutMapping
    public PlatformResult update${table.NameFU}(@RequestBody ${table.NameFU}Vo ${table.NameFL}Vo) {
        try {
            return ${table.NameFL}Service.update${table.NameFU}(${table.NameFL}Vo);
        }
        catch (Exception ex) {
            LOG.error(ErrorCodeEnum.${table.Name?upper_case}_UPDATE_ERR.getMessage(), ex);
            return PlatformResult.failure(ErrorCodeEnum.${table.Name?upper_case}_UPDATE_ERR.getCode(), ErrorCodeEnum.${table.Name?upper_case}_UPDATE_ERR.getMessage());
        }
    }

    @ApiOperation(value = "delete", notes = "删除单个${table.comments}")
    @DeleteMapping("/{id}")
    public PlatformResult delete${table.NameFU}(@PathVariable Long id) {
        try {
            return ${table.NameFL}Service.delete${table.NameFU}ById(id);
        }
        catch (Exception ex) {
            LOG.error(ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR.getMessage(), ex);
            return PlatformResult.failure(ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR.getCode(), ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR.getMessage());
        }
    }

    @ApiOperation(value = "batchDel", notes = "批量删除${table.comments}")
    @DeleteMapping("/batchDel")
    public PlatformResult batchDel(@RequestBody DeleteIdListVo deleteIdListVo) {
        try {
            return ${table.NameFL}Service.batchDelByIdList(deleteIdListVo.getDelIdList());
        }
        catch (Exception ex) {
            LOG.error(ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR.getMessage(), ex);
            return PlatformResult.failure(ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR.getCode(), ErrorCodeEnum.${table.Name?upper_case}_DELETE_ERR.getMessage());
        }
    }

    @ApiOperation(value = "exist", notes = "存在性校验")
    @PostMapping("/exist")
    public PlatformResult exist(@RequestBody ${table.NameFU}Vo vo) {
        return ${table.NameFL}Service.exist(vo);
    }

}
