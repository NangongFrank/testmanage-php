<template>
   <div>
   	<my-course :role="'课题名称'" />
   </div>
</template>
<script>
	import MyCourse from "./../tools/Course"
    export default {
        components: {
        	myCourse: MyCourse
        },
    }
</script>
<style lang="less" scoped>
	@import "../../config";
    
</style>