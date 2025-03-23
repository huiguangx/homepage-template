module.exports = {
  apps: [
    {
      name: 'nuxt-app',
      script: './server/index.mjs',
      exec_mode: 'cluster',
      instances: 'max',
    },
  ],
}
