package com.nocompany.tools.codegen;

import com.nocompany.tools.codegen.initialize.TableInitializer;
import com.nocompany.tools.codegen.model.Table;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.slf4j.Logger;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TableInitializerTest {

    /* 日志类 */
    private static final Logger logger = LoggerFactory.getLogger(TableInitializerTest.class);

    @Autowired
    TableInitializer tableInitializer;
    public void setTableInitializer(TableInitializer tableInitializer) {
        this.tableInitializer = tableInitializer;
    }

    @Test
    public void initColumn() {
        Table table = new Table("auth_position", "");
        tableInitializer.initColumn(table);
        tableInitializer.initPrimaryKey(table);

        logger.info("table = {}", table);
    }

}
