export default {
  state: {
    isAuthenticated: true,
    username: 'Pedro'
  },
  mutations: {
    username (state, newUsername) {
      state.username = newUsername
    }
  }
}
