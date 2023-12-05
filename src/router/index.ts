import { createRouter, createWebHistory } from '@ionic/vue-router';
import { RouteRecordRaw } from 'vue-router';
import TabsPage from '@/views/TabsPage.vue'
import HomePage from "@/views/HomePage.vue";
import StufenPage from "@/views/StufenPage.vue";
import SettingsPage from "@/views/SettingsPage.vue";
import BiberPage from "@/views/stufen/BiberPage.vue";
import WolfPage from "@/views/stufen/WolfPage.vue";
import PfadiPage from "@/views/stufen/PfadiPage.vue";

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    redirect: '/tabs/home'
  },
  {
    path: '/tabs/',
    component: TabsPage,
    children: [
      {
        path: '',
        redirect: '/home'
      },
      {
        path: 'home',
        component: HomePage
      },
      {
        path: 'stufen/',
        component: StufenPage,
        children: [
          {
            path: 'biber',
            component: BiberPage,
          },
          {
            path: 'wolf',
            component: WolfPage
          },
          {
            path: 'pfadi',
            component: PfadiPage
          }
        ]
      },
      {
        path: 'settings',
        component: SettingsPage
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
})

export default router
