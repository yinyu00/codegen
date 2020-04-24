package ${param.basePackage}.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

import ${param.basePackage}.service.I${table.NameFU}Service;
import ${param.voPackage}.bo.${table.NameFU}Bo;
import ${param.voPackage}.vo.${table.NameFU}SearchVo;
import ${param.voPackage}.vo.${table.NameFU}Vo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class ${table.NameFU}Controller {

    /**
     * LOGGER日志
     */
    private static final Logger LOG = LoggerFactory.getLogger(${table.NameFU}Controller.class);

    private I${table.NameFU}Service ${table.NameFL}Service;
    @Autowired
    public void set${table.NameFU}Service(I${table.NameFU}Service ${table.NameFL}Service) {
        this.${table.NameFL}Service = ${table.NameFL}Service;
    }

    @ApiOperation(value = "查询${table.comments}列表", notes = "查询${table.comments}列表")
    @PostMapping(value = "/list")
    public PageInfo<${table.NameFU}Bo> list(@RequestBody ${table.NameFU}SearchVo searchVo) {
        return ${table.NameFL}Service.select${table.NameFU}List(searchVo);
    }

    @ApiOperation(value = "select${table.NameFU}", notes = "查询单个资源详情")
    @GetMapping("/{id}")
    public ${table.NameFU}Bo select${table.NameFU}ById(@PathVariable Long id) {
        return ${table.NameFL}Service.select${table.NameFU}ById(id);
    }

    @ApiOperation(value = "add${table.NameFU}", notes = "新增${table.comments}")
    @PostMapping
    public Integer insert${table.NameFU}(@RequestBody ${table.NameFU}Vo ${table.NameFL}Vo) {
        if(LOG.isDebugEnabled()) {
            LOG.debug("${table.NameFU}Controller.insert${table.NameFU} 被触发, ${table.NameFL}Vo = {}", ${table.NameFL}Vo);
        }

        try {
            return ${table.NameFL}Service.insert${table.NameFU}(${table.NameFL}Vo);
        }
        catch (Exception ex) {
            throw ex;
        }
    }

    @ApiOperation(value = "update${table.NameFU}", notes = "更新${table.comments}")
    @PutMapping
    public Integer update${table.NameFU}(@RequestBody ${table.NameFU}Vo ${table.NameFL}Vo) {
        if(LOG.isDebugEnabled()) {
            LOG.debug("${table.NameFU}Controller.update${table.NameFU} 被触发, ${table.NameFL}Vo = {}", ${table.NameFL}Vo);
        }

        try {
            return ${table.NameFL}Service.update${table.NameFU}(${table.NameFL}Vo);
        }
        catch (Exception ex) {
            throw ex;
        }
    }

    @ApiOperation(value = "delete${table.NameFU}", notes = "删除${table.comments}")
    @DeleteMapping("/{id}")
    public Integer delete${table.NameFU}(@PathVariable Long id) {
        if(LOG.isDebugEnabled()) {
            LOG.debug("${table.NameFU}Controller.delete${table.NameFU} 被触发, id = {}", id);
        }

        try {
            return ${table.NameFL}Service.delete${table.NameFU}ById(id);
        }
        catch (Exception ex) {
            throw ex;
        }
    }

    @ApiOperation(value = "batchDelete${table.NameFU}", notes = "批量删除${table.comments}")
    @DeleteMapping("/batchDel")
    public Integer batchDel(@RequestBody List<Long> deleteIdListVo) {
        if(LOG.isDebugEnabled()) {
            LOG.debug("${table.NameFU}Controller.batchDel 被触发, deleteIdListVo = {}", deleteIdListVo);
        }

        try {
            return ${table.NameFL}Service.batchDelByIdList(deleteIdListVo);
        }
        catch (Exception ex) {
            throw ex;
        }
    }

    @ApiOperation(value = "check${table.NameFU}Exist", notes = "存在性校验")
    @PostMapping("/exist")
    public Integer exist(@RequestBody ${table.NameFU}Vo vo) {
        if(LOG.isDebugEnabled()) {
            LOG.debug("${table.NameFU}Controller.exist 被触发, vo = {}", vo);
        }

        return ${table.NameFL}Service.exist(vo);
    }

}
