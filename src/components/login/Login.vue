<template>
  <div id="app">
    <!-- <img src="./assets/logo.png"> -->
    <router-view/>
    <van-cell-group>
      <van-field
        v-model='username'
        required
        clearable
        label='用户名'
        icon='question'
        placeholder='请输入用户名'
        @click-icon="$toast('question')"
      />

      <van-field
        v-model='password'
        type='password'
        label='密码'
        placeholder='请输入密码'
        required
      />
    </van-cell-group>
  </div>
</template>

<script>
export default {
  name: 'App',
  data () {
    return {
      username: '',
      password: ''
    }
  }
}
</script>
