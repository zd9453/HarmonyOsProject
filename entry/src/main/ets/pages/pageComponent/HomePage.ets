import { TitleLayout } from '../viewComponent/TitleLayout';

@Preview
@Component
export struct HomePage {
  @State message: string = 'Home';

  build() {
    RelativeContainer() {
      TitleLayout()
      Text(this.message)
        .id('_content_')
        .displayPriority(1)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .backgroundColor(Color.Orange)
        .aspectRatio(2 / 1)

      Image($r('app.media.start_loading'))
        .width('30%')
        .alignRules({
          middle: { anchor: '__container__', align: HorizontalAlign.Center },
          bottom: { anchor: '_content_', align: VerticalAlign.Top }
        })
        .margin({ bottom: 10 })
        .aspectRatio(1)
        .objectFit(ImageFit.Cover)
        .border({
          radius: 10, width: 1, color: Color.Orange
        })

      Divider().alignRules({
        bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
      }).height(2).zIndex(1)
    }
    .height('100%')
    .width('100%')
  }
}