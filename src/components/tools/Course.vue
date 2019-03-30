<template>
  <div>
      <el-dialog
      title="修改"
      :visible.sync="recodeDailog"
      width="30%">
          <el-form
          :model="formData"
          status-icon
          :rules="rules"
          ref="recode"
          label-width="100px">
            <el-form-item :label="role" prop="courseName">
              <el-input v-model="formData.courseName" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="创建者" prop="createPerson">
              <el-input v-model="formData.createPerson" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="submitForm">提交</el-button>
              <el-button @click="resetForm">恢复</el-button>
            </el-form-item>
          </el-form>
      </el-dialog>
      <div class="search-box">
          <el-input
            placeholder="输入课题名称或操作人员名称"
            v-model="searchInfo"
            clearable>
          </el-input>
          <el-button type="primary" icon="el-icon-search" @click="searchAction">搜索</el-button>
      </div>
      <el-table
      :data="tableData"
      style="width: 100%">
          <el-table-column
            :label="role"
            prop="courseName"
            width="400">
          </el-table-column>
          <el-table-column
            label="创建者"
            prop="createPerson"
            width="100">
          </el-table-column>
          <el-table-column
            label="文件列表"
            width="220">
            <div class="file-list" slot-scope="scope">
              <a href="javascript:;" download>文件1</a>
              <a href="javascript:;" download>文件2</a>
              <a href="javascript:;" download>文件3</a>
            </div>
          </el-table-column>
          <el-table-column
            label="课题状态"
            width="80">
            <template slot-scope="scope">
                <span v-text="scope.row.state ? '启用中' : '已撤销'"></span>
            </template>
          </el-table-column>
          <el-table-column
            label="发布日期"
            width="160">
            <template slot-scope="scope">
              <i class="el-icon-time"></i>
              <span style="margin-left: 10px">{{ scope.row.date }}</span>
            </template>
          </el-table-column>
          <el-table-column label="操作" width="240">
            <template slot-scope="scope">
              <el-button
                size="mini"
                @click="handleEdit(scope.$index, scope.row)">修改</el-button>
              <el-button
                size="mini"
                type="info"
                v-if="scope.row.state"
                @click="handleShutDown(scope.$index, scope.row)">撤销</el-button>
              <el-button
                size="mini"
                type="success"
                v-else
                @click="handleReCover(scope.$index, scope.row)">恢复</el-button>
              <el-button
                size="mini"
                type="danger"
                @click="handleDelete(scope.$index, scope.row)">删除</el-button>
            </template>
          </el-table-column>
      </el-table>
      <div class="page">
          <el-pagination
            layout="prev, pager, next"
            :total="50">
          </el-pagination>
      </div>
  </div>
</template>
<script>
export default {
    props: {
      role: {
        type: String,
        default: "学生姓名",
      },
    },
    data() {
        var isEmpty = (rule, value, callback) => {
            if (!value) {
              return callback(new Error('此项不可为空'));
            } else {
                callback()
            }
        }
      return {
        tableData: [{
          date: '2016-05-02',
          createPerson: '王小虎',
          courseName: '上海市普陀区金沙江路 1518 弄',
          state: 1,
        }, {
          date: '2016-05-02',
          createPerson: '王小虎',
          courseName: '上海市普陀区金沙江路 1518 弄',
          state: 0,
        }, {
          date: '2016-05-02',
          createPerson: '王小虎',
          courseName: '上海市普陀区金沙江路 1518 弄',
          state: 1,
        }],
        recodeDailog: false,
        formData: {
            createPerson: "",
            courseName: "",
        },
        rules: {
            createPerson: [{
                validator: isEmpty,
                tirgger: "blur"
            }],
            courseName: [{
                validator: isEmpty,
                tirgger: "blur"
            }],
        },
        searchInfo: "",
      }
    },
    methods: {
      handleEdit(index, row) {
        var str = JSON.stringify(row)
            str = JSON.parse(str)
        this.formData = str
        this.recodeDailog = true
      },
      handleDelete(index, row) {
        console.log(index, row)
      },
      handleShutDown(index, row) {

      },
      handleReCover(index, row) {

      },
      resetForm() {
        this.$refs["recode"].resetFields()
      },
      submitForm() {
        var vm = this
        this.$refs["recode"].validate(valid => {
            if(valid) {
              vm.recodeDailog = false
                console.log("submit success")
            } else {
                console.log("submit error")
                return false
            }
        })
      },
      searchAction() {

      },
    },
}
</script>
<style lang="less" scoped>
@import "../../config";
.search-box {
    display: flex;
    .el-input {
        width: 400px;
        margin-right: 20px;
    }
}
.file-list {
  display: flex;
  a {
    margin: 0 8px;
  }

}
</style>