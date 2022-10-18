## 参考

- [Next.js 公式](https://nextjs.org/docs/advanced-features/output-file-tracing#automatically-copying-traced-files)
- [Next.js のスタンドアロンモードでビルドしたイメージを Cloud Run へデプロイする](https://zenn.dev/team_zenn/articles/nextjs-standalone-mode-cloudrun)


## standaloneビルドと通常ビルドでのDockerイメージのサイズの違い

- `169MB` の方がstandaloneを使ってビルドしたイメージ
- `338MB` の方がstandaloneを使わずにビルドしたイメージ

![image](https://user-images.githubusercontent.com/43132642/196324221-6ee5c10b-2e58-42fd-8b69-86006bd06344.png)
