package com.nocompany.tools.codegen.model;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by jinwei3@asiainfo.com on 2019/4/29.
 */
public class Table {


    private String tableName;

    private List<Column> columnList = new ArrayList<Column>();

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public List<Column> getColumnList() {
        return columnList;
    }

    public void setColumnList(List<Column> columnList) {
        this.columnList = columnList;
    }

    public Table(String tableName) {
        this.tableName = tableName;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Table{");
        sb.append("tableName='").append(tableName).append('\'');
        sb.append(", columnList=").append(columnList);
        sb.append('}');
        return sb.toString();
    }
}
