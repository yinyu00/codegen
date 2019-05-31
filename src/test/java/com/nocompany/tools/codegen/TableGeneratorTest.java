package com.nocompany.tools.codegen;

import com.nocompany.tools.codegen.generate.TableGenerator;
import com.nocompany.tools.codegen.initialize.TableInitializer;
import com.nocompany.tools.codegen.model.Table;
import java.util.Arrays;
import java.util.List;
import org.apache.commons.httpclient.util.DateUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import static com.nocompany.tools.codegen.constant.Params.*;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TableGeneratorTest {

    /* 日志类 */
    private static final Logger logger = LoggerFactory.getLogger(TableGeneratorTest.class);

    @Autowired
    TableInitializer tableInitializer;
    @Autowired
    TableGenerator tableGenerator;

    public void setTableInitializer(TableInitializer tableInitializer) {
        this.tableInitializer = tableInitializer;
    }
    public void setTableGenerator(TableGenerator tableGenerator) {
        this.tableGenerator = tableGenerator;
    }

    @Test
    public void generate() throws Exception {
        Table table = new Table("monitor_log_input_type");
        // monitor_log_template monitor_log_template_prov monitor_log_prov

        tableInitializer.initTable(table);
        tableInitializer.initColumn(table);
        tableInitializer.initPrimaryKey(table);

        Map<String, String> params = new HashMap<>();
        params.put(FTLDIR, "templates/kangpaas");
        params.put(AUTHOR, "xg.zhao");
        params.put(DATE, DateUtil.formatDate(new java.util.Date(System.currentTimeMillis()), "dd-MM-yyyy"));
        params.put(BASE_PACKAGE, "com.kangpaas.monitormgnt");
        params.put(VO_PACKAGE, "com.kangpaas.sdk.monitormgnt.vo");
        params.put(BASE_URI, "/api/v1/monitormgnt/");
        params.put(API_ID_PREFIX, "60105000");

//        tableGenerator.init(params.get("ftlDir"));
        tableGenerator.generate(table, params);

        logger.info("table = {}", table);
    }


    @Test
    public void batchGenerate() throws Exception {
        List<String> tables = Arrays.asList("monitor_log_input_type", "monitor_log_source_type", "monitor_log_prov_filter", "monitor_log_prov_input", "monitor_log_prov_output");
        for (String tableName : tables) {
            Table table = new Table(tableName); // monitor_disc_rule monitor_disc_item
            tableInitializer.initTable(table);
            tableInitializer.initColumn(table);
            tableInitializer.initPrimaryKey(table);
            Map<String, String> params = new HashMap<>();
            params.put(FTLDIR, "templates/kangpaas");
            params.put(AUTHOR, "xg.zhao");
            params.put(DATE, DateUtil.formatDate(new java.util.Date(System.currentTimeMillis()), "dd-MM-yyyy"));
            params.put(BASE_PACKAGE, "com.kangpaas.monitormgnt.controller");
            params.put(VO_PACKAGE, "com.kangpaas.sdk.monitormgnt.vo");
            params.put(BASE_URI, "");
            //        tableGenerator.init(params.get("ftlDir"));
            tableGenerator.generate(table, params);
            logger.info("table = {}", table);
        }
    }

}
