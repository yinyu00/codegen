package ${param.basePackage}.contract.feign.${param.module};

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
@FeignClient(name = "legend-oa")
public interface ${table.NameFU}Contract {

    @PostMapping("/${param.module}/${table.NameFL}/list")
    LegendResponse<IPage<${table.NameFU}>> list(
        @RequestParam(value = "query", required = false) String query,
        @RequestParam(value = "pageIndex", required = false, defaultValue = "1") int pageIndex,
        @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize);

    @PostMapping("/${param.module}/${table.NameFL}/select")
    LegendResponse<List<${table.NameFU}SV>> select(@RequestParam(value = "query", required = false) String query);

    @GetMapping("/${param.module}/${table.NameFL}/{id}")
    LegendResponse<${table.NameFU}> getById(@PathVariable("id") String id);

    @PostMapping("/${param.module}/${table.NameFL}")
    LegendResponse<String> insert(@RequestBody ${table.NameFU} ${table.NameFL});

    @PostMapping("/${param.module}/${table.NameFL}/del/{id}")
    LegendResponse<String> deleteById(@PathVariable("id") String id);

    @PostMapping("/${param.module}/${table.NameFL}/batchDel")
    LegendResponse<String> batchDel(@RequestBody List<String> ids);

}