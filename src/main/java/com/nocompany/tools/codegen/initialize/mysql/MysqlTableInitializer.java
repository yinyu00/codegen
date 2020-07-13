package com.nocompany.tools.codegen.initialize.mysql;

import com.nocompany.tools.codegen.initialize.TableInitializer;
import com.nocompany.tools.codegen.model.Column;
import com.nocompany.tools.codegen.model.Table;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

//@Profile(value = "mysql")
public class MysqlTableInitializer implements TableInitializer {
  @Autowired
  JdbcTemplate jdbcTemplate;

  public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
    this.jdbcTemplate = jdbcTemplate;
  }

  public void initTable(Table table) {
    String sql = "select * from information_schema.tables where table_schema='"+table.getSchema()+"' and table_name = '" + table.getName() + "'";

    Map<String, Object> tableMap = jdbcTemplate.queryForMap(sql);
    table.setComments((String)tableMap.get("TABLE_COMMENT"));
  }

  public void initColumn(Table table) {
    String sql = "select * from information_schema.columns where table_schema='"+table.getSchema()+"' and table_name = '" + table.getName() + "'";

    List columnList = jdbcTemplate.query(sql, new RowMapper<Column>() {
      public Column mapRow(ResultSet rs, int rowNum) throws SQLException {
        Column column = new Column();
        column.setColName(rs.getString("COLUMN_NAME"));
        column.setDataType(rs.getString("DATA_TYPE"));
        switch (column.getDataType()) {
          case "tinyint":
          case "int":
          case "bigint":
          case "float":
          case "decimal":
          case "double":
            column.setDataLength(rs.getInt("NUMERIC_PRECISION"));
            break;

          case "char":
          case "varchar":
          case "text":
            column.setDataLength(rs.getInt("CHARACTER_MAXIMUM_LENGTH"));
            break;

          case "date":
          case "datetime":
          case "time":
          case "timestamp":
            column.setDataLength(20);
            break;

          default:
            throw new UnsupportedOperationException("找不到字段映射长度");

        }
        column.setDataLength(0);
        column.setNullable(rs.getString("IS_NULLABLE"));
        column.setComments(rs.getString("COLUMN_COMMENT"));

        // 是否主键
        if("PRI".equals(rs.getString("COLUMN_KEY"))) {
          column.setPrimaryKey(true);
        }
        return column;
      }
    });

    table.setColumnList(columnList);
  }

  public void initPrimaryKey(Table table) {

  }
}
