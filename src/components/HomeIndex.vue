<template>
    <div class="home-index">
        <h3>今日统计</h3>
        <div class="home-index-bd">
            <el-table
                :data="course"
                border>
                <el-table-column
                  prop="course"
                  label="发布课题名称"
                  width="180">
                </el-table-column>
                <el-table-column
                  prop="name"
                  label="发布者"
                  width="180">
                </el-table-column>
            </el-table>
            <el-table
                :data="course"
                border>
                <el-table-column
                  prop="course"
                  label="接受课题名称"
                  width="180">
                </el-table-column>
                <el-table-column
                  prop="name"
                  label="接收者"
                  width="180">
                </el-table-column>
            </el-table>
            <el-table
                :data="course"
                border>
                <el-table-column
                  prop="course"
                  label="课题操作"
                  width="180">
                </el-table-column>
                <el-table-column
                  prop="course"
                  label="操作行为"
                  width="180">
                </el-table-column>
                <el-table-column
                  prop="name"
                  label="操作者"
                  width="180">
                </el-table-column>
            </el-table>
        </div>

    </div>
</template>
<script>
    var vm = this
    export default {
        data() {
            return {
                course: [{
                    course: "张",
                    name: "张三"
                }]
            }
        },
        created() {
            this.$store.commit("setProgressPage", 100)
        },
        beforeDestory() {
            this.$store.commit("setProgressPage", 0)
        },
    }
</script>
<style lang="less" scoped>
    @import "../config";
    .home-index {
        .el-table {
            margin-top: 20px;
            width: auto;
        }
    }
</style>