package com.nocompany.tools.codegen.model;

import com.nocompany.tools.codegen.util.GenUtil;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by jinwei3@asiainfo.com on 2019/4/29.
 */
public class Table {


    public String Name;
    public String NameFL;
    public String NameFU;
    public String NameLL;
    public String comments = "";
    private String schema;

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
            this.comments = comments;
        }
    }

    public Table(String schema, String tableName, String tablePrefix) {
        this.schema = schema;
        this.Name = tableName;
        this.NameFU = GenUtil.getCamelCaseString(tableName.replaceFirst(tablePrefix, ""), true);
        this.NameFL = GenUtil.getCamelCaseString(tableName.replaceFirst(tablePrefix, ""), false);
        this.NameLL = NameFU.toLowerCase();
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
}
