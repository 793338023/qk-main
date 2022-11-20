# qiankun-example

qiankun 实战 demo，父应用 vue，子应用使用 `react`, `vue` 和 `原生HTML`。

## 开始

一键拉取子应用并安装根目录工程依赖、还有安装所有应用的依赖

```
npm i
```

一键启动所有所有应用

```
npm start
```

通过 [http://localhost:8080/](http://localhost:8080/) 访问主应用。

## 发布

一键构建并打包所有主子应用

```
npm run build
```

考虑到主应用和子应用共用域名时可能会存在路由冲突的问题，子应用可能会源源不断地添加进来，因此我们将子应用都放在xx.com/subapp/这个二级目录下，根路径/留给主应用。

步骤如下：

主应用main和所有子应用都打包出一份html,css,js,static，分目录上传到服务器，子应用统一放到subapp目录下，最终如：

```
├── main
│   └── index.html
└── subapp
    ├── sub-react
    │   └── index.html
    └── sub-vue
        └── index.html
```

配置nginx，预期是xx.com根路径指向主应用，xx.com/subapp指向子应用,子应用的配置只需写一份，以后新增子应用也不需要改nginx配置，以下应该是微应用部署的最简洁的一份nginx配置了。

```
server {
    listen       80;
    server_name #填写域名#;
    location / {
        root   /data/web/qiankun/main;  # 主应用所在的目录
        index index.html;
        try_files $uri $uri/ /index.html;
    }
    location /subapp {
	    alias /data/web/qiankun/subapp;
        try_files $uri $uri/ /index.html;
    }

}
```

上面的配置没有接口配置，根据情况再把接口代理也配置上就行了
