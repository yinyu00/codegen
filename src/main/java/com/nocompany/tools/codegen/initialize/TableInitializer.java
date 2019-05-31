package com.nocompany.tools.codegen.initialize;

import com.nocompany.tools.codegen.model.Table;

/**
 * 数据表初始化
 */
public interface TableInitializer {

    /**
     * 初始化列
     * @param table
     */
    void initTable(Table table);

    /**
     * 初始化列
     * @param table
     */
    void initColumn(Table table);

    /**
     * 初始化主键
     * @param table
     */
    void initPrimaryKey(Table table);
}
