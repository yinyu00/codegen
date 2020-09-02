package ${param.basePackage}.contract.feign;

import com.legend.framework.common.response.LegendResponse;
import com.legend.framework.mybatis.core.metadata.IPage;

import ${param.basePackage}.contract.model.${param.module}.${table.NameFU};
import ${param.basePackage}.contract.model.${param.module}.${table.NameFU}SV;

import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.cloud.openfeign.FeignClient;

import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 功能描述: ${table.comments}Feign接口
 *
 * @author ${param.author}
 * @version 1.0 ${param.date}
 */
@ConditionalOnClass(FeignClient.class)
@FeignClient(name = "${table.NameFL}")
public class ${table.NameFU}Controller {

    @PostMapping("/list")
    LegendResponse<IPage<${table.NameFU}>> list(
        @RequestParam(value = "query", required = false) String query,
        @RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
        @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize);

    @PostMapping("/select")
    LegendResponse<List<${table.NameFU}SV>> select(@RequestParam(value = "query", required = false) String query);

    @GetMapping("/{id}")
    LegendResponse<${table.NameFU}> getById(@PathVariable String id);

    @PostMapping
    LegendResponse<String> insert(@RequestBody ${table.NameFU} ${table.NameFL});

    @PostMapping("/del/{id}")
    LegendResponse<String> deleteById(@PathVariable String id);

    @PostMapping("/batchDel")
    LegendResponse<String> batchDel(@RequestBody List<String> ids);

}
