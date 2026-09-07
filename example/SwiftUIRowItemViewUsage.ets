import { SwiftUIRowItemView } from 'row-item-view'

@Component
export struct SwiftUIRowItemViewUsage {
  build() {
    SwiftUIRowItemView({
      item: {
        title: 'Daily check-in',
        subtitle: 'Tap to view details',
        color: '#235595',
        icon: 'D'
      }
    })
  }
}
