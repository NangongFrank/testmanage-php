<template>
   <div>
   	<my-user :role="'学生姓名'" />
   </div>
</template>
<script>
	import MyUser from "./../tools/User"
    export default {
        components: {
        	myUser: MyUser
        },
    }
</script>
<style lang="less" scoped>
	@import "../../config";
    
</style>