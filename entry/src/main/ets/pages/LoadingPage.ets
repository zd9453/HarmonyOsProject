import { router } from '@kit.ArkUI';

@Entry
@Component
struct LoadingPage {
  @State message: string = 'HarmonyOs';
  @State countDownNumber: number = 5
  private timerId: number | null = null

  build() {
    RelativeContainer() {

      Image($r('app.media.start_loading')).width('100%').height('100%')
        .objectFit(ImageFit.Cover)

      Text(this.countDownNumber > 0 ? `${this.countDownNumber}S跳过` : '跳过')
        .fontSize(20)
        .border({
          width: 1, color: Color.Gray, radius: 5
        })
        .alignRules({
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })
        .margin({ top: 10, right: 10 })
        .backgroundColor(Color.White)
        .padding({
          top: 5,
          left: 8,
          right: 8,
          bottom: 5
        })
        .onClick(() => {
          this.toIndexPage();
        })

      Text(this.message)
        .id('LoadingPageHelloWorld')
        .fontSize(30)
        .fontColor(Color.Orange)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }

  onPageShow(): void {
    if (this.timerId) {
      clearInterval(this.timerId)
    }
    this.countDownNumber = 5
    this.timerId = setInterval(() => {
      this.countDownNumber--;
      if (this.countDownNumber <= 0) {
        this.toIndexPage();
      }
    }, 1000);
  }

  private toIndexPage() {
    clearInterval(this.timerId)
    router.pushUrl({
      url: 'pages/MainIndex'
    })
  }
}