# halo-theme-anatole

## 说明

该主题的原作者为 [Caicai](https://www.caicai.me)，非常感谢做出这么优秀的主题。

原主题地址：[https://github.com/hi-caicai/farbox-theme-Anatole](https://github.com/hi-caicai/farbox-theme-Anatole)

## 使用方式

1. 在 [Releases](https://github.com/halo-dev/halo-theme-anatole/releases) 下载最新的主题文件。
2. 在 Halo 后台的主题管理上传主题文件进行安装。

## 插件适配

- 评论组件：<https://github.com/halo-sigs/plugin-comment-widget>
- 搜索组件：<https://github.com/halo-sigs/plugin-search-widget>
- 瞬间：<https://github.com/halo-sigs/plugin-moments>
- 相册：<https://github.com/halo-sigs/plugin-photos>

## 开发环境

可以参考 [https://docs.halo.run/developer-guide/theme/prepare](https://docs.halo.run/developer-guide/theme/prepare#%E6%96%B0%E5%BB%BA%E4%B8%80%E4%B8%AA%E4%B8%BB%E9%A2%98) 将主题仓库放置在 Halo 的工作目录。

> **Warning**
>
> 注意，由于目前 Halo 的规定，主题目录名称必须和 `theme.yaml` 的 `metadata.name` 保持一致。

```bash
git clone git@github.com:halo-dev/halo-theme-anatole.git ~/halo2-dev/themes/theme-anatole

# 或者当你 fork 之后

git clone git@github.com:{your_github_id}/halo-theme-anatole.git ~/halo2-dev/themes/theme-anatole
```

```bash
cd ~/halo2-dev/themes/theme-anatole
```

```bash
pnpm install
```

```bash
# 监听源码变动并自动编译资源
pnpm dev
```

```bash
# 构建资源
pnpm build
```
