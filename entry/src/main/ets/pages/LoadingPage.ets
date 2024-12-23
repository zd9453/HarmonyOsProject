import { App, promptAction, router } from '@kit.ArkUI';
import { AGREEMENT, getPersonLocalValue, putPersonLocalValue } from '../utils/PreferencesUtils';
import { AgreementDialog } from './dialog/AgreementDialog';

@Entry
@Component
struct LoadingPage {
  @State message: string = 'HarmonyOs';
  @State countDownNumber: number = 0
  private timerId: number | null = null
  private agreementControl = new CustomDialogController({
    builder: AgreementDialog({
      leftAction: () => { //同意协议
        putPersonLocalValue(AGREEMENT, true);
        this.timerStart();
      },
      rightAction: () => { //不同意协议
        putPersonLocalValue(AGREEMENT, false)
        App.terminate() //退出应用
      }
    }),
    alignment: DialogAlignment.Center,
    cornerRadius: 10,
    height: '60%'
  })

  build() {
    RelativeContainer() {
      Image($r('app.media.start_loading')).width('100%').height('100%')
        .objectFit(ImageFit.Cover)

      Text(this.countDownNumber > 0 ? `${this.countDownNumber}S跳过` : '跳过')
        .fontSize(20)
        .border({ width: 1, color: Color.Gray, radius: 5 })
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
    let result = getPersonLocalValue(AGREEMENT, false)
    result.then((value) => {
      promptAction.showToast({
        message: `获取到的存储信息${value}`,
        duration: 5000,
        textColor: Color.Gray,
        showMode: promptAction.ToastShowMode.DEFAULT,
        offset: { dx: 0, dy: 200 },
        alignment: Alignment.Top,
        backgroundColor: Color.Transparent,
        // bottom: 100,
      })
      if (value) {
        this.timerStart()
      } else {
        this.showAgreementDialog()
      }
    })
  }

  private showAgreementDialog() {
    this.agreementControl.open()
  }

  private timerStart() {
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