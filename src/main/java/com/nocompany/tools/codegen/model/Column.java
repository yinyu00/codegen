package com.nocompany.tools.codegen.model;

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

    public void setColName(String colName) {
        this.colName = colName;
    }

    public String getDataType() {
        return dataType;
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
}
