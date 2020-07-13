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

    Table table = new Table(tableName, "hr");
    table.setSchema("legend_oa");
    tableInitializer.initTable(table);
    tableInitializer.initColumn(table);
    tableInitializer.initPrimaryKey(table);

    Map<String, String> params = new HashMap<>();
//    params.put(FTLDIR, "templates/kangpaas");
    params.put(FTLDIR, "templates/oa");
    params.put(AUTHOR, "jinw");
    params.put(DATE, DateUtil.formatDate(new java.util.Date(System.currentTimeMillis()), "dd-MM-yyyy"));
    params.put(BASE_PACKAGE, "com.legend.oa.core");
    params.put(VO_PACKAGE, "com.legend.oa.core.model");
    params.put("module", "hr");
    params.put(BASE_URI, "/api/v1/appsys/");
    params.put(API_ID_PREFIX, "60104550");
    params.put(MENU_ID, "60104550");

    tableGenerator.generate(table, params);

    logger.info("table = {}", table);
  }


  @Test
  public void batchGenerate() throws Exception {
    List<String> tables = Arrays.asList(""
        , "hr_user"
        , "hr_user_pay"
        , "hr_user_study"
        , "hr_user_work"
//        , "hr_year_holiday"
//        , "sys_dict_param"
    );
    for (String tableName : tables) {
      generate(tableName);
    }
  }

}
