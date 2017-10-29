import Vue from 'vue'
import VueRouter from 'vue-router'
import Vuex from 'vuex'

import storeConfig from '../config/store.js'

Vue.use(Vuex)
Vue.use(VueRouter)

import Login from '../views/login_view.vue'
import Redirector from '../redirector.vue'
import Rooms from '../views/rooms.vue'
import ChatRoom from '../views/chat_room.vue'
import RoomList from '../views/room_list.vue'
import App from '../app.vue'

const routes = [
  { path: '/', component: Redirector },
  { path: '/login', component: Login },
  { path: '/rooms', component: Rooms,
    children: [
      { path: '', component: RoomList },
      {
        path: ':id',
        component: ChatRoom
      }
    ]
  }
]

const router = new VueRouter({
  routes
})

const store = new Vuex.Store(storeConfig)

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('vue-app'))
  const app = new Vue({
    router,
    store,
    render: h => h(App)
  }).$mount('vue-app')
})
