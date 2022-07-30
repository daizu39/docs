# VIMにおけるDenops利用時のフロントエンド内でのesm.shのCORS回避方法の検討

## 検討概要

###  サーバ側にコードをbundleすることで回避

`deno bundle`を利用することにより、ES Modulesをdenoサーバに格納されるかと考えたが、
denoサーバに格納されることはなかった。

「esbuild」でbuildしたら、bundleされるが、node/_coreがうまく動かない。
動かしたい場合には、Deno.emitを使うか、構成を最小化しながら修正していく必要がある。

<https://github.com/esbuild/deno-esbuild#deno-esbuild>

###  denoサーバをリバプロとして利用

リバプロサーバが、単純な実装では、ES Modulesを提供しているサーバの機能を持てなかった。
エラーとしては、以下のものが発生した。

```text
Failed to load module script: Expected a JavaScript module script but the server responded with a MIME type of "application/typescript". Strict MIME type checking is enforced for module scripts per HTML spec.
```
