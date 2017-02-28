Homeland::Press
--------------

头条插件 for [Homeland](https://gethomeland.com) .

## Usage

## Installation

在 Homeland 应用的 Gemfile 增加:

```ruby
gem 'homeland-press'
```

然后执行 `bundle install`

## Configuration

修改 Homeland 的 `modules` 配置，增加 `press` 以启用。

```
defaults: &defaults
  # add "press" to modules
  modules: 'topic,...,press'
```


## Contributing

如果你需要开发此插件，你需要同时准备好 Homeland 项目的开发环境，并修改 Homeland 项目 Gemfile:

```
gem 'homeland-press', path: '../homeland-press'
````

将 homeland-press 路径指向一个上层目录

```
~/work/homeland
~/work/homeland-press
```

然后执行 `bundle install` 和 `rails db:migrate`

现在，插件已经挂上了（别忘了开启 modules 的配置），然后在 Homeland 下面启动 `rails s`

访问 http://localhost:3000/posts 来验证功能。

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
