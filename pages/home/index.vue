<script lang="ts" setup>
import Header from '@/layouts/Header/Header.vue'
import Footer from '@/layouts/Footer/Footer.vue'
import { swiperPageComponents } from './components/SwiperPages/index'
import { Swiper, SwiperSlide, modules as swiperModules } from '@/lib/vue-swiper'
import type { Swiper as SwiperClass, SwiperOptions } from 'swiper/types'

// swiper
const swiperOptions: SwiperOptions = {
  modules: swiperModules,
  direction: 'vertical',
  mousewheel: true,
  slidesOffsetAfter: 200,
  resistanceRatio: 0,
}
const activePageIndex = ref(0)
const onSlideChange = (swiper: SwiperClass) => {
  activePageIndex.value = swiper.activeIndex
}
</script>

<template>
  <NuxtLayout name="default">
    <template #header>
      <Header :class="`active-${activePageIndex}`"></Header>
    </template>
    <!-- <swiper v-bind="swiperOptions" @slideChange="onSlideChange">
      <swiper-slide
        v-for="(page, index) in swiperPageComponents"
        :key="index"
        #default="{ isActive }"
      >
        <component :is="page" :active="isActive"></component>
      </swiper-slide>
    </swiper> -->
    <component
      class=""
      v-for="(page, index) in swiperPageComponents"
      :key="index"
      :is="page"
      :active="true"
    ></component>
    <template #footer>
      <Footer></Footer>
    </template>
  </NuxtLayout>
</template>

<style lang="scss" scoped>
.homepage {
  width: 100vw;
  height: 100vh;
}

.default-layout {
  position: relative;
  .header {
    &.active-0 {
      --header-bg-color: transparent;
    }
    &.active-1 {
      --header-bg-color: #f2be61;
    }
    &.active-2 {
      --header-bg-color: #551ed7;
    }
    &.active-3 {
      --header-bg-color: #3d6898;
    }
  }
  .footer {
    width: 100vw;
  }
}
</style>
