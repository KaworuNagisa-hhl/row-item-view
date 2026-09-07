import { describe, it, expect } from '@ohos/hypium'
import { SwiftUIRowItem } from 'theme'

export default function localUnitTest() {
  describe('SwiftUIRowItemView', () => {
    it('accepts_row_item_contract', 0, () => {
      const item: SwiftUIRowItem = {
        title: '单行信息组件',
        subtitle: '这是单独导入的行组件',
        color: '#0B7063',
        icon: 'R'
      }
      expect(item.title.toString()).assertContain('单行')
      expect(item.subtitle.toString()).assertContain('行组件')
      expect(item.icon?.toString()).assertEqual('R')
    })
  })
}
