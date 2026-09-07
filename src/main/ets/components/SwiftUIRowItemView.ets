import {
  getSwiftUIGlassMaterial,
  getSwiftUIPalette,
  SWIFT_UI_RADIUS_CONTROL,
  SWIFT_UI_SPACING_EXTRA_SMALL,
  SWIFT_UI_SPACING_SMALL,
  SWIFT_UI_TEXT_PRIMARY,
  SWIFT_UI_TEXT_SECONDARY,
  swiftUIColorWithOpacity,
  SwiftUIRowItem,
  SwiftUITone
} from 'theme'
import { SwiftUIIconBadge } from 'icon-badge'

@Component
export struct SwiftUIRowItemView {
  @Prop item: SwiftUIRowItem = { title: '', subtitle: '' }
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

  private color(): ResourceColor {
    if (this.item.color) {
      return this.item.color
    }
    return getSwiftUIPalette(this.tone).primary
  }

  private resolvedTintColor(): ResourceColor {
    return this.tintColor === '#00000000' ? swiftUIColorWithOpacity(this.color(), 0.08) : this.tintColor
  }

  private resolvedBorderColor(): ResourceColor {
    return this.customBorderColor === '#00000000' ? swiftUIColorWithOpacity(this.color(), 0.28) : this.customBorderColor
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
              tone: this.tone,
              componentWidth: this.iconSize,
              componentHeight: this.iconSize,
              fillColor: this.fillColor,
              tintColor: this.tintColor,
              customBorderColor: this.customBorderColor,
              cornerRadius: this.cornerRadius
            })
          }

          Column({ space: 3 }) {
            Text(this.item.title)
              .fontSize(this.titleFontSize)
              .fontWeight(FontWeight.Bold)
              .fontColor(SWIFT_UI_TEXT_PRIMARY)
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })

            Text(this.item.subtitle)
              .fontSize(this.subtitleFontSize)
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
    .width(this.componentWidth)
    .height(this.componentHeight)
    .padding({ left: SWIFT_UI_SPACING_SMALL, right: SWIFT_UI_SPACING_SMALL, top: SWIFT_UI_SPACING_SMALL, bottom: SWIFT_UI_SPACING_SMALL })
    .linearGradient({
      direction: GradientDirection.RightBottom,
      colors: [
        [this.fillColor, 0.0],
        [this.fillColor, 0.70],
        [this.resolvedTintColor(), 1.0]
      ]
    })
    .backgroundBlurStyle(BlurStyle.Regular)
    .borderRadius(this.cornerRadius)
    .border({ width: this.customBorderWidth, color: this.resolvedBorderColor() })
    .shadow({ radius: 10, color: this.resolvedShadowColor(), offsetX: 0, offsetY: 4 })
    .alignItems(VerticalAlign.Top)
  }
}
