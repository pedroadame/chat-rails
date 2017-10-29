export default {
  state: {
    isAuthenticated: false,
    username: ''
  },
  mutations: {
    login (state, newUsername) {
      state.username = newUsername
      state.isAuthenticated = true
    },
    logout (state) {
      state.isAuthenticated = false
      state.username = ''
    }
  }
}
