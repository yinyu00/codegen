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

    String module = "wms";
    String secondModel = "prd";

    Table table = new Table(tableName, prefix);
    table.setSchema("legend-" + module + "");
    tableInitializer.initTable(table);
    tableInitializer.initColumn(table);
    tableInitializer.initPrimaryKey(table);

    Map<String, String> params = new HashMap<>();
    params.put(FTLDIR, "templates/legend_oa");
    params.put(AUTHOR, "jinw");
    params.put(DATE, DateUtil.formatDate(new java.util.Date(System.currentTimeMillis()), "dd-MM-yyyy"));
    params.put(BASE_PACKAGE, "com.legend." + module);
    params.put(VO_PACKAGE, "com.legend." + module + ".contract.model");
    params.put("module", secondModel);
    params.put(BASE_URI, "/api/v1/appsys/");
    params.put(API_ID_PREFIX, "60104550");
    params.put(MENU_ID, "60104550");

    tableGenerator.generate(table, params);

    logger.info("table = {}", table);
  }


  @Test
  public void batchGenerate() throws Exception {
    List<String> tables = Arrays.asList(""
//            ,"sys_dict,sys"
//            ,"sys_organization,sys"
//            ,"sys_user,sys"

//            ,"crm_company_contact,crm"
//            ,"crm_contract,crm"
//            ,"crm_customer,crm"
//            ,"crm_supplier,crm"
//            ,"crm_supplier_address,crm"
//            ,"ord_proofing_request,ord"

//            ,"prd_material,prd"
//            ,"prd_produce_param,prd"
//            ,"prd_product,prd"
//            ,"prd_product_category,prd"
//            ,"prd_product_equipment,prd"
//            ,"prd_production_craft,prd"
//            ,"prd_production_line,prd"
//            ,"prd_production_process,prd"
//            ,"prd_production_process_param,prd"
//            ,"prd_product_bom,prd"
//            ,"prd_product_bom_detail,prd"
//            ,"prd_equipment_repair,prd"

//            ,"rel_prod_craft_process,rel"
//            ,"rel_prod_line_equip,rel"
//            ,"rel_production_process_in,rel"
//            ,"rel_production_process_out,rel"
//            ,"scm_material_batch,scm"
//            ,"scm_material_safety_stock,scm"

            ,"wms_ware_house,wms"
//            ,"wms_ware_house_area,wms"
//            ,"wms_ware_house_rank,wms"
//            ,"wms_ware_house_floor,wms"
//            ,"wms_ware_house_grid,wms"
//            ,"wms_ware_house_pos,wms"
//            ,"wms_stock_in_warrant,wms"
//            ,"wms_stock_in_detail,wms"
//            ,"wms_stock_out_warrant,wms"
//            ,"wms_stock_out_detail,wms"
//            ,"wms_storage_detail,wms"
//            ,"wms_storage_log,wms"
//            ,"wms_material_req,wms"
//            ,"wms_material_req_detail,wms"
//            ,"wms_material_return,wms"
//            ,"wms_material_return_detail,wms"
//            ,"wms_storage_check,wms"
//            ,"wms_storage_check_detail,wms"

//            ,"mes_work_order,mes"
//            ,"mes_spot_check,mes"
//            ,"mes_spot_check_detail,mes"
    );
    for (String tableName : tables) {
      generate(tableName);
    }
  }

}
