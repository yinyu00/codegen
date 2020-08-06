package com.nocompany.tools.codegen;

import com.nocompany.tools.codegen.generate.TableGenerator;
import com.nocompany.tools.codegen.initialize.TableInitializer;
import com.nocompany.tools.codegen.model.Table;
import java.util.Arrays;
import java.util.List;
import org.apache.commons.httpclient.util.DateUtil;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static com.nocompany.tools.codegen.constant.Params.*;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
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

  public void generate(String tableName) throws Exception {
    if(StringUtils.isEmpty(tableName))
      return;

    String prefix = "";
    if(tableName.indexOf(',') > 0) {
      String[] arr = tableName.split(",");
      tableName = arr[0];
      prefix = arr[1];
    }

    Table table = new Table(tableName, prefix);
    table.setSchema("legend-mes");
    tableInitializer.initTable(table);
    tableInitializer.initColumn(table);
    tableInitializer.initPrimaryKey(table);

    Map<String, String> params = new HashMap<>();
    params.put(FTLDIR, "templates/mes");
    params.put(AUTHOR, "jinw");
    params.put(DATE, DateUtil.formatDate(new java.util.Date(System.currentTimeMillis()), "dd-MM-yyyy"));
    params.put(BASE_PACKAGE, "com.legend.mes");
    params.put(VO_PACKAGE, "com.legend.mes.model");
    params.put("module", "mes");
    params.put(BASE_URI, "/api/v1/appsys/");
    params.put(API_ID_PREFIX, "60104550");
    params.put(MENU_ID, "60104550");

    tableGenerator.generate(table, params);

    logger.info("table = {}", table);
  }


  @Test
  public void batchGenerate() throws Exception {
    List<String> tables = Arrays.asList(""
        , "mes_product_category,mes"
        , "mes_product,mes"
        , ""
        , ""
        , ""
        , ""
        , ""
        , ""
        , ""
        , ""
    );
    for (String tableName : tables) {
      generate(tableName);
    }
  }

}
