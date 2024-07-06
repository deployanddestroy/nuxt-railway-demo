<template>
    <div>
        {{ data.fact }}
    </div>
</template>
<script lang="ts" setup>
const { data } = await useFetch('/api/fact');
</script>