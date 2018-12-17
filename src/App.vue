<template>
  <div id="app">
    <router-view/>
    <router-view name="tabbar"></router-view>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
  body,html,#app{
    background: #f2f2f2;
  }
</style>
