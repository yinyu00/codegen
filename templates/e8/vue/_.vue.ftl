<template>
 <basic-container>
  <avue-crud
    :option="option${table.NameFU}"
    :table-loading="loading"
    :data="data${table.NameFU}"
    :page.sync="page${table.NameFU}"
    :permission="permissionList"
    :before-open="before${table.NameFL}Open"
    v-model="form${table.NameFU}"
    ref="crud${table.NameFU}"
    @row-update="${table.NameFL}Update"
    @row-save="${table.NameFL}Save"
    @row-del="${table.NameFL}Del"
    @search-change="searchChange${table.NameFU}"
    @search-reset="searchReset${table.NameFU}"
    @selection-change="selectionChange${table.NameFU}"
    @current-change="currentChange${table.NameFU}"
    @size-change="sizeChange${table.NameFU}"
    @refresh-change="refreshChange${table.NameFU}"
    @on-load="on${table.NameFU}Load"
  >
   <template slot="menuLeft">
    <el-button
            type="danger"
            size="small"
            icon="el-icon-delete"
            plain
            v-if="permission.${table.NameFL}_delete"
            @click="handle${table.NameFU}Delete"
    >删 除
    </el-button>
   </template>
  </avue-crud>
 </basic-container>
</template>

<script>
 import {qry${table.NameFU}Page, get${table.NameFU}Detail, add${table.NameFU}, update${table.NameFU}, remove${table.NameFU}} from "@/api/${param.schema}/${param.module}/${table.NameFU}";
 import {mapGetters} from "vuex";

 export default {
  data() {
   return {
    form${table.NameFU}: {},
    query${table.NameFU}: {},
    loading: true,
    page${table.NameFU}: {
     pageSize: 10,
     currentPage: 1,
     total: 0
    },
    selection${table.NameFU}List: [],
    option${table.NameFU}: {
     height:'auto',
     calcHeight: 30,
     tip: false,
     searchShow: true,
     searchMenuSpan: 6,
     border: true,
     index: true,
     viewBtn: true,
     selection: true,
     dialogClickModal: false,
     column: [
<#list columns as column>
<#if column.colNameFL != "id" &&
      column.colNameFL != "tenantId" &&
              column.colNameFL != "createUser" &&
              column.colNameFL != "createDept" &&
              column.colNameFL != "createTime" &&
              column.colNameFL != "updateUser" &&
              column.colNameFL != "updateTime" &&
              column.colNameFL != "status" &&
              column.colNameFL != "isDeleted">
      {
       label: "${column.comments}",
       prop: "${column.colNameFL}",
       rules: [{
        required: <#if column.nullable="YES">false<#else>true</#if>,
        message: "请输入${column.comments}",
        trigger: "blur"
       }]
      },
</#if>
</#list>
     ]
    },
    data${table.NameFU}: []
   };
  },
  computed: {
   ...mapGetters(["permission"]),
   permissionList() {
    return {
     addBtn: this.vaildData(this.permission.${table.NameFL}_add, false),
     viewBtn: this.vaildData(this.permission.${table.NameFL}_view, false),
     delBtn: this.vaildData(this.permission.${table.NameFL}_delete, false),
     editBtn: this.vaildData(this.permission.${table.NameFL}_edit, false)
    };
   },
   ids() {
    let ids = [];
    this.selection${table.NameFU}List.forEach(ele => {
     ids.push(ele.id);
    });
    return ids.join(",");
   }
  },
  methods: {
   ${table.NameFL}Save(row, done, loading) {
    add${table.NameFU}(row).then(() => {
     this.on${table.NameFU}Load(this.page${table.NameFU});
     this.$message({
      type: "success",
      message: "操作成功!"
     });
     done();
    }, error => {
     loading();
     window.console.log(error);
    });
   },
   ${table.NameFL}Update(row, index, done, loading) {
    update${table.NameFU}(row).then(() => {
     this.on${table.NameFU}Load(this.page${table.NameFU});
     this.$message({
      type: "success",
      message: "操作成功!"
     });
     done();
    }, error => {
     loading();
     console.log(error);
    });
   },
   ${table.NameFL}Del(row) {
    this.$confirm("确定将选择数据删除?", {
     confirmButtonText: "确定",
     cancelButtonText: "取消",
     type: "warning"
    })
            .then(() => {
             return remove${table.NameFU}(row.id);
            })
            .then(() => {
             this.on${table.NameFU}Load(this.page${table.NameFU});
             this.$message({
              type: "success",
              message: "操作成功!"
             });
            });
   },
   handle${table.NameFU}Delete() {
    if (this.selectionList.length === 0) {
     this.$message.warning("请选择至少一条数据");
     return;
    }
    this.$confirm("确定将选择数据删除?", {
     confirmButtonText: "确定",
     cancelButtonText: "取消",
     type: "warning"
    })
            .then(() => {
             return remove${table.NameFU}(this.ids);
            })
            .then(() => {
             this.on${table.NameFU}Load(this.page${table.NameFU});
             this.$message({
              type: "success",
              message: "操作成功!"
             });
             this.$refs.crud${table.NameFU}.toggleSelection();
            });
   },
   before${table.NameFU}Open(done, type) {
    if (["edit", "view"].includes(type)) {
     get${table.NameFU}Detail(this.form${table.NameFU}.id).then(res => {
      this.form${table.NameFU} = res.data.data;
     });
    }
    done();
   },
   searchReset${table.NameFU}() {
    this.query${table.NameFU} = {};
    this.on${table.NameFU}Load(this.page${table.NameFU});
   },
   searchChange${table.NameFU}(params, done) {
    this.query${table.NameFU} = params;
    this.page${table.NameFU}.currentPage = 1;
    this.on${table.NameFU}Load(this.page${table.NameFU}, params);
    done();
   },
   selectionChange${table.NameFU}(list) {
    this.selection${table.NameFU}List = list;
   },
   selectionClear${table.NameFU}() {
    this.selection${table.NameFU}List = [];
    this.$refs.crud${table.NameFU}.toggleSelection();
   },
   currentChange${table.NameFU}(currentPage){
    this.page${table.NameFU}.currentPage = currentPage;
   },
   sizeChange${table.NameFU}(pageSize){
    this.page${table.NameFU}.pageSize = pageSize;
   },
   refreshChange${table.NameFU}() {
    this.on${table.NameFU}Load(this.page${table.NameFU}, this.query${table.NameFU});
   },
   on${table.NameFU}Load(page, params = {}) {
    this.loading = true;
    qry${table.NameFU}Page(this.page${table.NameFU}.currentPage, this.page${table.NameFU}.pageSize, Object.assign(params, this.query)).then(res => {
     const data = res.data.data;
     this.page${table.NameFU}.total = data.total;
     this.data${table.NameFU} = data.records;
     this.loading = false;
     this.selectionClear${table.NameFU}();
    });
   }
  }
 };
</script>

<style>
</style>
