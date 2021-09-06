package com.nocompany.tools.codegen.model;

import com.nocompany.tools.codegen.util.GenUtil;

public class Column {

    private String colName;
    private String dataType;
    private int dataLength;
    private String nullable;
    private String comments;
    private boolean isPrimaryKey = false;

    public String getColName() {
        return colName;
    }
    public String getColNameFL() {
        return GenUtil.getCamelCaseString(colName,false);
    }
    public String getColNameFU() {
        return GenUtil.getCamelCaseString(colName,true);
    }

    public void setColName(String colName) {
        this.colName = colName;
    }

    public String getDataType() {
        return dataType;
    }
    public String getDataTypeUpperCase() {

        switch(this.getDataType()) {

            case "int":
                return "BIGINT";

            case "text":
                return "String";

            case "datetime":
            case "date":
                return "TIMESTAMP";

            default:
                return dataType.toUpperCase();
        }
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public int getDataLength() {
        return dataLength;
    }

    public void setDataLength(int dataLength) {
        this.dataLength = dataLength;
    }

    public String getNullable() {
        return nullable;
    }

    public void setNullable(String nullable) {
        this.nullable = nullable;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public boolean isPrimaryKey() {
        return isPrimaryKey;
    }

    public void setPrimaryKey(boolean primaryKey) {
        isPrimaryKey = primaryKey;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Column{");
        sb.append("colName='").append(colName).append('\'');
        sb.append(", dataType='").append(dataType).append('\'');
        sb.append(", dataLength=").append(dataLength);
        sb.append(", nullable='").append(nullable).append('\'');
        sb.append(", comments='").append(comments).append('\'');
        sb.append(", isPrimaryKey='").append(isPrimaryKey).append('\'');
        sb.append('}');
        return sb.toString();
    }

    public String getDbType() {
        switch(this.getDataType()) {

            case "tinyint":
                return "Integer";

            case "int":
            case "bigint":
            case "float":
            case "decimal":
            case "double":
                return "Long";

            case "char":
            case "varchar":
            case "text":
                return "String";

            case "datetime":
            case "time":
            case "timestamp":
                return "Timestamp";

            default:
                throw new java.lang.UnsupportedOperationException();
        }

    }
}
