Rails Tutorialを動かす環境です。
以下のboxの作り方を参考にしています。
https://github.com/rails/rails-dev-box

ライセンスはMITです。

## このパッケージを使う

```rb
Vagrant.configure(2) do |config|
  config.vm.box = "hanachin/railstutorial"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.synced_folder "./data", "/vagrant_data"
end
```

## Vagrantのパッケージをつくる

```console
$ vagrant up
$ vagrant package -o railstutorial.box
```
