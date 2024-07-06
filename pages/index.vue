<template>
    <div>
        <ul role="list" class="marker:text-sky-400 list-disc pl-5 space-y-3">
            <li :key="idx" v-for="(fact, idx) in data.data">{{ fact.fact }}</li>
        </ul>
    </div>
</template>
<script lang="ts" setup>
const { data } = await useFetch('/api/facts');
</script>