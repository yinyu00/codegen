package com.nocompany.tools.codegen;

import com.nocompany.tools.codegen.generate.TableGenerator;
import com.nocompany.tools.codegen.initialize.TableInitializer;
import com.nocompany.tools.codegen.model.Table;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

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
        Table table = new Table("monitor_disc_item"); // monitor_disc_rule monitor_disc_item
        tableInitializer.initColumn(table);
        tableInitializer.initPrimaryKey(table);

        Map<String, String> params = new HashMap<>();
        params.put("ftlDir", "templates/kangpaas");

//        tableGenerator.init(params.get("ftlDir"));
        tableGenerator.generate(table, params);

        logger.info("table = {}", table);
    }

}
