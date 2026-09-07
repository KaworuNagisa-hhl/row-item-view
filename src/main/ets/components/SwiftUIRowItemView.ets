import {
  getSwiftUIGlassMaterial,
  getSwiftUIPalette,
  SWIFT_UI_RADIUS_CONTROL,
  SWIFT_UI_SPACING_EXTRA_SMALL,
  SWIFT_UI_SPACING_SMALL,
  SWIFT_UI_TEXT_PRIMARY,
  SWIFT_UI_TEXT_SECONDARY,
  swiftUIColorWithOpacity,
  SwiftUIComponentConfig,
  SwiftUIRowItem,
  SwiftUITone
} from 'theme'
import { SwiftUIIconBadge } from 'icon-badge'

@Component
export struct SwiftUIRowItemView {
  @Prop item: SwiftUIRowItem = { title: '', subtitle: '' }
  @Prop config: SwiftUIComponentConfig = new SwiftUIComponentConfig()
  @Prop tone: SwiftUITone = SwiftUITone.GlassBlack
  @Prop componentWidth: Length = '100%'
  @Prop componentHeight: Length = 'auto'
  @Prop fillColor: ResourceColor = '#E6111111'
  @Prop tintColor: ResourceColor = '#00000000'
  @Prop customBorderColor: ResourceColor = '#00000000'
  @Prop customBorderWidth: number = 1.1
  @Prop cornerRadius: number = SWIFT_UI_RADIUS_CONTROL
  @Prop accentWidth: number = 3
  @Prop iconSize: Length = 32
  @Prop titleFontSize: number = 15
  @Prop subtitleFontSize: number = 13
  @Prop shadowColor: ResourceColor = '#00000000'
  @State contentHeight: number = 0

  private resolvedTone(): SwiftUITone {
    return this.config.tone === undefined ? this.tone : this.config.tone
  }

  private resolvedWidth(): Length {
    return this.config.width === undefined ? this.componentWidth : this.config.width
  }

  private resolvedHeight(): Length {
    return this.config.height === undefined ? this.componentHeight : this.config.height
  }

  private resolvedFillColor(): ResourceColor {
    return this.config.fillColor === undefined ? this.fillColor : this.config.fillColor
  }

  private resolvedTintColorProp(): ResourceColor {
    return this.config.tintColor === undefined ? this.tintColor : this.config.tintColor
  }

  private resolvedBorderColorProp(): ResourceColor {
    return this.config.borderColor === undefined ? this.customBorderColor : this.config.borderColor
  }

  private resolvedCornerRadius(): number {
    return this.config.cornerRadius === undefined ? this.cornerRadius : this.config.cornerRadius
  }

  private resolvedBorderWidth(): number {
    return this.config.borderWidth === undefined ? this.customBorderWidth : this.config.borderWidth
  }

  private resolvedIconSize(): Length {
    return this.config.iconSize === undefined ? this.iconSize : this.config.iconSize
  }

  private resolvedTitleFontSize(): number {
    return this.config.titleFontSize === undefined ? this.titleFontSize : this.config.titleFontSize
  }

  private resolvedSubtitleFontSize(): number {
    return this.config.subtitleFontSize === undefined ? this.subtitleFontSize : this.config.subtitleFontSize
  }

  private color(): ResourceColor {
    if (this.item.color) {
      return this.item.color
    }
    if (this.config.color) {
      return this.config.color
    }
    return getSwiftUIPalette(this.resolvedTone()).primary
  }

  private resolvedTintColor(): ResourceColor {
    const tint = this.resolvedTintColorProp()
    return tint === '#00000000' ? swiftUIColorWithOpacity(this.color(), 0.08) : tint
  }

  private resolvedBorderColor(): ResourceColor {
    const borderColor = this.resolvedBorderColorProp()
    return borderColor === '#00000000' ? swiftUIColorWithOpacity(this.color(), 0.28) : borderColor
  }

  private resolvedShadowColor(): ResourceColor {
    return this.shadowColor === '#00000000' ? swiftUIColorWithOpacity(this.color(), 0.07) : this.shadowColor
  }

  build() {
    Row({ space: SWIFT_UI_SPACING_SMALL }) {
      Row()
        .width(this.accentWidth)
        .height(this.contentHeight)
        .backgroundColor(this.color())
        .borderRadius(2)
        .margin({ top: SWIFT_UI_SPACING_EXTRA_SMALL, bottom: SWIFT_UI_SPACING_EXTRA_SMALL })

      Column() {
        Row({ space: SWIFT_UI_SPACING_SMALL }) {
          if (this.item.icon) {
            SwiftUIIconBadge({
              icon: this.item.icon,
              color: this.color(),
              tone: this.resolvedTone(),
              componentWidth: this.resolvedIconSize(),
              componentHeight: this.resolvedIconSize(),
              fillColor: this.resolvedFillColor(),
              tintColor: this.resolvedTintColorProp(),
              customBorderColor: this.resolvedBorderColorProp(),
              cornerRadius: this.resolvedCornerRadius()
            })
          }

          Column({ space: 3 }) {
            Text(this.item.title)
              .fontSize(this.resolvedTitleFontSize())
              .fontWeight(FontWeight.Bold)
              .fontColor(SWIFT_UI_TEXT_PRIMARY)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })

            Text(this.item.subtitle)
              .fontSize(this.resolvedSubtitleFontSize())
              .fontColor(SWIFT_UI_TEXT_SECONDARY)
              .maxLines(2)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)
        }
        .width('100%')
        .alignItems(VerticalAlign.Top)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .onAreaChange((oldArea, newArea) => {
        this.contentHeight = Number(newArea.height)
      })
    }
    .width(this.resolvedWidth())
    .height(this.resolvedHeight())
    .padding({ left: SWIFT_UI_SPACING_SMALL, right: SWIFT_UI_SPACING_SMALL, top: SWIFT_UI_SPACING_SMALL, bottom: SWIFT_UI_SPACING_SMALL })
    .linearGradient({
      direction: GradientDirection.RightBottom,
      colors: [
        [this.resolvedFillColor(), 0.0],
        [this.resolvedFillColor(), 0.70],
        [this.resolvedTintColor(), 1.0]
      ]
    })
    .backgroundBlurStyle(BlurStyle.Regular)
    .borderRadius(this.resolvedCornerRadius())
    .border({ width: this.resolvedBorderWidth(), color: this.resolvedBorderColor() })
    .shadow({ radius: 10, color: this.resolvedShadowColor(), offsetX: 0, offsetY: 4 })
    .alignItems(VerticalAlign.Top)
  }
}
