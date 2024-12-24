import { MockSetup } from '@ohos/hamock';

const TITLE_LAYOUT_HEIGHT = 48

@Preview
@Component
export struct TitleLayout {
  build() {
    RelativeContainer() {
      Image($r('app.media.app_icon'))
        .id('_topImage_')
        .titleImageStyle()
    }.width('100%').height(TITLE_LAYOUT_HEIGHT)
  }
}

@Preview({
  title: 'person',
  // height: 200  //这里单位是px 又得扯
})
@Component
export struct TitlePersonLayout {
  private titleContent: string | null = null

  @MockSetup
  previewInfo() {
    this.titleContent = 'MockSetup Preview Title Show In Preview Layout'
  }

  build() {
    Row() {
      Image($r('app.media.ic_public_view_grid')).titleImageStyle(() => {
        console.log(">>>>", 'left click')
      })
      Text(this.titleContent)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .layoutWeight(1)
        .margin({ left: 5, right: 5 })
      Image($r('app.media.ic_public_view_grid')).titleImageStyle(() => {
        console.log(">>>>", 'right click')
      })
    }.width('100%').justifyContent(FlexAlign.SpaceBetween).height(TITLE_LAYOUT_HEIGHT)
  }
}

@Extend(Image)
function titleImageStyle(click?: () => void) {
  .width(TITLE_LAYOUT_HEIGHT)
  .padding(10)
  .aspectRatio(1)
  .onClick(click)
}