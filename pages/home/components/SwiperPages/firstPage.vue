<script setup>
import { ref, onMounted } from 'vue'

// 动态生成带有时间戳的视频源地址
const videoSrc = ref('')

onMounted(() => {
  // 在组件挂载后设置视频源，确保服务端和客户端路径一致
  videoSrc.value = '/_nuxt/assets/media/video/banner.mp4' + '?t=' + Date.now()
})
</script>

<template>
  <div class="full-page">
    <!-- 视频元素 -->
    <video
      v-if="videoSrc"
      preload="auto"
      class="video-player"
      :src="videoSrc"
      muted
      autoplay
      loop
    ></video>
    <div class="layer">
      <div class="slogan"></div>
    </div>
    <div class="placeholder"></div>
  </div>
</template>

<style lang="scss" scoped>
.full-page {
  position: relative;
  height: 100%;
  width: 100%;
}

.video-player {
  position: absolute;
  width: 100%;
  height: 100vh;
  top: 0; /* 修改为从顶部开始 */
  object-fit: cover;
  z-index: 1; /* 确保视频在玩家层之上 */
}

.placeholder {
  position: absolute; /* 修改为绝对定位 */
  height: 100%;
  width: 100%; /* 添加宽度以确保覆盖整个区域 */
  background-image: url('~/assets/images/index/firstPage/placeholder.jpg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  z-index: 0; /* 设置较低的z-index值，使其位于视频之下 */
}

.layer {
  position: absolute; /* 修改为绝对定位 */
  height: 100%;
  width: 100%; /* 添加宽度以确保覆盖整个区域 */
  z-index: 2; /* 设置较低的z-index值，使其位于视频之下 */

  .slogan {
    position: absolute;
    width: 592px;
    height: 162px;
    top: 40%;
    left: 50%;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center;
    background-image: url('~/assets/images/index/firstPage/slogan.webp');
    transform: translate(-50%, -50%);
    z-index: 2; /* 如果希望标语始终在最前面，可以增加这个属性 */
  }
}
</style>
