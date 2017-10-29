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

const store = new Vuex.Store(storeConfig)

const routes = [
  { path: '/', component: Redirector },
  { path: '/login', component: Login },
  { path: '/rooms', component: Rooms,
    meta: {
      protected: true,
      redirectTo: '/login'
    },

    children: [
      { path: '',
        component: RoomList,
        meta: {
          protected: true,
          redirectTo: '/login'
        }
      },
      {
        path: ':id',
        component: ChatRoom,
        meta: {
          protected: true,
          redirectTo: '/login'
        }
      }
    ]
  }
]

const router = new VueRouter({
  routes
})



document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('vue-app'))
  const app = new Vue({
    router,
    store,
    render: h => h(App)
  }).$mount('vue-app')

  router.beforeEach(function (to, from, next) {
    if (to.meta && to.meta.protected) {
      console.log(store)
      if(store.state.isAuthenticated){
        next()
      } else {
        next(to.meta.redirectTo || '/login')
      }
    } else {
      next()
    }
  })
})
