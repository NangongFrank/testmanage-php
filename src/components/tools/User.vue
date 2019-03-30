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
            <el-form-item :label="role" prop="name">
              <el-input v-model="formData.name" autocomplete="off"></el-input>
            </el-form-item>
           <el-form-item label="联系电话" prop="phone">
              <el-input v-model.number="formData.phone" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="性别" prop="sex">
              <el-switch v-model="formData.sex"></el-switch>
              <span style="margin-left: 10px" v-text="formData.sex ? '男' : '女'"></span>
            </el-form-item>
            <el-form-item label="邮箱" prop="email">
              <el-input v-model="formData.email" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="住址" prop="address">
              <el-input v-model="formData.address" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="submitForm">提交</el-button>
              <el-button @click="resetForm">恢复</el-button>
            </el-form-item>
          </el-form>
      </el-dialog>
      <div class="search-box">
          <el-input
            placeholder="输入姓名或者电话号码"
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
            prop="name"
            width="140">
          </el-table-column>
          <el-table-column
            label="性别"
            prop="sex"
            width="80">
            <template slot-scope="scope">
                <span v-text="scope.row.sex ? '男' : '女'"></span>
            </template>
          </el-table-column>
          <el-table-column
            label="联系电话"
            prop="phone"
            width="120">
          </el-table-column>
          <el-table-column
            label="邮箱"
            prop="email"
            width="180">
          </el-table-column>
          <el-table-column
            label="住址"
            prop="address"
            width="220">
          </el-table-column>
          <el-table-column
            label="状态"
            width="80">
            <template slot-scope="scope">
                <span v-text="scope.row.state ? '使用中' : '已注销'"></span>
            </template>
          </el-table-column>
          <el-table-column
            label="注册日期"
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
                @click="handleShutDown(scope.$index, scope.row)">注销</el-button>
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
        var checkPhone = (rule, value, callback) => {
            if (!value) {
              return callback(new Error('电话号码不能为空'));
            }
            setTimeout(() => {
              if (!/^1\d{10}$/.test(value)) {
                callback(new Error('电话号码格式不对'))
              } else {
                callback()
              }
            }, 800)
        }
        var checkEmail = (rule, value, callback) => {
            if (!value) {
              return callback(new Error('邮箱地址不能为空'));
            }
            setTimeout(() => {
              if (!/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/.test(value)) {
                callback(new Error('邮箱格式不对'))
              } else {
                callback()
              }
            }, 800)
        }
        var isEmpty = (rule, value, callback) => {
            if (!value) {
              return callback(new Error('邮箱地址不能为空'));
            } else {
                callback()
            }
        }
      return {
        tableData: [{
          date: '2016-05-02',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄',
          sex: 1,
          phone: "12341234123",
          email: "1234@qq.com",
          state: 1,
        }, {
          date: '2016-05-02',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄',
          sex: 0,
          phone: "12341234123",
          email: "1234@qq.com",
          state: 0,
        }, {
          date: '2016-05-02',
          name: '王小虎',
          address: '上海市普陀区金沙江路 1518 弄',
          sex: 1,
          phone: "12341234123",
          email: "1234@qq.com",
          state: 1,
        }],
        recodeDailog: false,
        formData: {
            name: "",
            sex: "",
            phone: "",
            email: "",
            address: "",
        },
        rules: {
            phone: [{
                validator: checkPhone,
                trigger: "blur",
            }],
            email: [{
                validator: checkEmail,
                tirgger: "blur",
            }],
            name: [{
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
</style>