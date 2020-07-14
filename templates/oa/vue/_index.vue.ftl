<template>
  <div class="app-container">
    <!-- 搜索 -->
    <div class="head-container">
      <el-button class="filter-item" size="mini" type="primary" icon="el-icon-plus" @click="showForm()">新增</el-button>
      <el-button class="filter-item" size="mini" type="danger" icon="el-icon-delete" :disabled="ids.length <= 0" @click="handelBatchRemove">删除</el-button>
      <el-input v-model="search.query" class="filter-item" size="small" clearable placeholder="姓名、合同号、邮箱" style="width: 200px" />
      <el-button class="filter-item" size="mini" type="success" icon="el-icon-search" @click="getList">搜索</el-button>
    </div>
    <!-- 列表 -->
    <el-table
      ref="table"
      v-loading="loading"
      :data="list"
      style="width: 100%"
      @select="onSelected"
      @select-all="onSelected"
    >
      <el-table-column type="selection" width="55" />
<#list columns as column>
      <el-table-column prop="${column.colNameFL}" label="${column.comments}" />
</#list>
      <el-table-column label="操作" width="180">
        <template slot-scope="scope">
          <el-button size="mini" type="primary" icon="el-icon-edit" @click="showForm(scope.row)" />
          <el-popconfirm title="确定删除本条数据吗？" class="el-popconfirm" @onConfirm="handleRemove(scope.row)">
            <el-button slot="reference" type="danger" size="mini" icon="el-icon-delete" />
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
    <pagination v-show="total>search.pageSize" :total="total" :page.sync="search.pageIndex" :limit.sync="search.pageSize" @pagination="getList" />
    <!-- 表单 -->
    <el-dialog
      append-to-body
      :close-on-click-modal="false"
      :before-close="cancelSubmit"
      :visible.sync="formVisible"
      :title="form.${table.NameFL}.id?'修改${table.comments}':'新增${table.comments}'"
      width="70vw"
    >
      <el-form ref="form" :inline="true" :model="form.${table.NameFL}" :rules="rules" size="small" label-width="88px">
        <el-input v-model="form.${table.NameFL}.id" type="hidden" />
        <!--
        <el-select v-model="form.${table.NameFL}.xxx" placeholder="请选择" style="width: 80%" clearable>
          <el-option v-for="item in xxxList" :key="item.dictValue" :label="item.dictKey" :value="item.dictValue" />
        </el-select>
        -->
<#list columns as column>
<#if column.dbType == 'Date'>
        <el-form-item label="${column.comments}" prop="${column.colNameFL}">
          <el-date-picker
            v-model="form.${table.NameFL}.${column.colNameFL}"
            type="date"
            placeholder="选择日期"
          />
        </el-form-item>
<#else>
        <el-form-item label="${column.comments}" prop="${column.colNameFL}">
          <el-input v-model="form.${table.NameFL}.${column.colNameFL}" />
        </el-form-item>
</#if>
</#list>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="text" @click="cancelSubmit">取消</el-button>
        <el-button :loading="formLoading" type="primary" @click="submit">确认</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import api from '@/api/hr'
import Pagination from '@/components/Pagination'

export default {
  name: '${table.NameFU}',
  components: { Pagination },
  data() {
    return {
      ids: [],
      popVisible: false,
      formLoading: false,
      formVisible: false,
      list: null,
      total: 0,
      loading: false,
      search: {
        query: '',
        pageIndex: 1,
        pageSize: 10
      },
      roles: [],
      form: {
        ${table.NameFL}: {
<#list columns as column>
          ${column.colNameFL}: '',
</#list>
        }
      },
      rules: {
<#list columns as column>
<#if column.nullable == 'NO'>
        ${column.colNameFL}: [
          { required: true, message: '请输入${column.comments}', trigger: 'blur' }
        ],
</#if>
</#list>
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /**
     * 显示表单
     */
    showForm(data) {
      if (data && data.id) {
        // 设置双向绑定的值
<#list columns as column>
        this.form.${table.NameFL}.${column.colNameFL} = data.${column.colNameFL}
</#list>
      }
      this.formVisible = true
    },
    /**
     * 提交表单
     */
    submit() {
      this.formLoading = true
      if (this.form.${table.NameFL}.id) {
        api.${table.NameFL}.update(this.form.${table.NameFL}).then(response => {
          this.$isuccess('修改${table.comments}成功', () => {
            this.getList()
            this.resetForm()
          })
        }).finally(() => {
          this.formLoading = false
          this.formVisible = false
        })
      } else {
        api.${table.NameFL}.add(this.form.${table.NameFL}).then(response => {
          this.$isuccess('添加${table.comments}成功', () => {
            this.getList()
            this.resetForm()
          })
        }).finally(() => {
          this.formLoading = false
          this.formVisible = false
        })
      }
    },
    /**
     * 取消提交
     */
    cancelSubmit() {
      this.formLoading = false
      this.formVisible = false
      this.resetForm()
    },
    /**
     * 选中行删除
     */
    handleRemove(data) {
      this.loading = true
      api.${table.NameFL}.remove(data.id).then(() => {
        this.$isuccess('删除${table.comments}成功', () => {
          this.getList()
          this.ids = []
        })
      }).finally(() => {
        this.loading = false
      })
    },
    /**
     * 获取数据列表
     */
    getList() {
      this.loading = true
      api.${table.NameFL}.list(this.search).then(response => {
        this.total = parseInt(response.data.total)
        this.list = response.data.list
      }).finally(() => {
        this.loading = false
      })
    },
    /**
     * 重置表单
     */
    resetForm() {
      this.form.${table.NameFL} = {
<#list columns as column>
        ${column.colNameFL}: '',
</#list>
      }
    },
    /**
     * 行复选框选中时
     */
    onSelected(selection) {
      this.ids = selection.map((v) => {
        return v.id
      })
    },
    /**
     * 批量删除
     */
    handelBatchRemove() {
      const that = this
      if (that.ids.length) {
        that.$iconfirm('确定要删除选中的记录？', '提示', () => {
          that.loading = true
          api.${table.NameFL}.batchRemove(that.ids).then(() => {
            that.$isuccess('批量删除${table.comments}成功', () => {
              that.getList()
              that.ids = []
            })
          }).finally(() => {
            this.loading = false
          })
        })
      }
    }
  }
}
</script>
