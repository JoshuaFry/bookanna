<template>


  <v-form
    ref="form"
    v-model="valid"
    :lazy-validation="lazy"
  >
    <v-text-field
      v-model="form.username"
      :counter="15"
      label="Username"
      required
    ></v-text-field>

    <v-text-field
      v-model="form.password"
      label="Password"
      required
    ></v-text-field>

    <v-btn
      :disabled="!valid"
      color="success"
      class="mr-4"
      @click="userLogin"
    >
      sign in
    </v-btn>

  </v-form>

</template>

<script>
    export default {
        data: () => ({
            lazy: true,
            form: {
                username: '',
                password: '',
            },
            signUpForm: {
                username: '',
                password: '',
                re_password: '',
                email: ''
            },
            select: null,
            checkbox: false,
        }),

        methods: {
            async validate() {
                this.$refs.form.validate()
                await this.userLogin()

            },
            async userLogin() {
                try {
                    let response = await this.$auth.login({data: this.form})
                    console.log(response)
                } catch (err) {
                    console.log(err)
                }
            },
            async userRegistration() {
                try{
                    let response = await this.$axios.post({data: this.form})
                    console.log(response)
                } catch (err) {
                    console.log(err)
                }
            }
        }

    }
</script>

<style scoped>

</style>
