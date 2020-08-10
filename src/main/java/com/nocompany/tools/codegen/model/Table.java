package com.nocompany.tools.codegen.model;

import com.nocompany.tools.codegen.util.GenUtil;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by jinwei3@asiainfo.com on 2019/4/29.
 */
public class Table {


  public String tableNamePrefix;
  public String Name;
  public String NameFL;
  public String NameFU;
  public String comments = "";
  public String schema;

  private List<Column> columnList = new ArrayList<Column>();

  public String getName() {
    return Name;
  }

  public void setTableName(String tableName) {
    this.Name = tableName;
  }

  public List<Column> getColumnList() {
    return columnList;
  }

  public void setColumnList(List<Column> columnList) {
    this.columnList = columnList;
  }

  public String getComments() {
    return comments;
  }

  public void setComments(String comments) {
    if(StringUtils.isNotBlank(comments)) {
      if(comments.endsWith("表")) {
        comments = comments.substring(0,comments.length()-1);
      }
      this.comments = comments;
    }
  }

  /**
   * input:  tableName=t_user, tableNamePrefix=t
   * output: nameFU=User, nameFL=user
   * @param tableName
   * @param tableNamePrefix
   */
  public Table(String tableName, String tableNamePrefix) {
    this.Name = tableName;
    this.tableNamePrefix = tableNamePrefix;
    String javaName = tableName.toUpperCase().replaceFirst(tableNamePrefix.toUpperCase(), "");
    this.NameFU = GenUtil.getCamelCaseString(javaName, true);
    this.NameFL = GenUtil.getCamelCaseString(javaName, false);
  }

  @Override
  public String toString() {
    final StringBuilder sb = new StringBuilder("Table{");
    sb.append("tableName='").append(Name).append('\'');
    sb.append(", columnList=").append(columnList);
    sb.append('}');
    return sb.toString();
  }

  public String getSchema() {
    return schema;
  }

  public void setSchema(String schema) {
    this.schema = schema;
  }

  public String getTableNamePrefix() {
    return tableNamePrefix;
  }

  public void setTableNamePrefix(String tableNamePrefix) {
    this.tableNamePrefix = tableNamePrefix;
  }
}
