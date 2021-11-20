<template>
 <basic-container>
  <avue-crud
    :option="option"
    :table-loading="loading"
    :data="data"
    :page.sync="page"
    :permission="permissionList"
    :before-open="beforeOpen"
    v-model="form"
    ref="crud"
    @row-update="rowUpdate"
    @row-save="rowSave"
    @row-del="rowDel"
    @search-change="searchChange"
    @search-reset="searchReset"
    @selection-change="selectionChange"
    @current-change="currentChange"
    @size-change="sizeChange"
    @refresh-change="refreshChange"
    @on-load="onLoad"
  >
   <template slot="menuLeft">
    <el-button
            type="danger"
            size="small"
            icon="el-icon-delete"
            plain
            v-if="permission.${table.NameFL}_delete"
            @click="handleDelete"
    >删 除
    </el-button>
   </template>
  </avue-crud>
 </basic-container>
</template>

<script>
 import {getList, getDetail, add, update, remove} from "@/api/e8/${param.module}/${table.NameFU}";
 import {mapGetters} from "vuex";

 export default {
  data() {
   return {
    form: {},
    query: {},
    loading: true,
    page: {
     pageSize: 10,
     currentPage: 1,
     total: 0
    },
    selectionList: [],
    option: {
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
    data: []
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
    this.selectionList.forEach(ele => {
     ids.push(ele.id);
    });
    return ids.join(",");
   }
  },
  methods: {
   rowSave(row, done, loading) {
    add(row).then(() => {
     this.onLoad(this.page);
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
   rowUpdate(row, index, done, loading) {
    update(row).then(() => {
     this.onLoad(this.page);
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
   rowDel(row) {
    this.$confirm("确定将选择数据删除?", {
     confirmButtonText: "确定",
     cancelButtonText: "取消",
     type: "warning"
    })
            .then(() => {
             return remove(row.id);
            })
            .then(() => {
             this.onLoad(this.page);
             this.$message({
              type: "success",
              message: "操作成功!"
             });
            });
   },
   handleDelete() {
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
             return remove(this.ids);
            })
            .then(() => {
             this.onLoad(this.page);
             this.$message({
              type: "success",
              message: "操作成功!"
             });
             this.$refs.crud.toggleSelection();
            });
   },
   beforeOpen(done, type) {
    if (["edit", "view"].includes(type)) {
     getDetail(this.form.id).then(res => {
      this.form = res.data.data;
     });
    }
    done();
   },
   searchReset() {
    this.query = {};
    this.onLoad(this.page);
   },
   searchChange(params, done) {
    this.query = params;
    this.page.currentPage = 1;
    this.onLoad(this.page, params);
    done();
   },
   selectionChange(list) {
    this.selectionList = list;
   },
   selectionClear() {
    this.selectionList = [];
    this.$refs.crud.toggleSelection();
   },
   currentChange(currentPage){
    this.page.currentPage = currentPage;
   },
   sizeChange(pageSize){
    this.page.pageSize = pageSize;
   },
   refreshChange() {
    this.onLoad(this.page, this.query);
   },
   onLoad(page, params = {}) {
    this.loading = true;
    getList(page.currentPage, page.pageSize, Object.assign(params, this.query)).then(res => {
     const data = res.data.data;
     this.page.total = data.total;
     this.data = data.records;
     this.loading = false;
     this.selectionClear();
    });
   }
  }
 };
</script>

<style>
</style>
