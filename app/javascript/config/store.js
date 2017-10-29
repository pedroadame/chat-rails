export default {
  state: {
    isAuthenticated: true,
    username: 'Pedro'
  },
  mutations: {
    username (state, newUsername) {
      state.username = newUsername
    },
    logout (state) {
      state.isAuthenticated = false
      state.username = ''
    }
  }
}
