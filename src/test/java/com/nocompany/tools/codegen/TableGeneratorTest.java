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
import org.springframework.beans.factory.annotation.Value;
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

    @Value("${db.schema}")
    private String schema;

    @Value("${db.template}")
    private String template;

    @Value("${db.module}")
    private String module;

    @Value("${db.base.package}")
    private String basePackage;

    @Value("${db.vo.package}")
    private String voPackage;

    @Value("${db.table.prefix}")
    private String tablePrefix;

    public void setTableInitializer(TableInitializer tableInitializer) {
        this.tableInitializer = tableInitializer;
    }

    public void setTableGenerator(TableGenerator tableGenerator) {
        this.tableGenerator = tableGenerator;
    }

    public void generate(String schema, String tableName) throws Exception {
        Table table = new Table(schema, tableName, tablePrefix);

        tableInitializer.initTable(table);
        tableInitializer.initColumn(table);
        tableInitializer.initPrimaryKey(table);

        Map<String, String> params = new HashMap<>();
        params.put(FTLDIR, "templates/" + template);
        params.put(AUTHOR, "jinw");
        params.put(DATE, DateUtil.formatDate(new java.util.Date(System.currentTimeMillis()), "dd-MM-yyyy"));
        params.put(BASE_PACKAGE, basePackage);
        params.put(VO_PACKAGE, voPackage);
        params.put(MODULE, module);
        params.put(BASE_URI, "/api/");
        params.put(API_ID_PREFIX, "60104550");
        params.put(MENU_ID, "60104550");

        tableGenerator.generate(table, params);

        logger.info("table = {}", table);
    }


    @Test
    public void batchGenerate() throws Exception {
        List<String> tables = Arrays.asList(
//                "fabric_mdm_prd_category",
//                "fabric_mdm_prd_category_attr",
//                "fabric_mdm_product",
//                "fabric_mdm_product_attr"
            "e8_mdm_dye_category",
            "e8_mdm_dye_info",
            "e8_mdm_dye_vat",
            "e8_mdm_dye_vat_process",
            "e8_mdm_process_step",
            "e8_mdm_prod_category",
            "e8_mdm_yarn_category",
            "e8_mdm_yarn_info"

        );
        for (String tableName : tables) {
            generate(schema, tableName);
        }

    }

}
