# row-item-view

`row-item-view` 是一个 OpenHarmony/HarmonyOS ArkUI like-ios 标准列表行展示组件，适合记录项、设置项、任务项和消息项。默认包含左侧强调条、可选图标徽标、标题和副标题，呈现黑色优先的纯色毛玻璃卡片质感；业务方可自定义颜色、宽高、圆角、边框、图标大小、字号和阴影。

## 实际运行效果

下面展示标准列表行、图标徽标、强调条和右侧操作提示：

![row item view preview](https://cdn.jsdelivr.net/gh/KaworuNagisa-hhl/row-item-view@main/docs/row-item-view-preview.gif)

## 安装

```bash
ohpm install row-item-view
```


## 正常使用样式

```ts
import { SwiftUIRowItemView } from 'row-item-view'
import { SwiftUITone } from 'theme'

@Component
struct CareTaskRow {
  build() {
    SwiftUIRowItemView({
      tone: SwiftUITone.GlassBlack,
      item: {
        title: '测量血压',
        subtitle: '建议在早餐前完成，记录将同步到健康档案。',
        icon: 'B',
        color: '#141414'
      }
    })
  }
}
```

## 自定义品牌样式

```ts
SwiftUIRowItemView({
  item: {
    title: '复诊提醒',
    subtitle: '明天 09:30，心内科门诊。',
    icon: 'C',
    color: '#141414'
  },
  componentWidth: '100%',
  componentHeight: 72,
  fillColor: '#E6111111',
  tintColor: '#1FFFFFFF',
  customBorderColor: '#33FFFFFF',
  customBorderWidth: 1,
  cornerRadius: 8,
  accentWidth: 4,
  iconSize: 36,
  titleFontSize: 16,
  subtitleFontSize: 13,
  shadowColor: '#66000000'
})
```

## SwiftUI 风格链式配置

```ts
import { swiftUIConfig, SwiftUITone } from 'theme'

const glassStyle = swiftUIConfig()
  .withTone(SwiftUITone.SystemGray)
  .withWidth('92%')
  .withHeight('auto')
  .withRadius(8)
  .withFillColor('#E6111111')
  .withTintColor('#22FFFFFF')
  .withBorder('#33FFFFFF', 1)
  .withShadow('#33000000', 16)
  .withPadding(12)

SwiftUIRowItemView({
  config: glassStyle
})
```

`config` 是可选入口，适合复用一组 SwiftUI modifier 风格的外观配置；原有直接传参方式仍然可用，且业务可以继续通过 Builder 注入自定义内容。

## 示例目录

完整最小示例见 `example/SwiftUIRowItemViewUsage.ets`。该示例演示了标准列表行的标题、副标题、图标和强调色，适合信息列表入口。

## API

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| `config` | `SwiftUIComponentConfig` | 空配置 | SwiftUI modifier 风格链式配置，可覆盖宽高、圆角、颜色、边框、阴影、内边距等通用外观 |
| `item` | `SwiftUIRowItem` | 空行 | 标题、副标题、图标和强调色 |
| `tone` | `SwiftUITone` | `GlassBlack` | 默认 like-ios 黑色毛玻璃色调 |
| `componentWidth` | `Length` | `'100%'` | 行宽度 |
| `componentHeight` | `Length` | `'auto'` | 行高度 |
| `fillColor` | `ResourceColor` | `'#E6111111'` | 黑色毛玻璃底色 |
| `tintColor` | `ResourceColor` | 自动色调 | 渐变叠色 |
| `customBorderColor` | `ResourceColor` | 自动边框 | 自定义边框色 |
| `customBorderWidth` | `number` | `1.1` | 边框宽度 |
| `cornerRadius` | `number` | `12` | 圆角 |
| `accentWidth` | `number` | `3` | 左侧强调条宽度 |
| `iconSize` | `Length` | `32` | 图标徽标尺寸 |
| `titleFontSize` | `number` | `15` | 标题字号 |
| `subtitleFontSize` | `number` | `13` | 副标题字号 |
| `shadowColor` | `ResourceColor` | 自动阴影 | 阴影颜色 |
