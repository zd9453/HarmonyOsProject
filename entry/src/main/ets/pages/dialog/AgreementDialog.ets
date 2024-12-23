@Preview
@CustomDialog
export struct AgreementDialog {
  control?: CustomDialogController
  leftAction?: Function
  rightAction?: Function
  contentMessage = `  用户隐私协议是企业在收集、使用和处理用户个人信息时必须遵循的法律文件，旨在保护用户的个人隐私权和数据安全。
  隐私政策概要：
    保护用户个人信息的重要性。
    如何收集、存储、使用、共享和保护用户信息。
    用户同意隐私政策是使用产品或服务的前提。
  具体内容：
    信息收集：应用或服务在用户使用期间自动接收并记录的信息，例如IP地址、浏览器类型、访问日期和时间等。
    信息使用：明确不会向无关第三方提供、出售、出租、分享或交易用户个人信息，除非得到用户许可或为用户提供服务所需。
    信息披露：在特定情况下，如法律要求或用户同意，可能会披露用户信息。
  协议模板示例：
  总则：用户需认真阅读并理解协议所有条款，注册、登录或使用服务即视为接受协议。
  用户注册：用户需同意协议条款并完成注册程序，使用服务前需注册账号。
  这些内容通常包含在用户隐私协议中，以确保透明度和合法性。企业应根据自身情况调整和完善这些模板，以符合相关法律法规要求。`

  build() {
    RelativeContainer() {
      Text('用户隐私协议')
        .id('__titleView__')
        .fontColor(Color.Black)
        .fontWeight(500)
        .fontSize(20)
        .alignRules({
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .padding(10)

      Scroll(new Scroller()) {
        Text(this.contentMessage)
          .fontSize(14)
          .fontColor(Color.Black)
          .padding({ left: 10, right: 10 })
      }
      .alignRules({
        top: { anchor: '__titleView__', align: VerticalAlign.Bottom },
        bottom: { anchor: '__layout_action__', align: VerticalAlign.Top }
      })
      .align(Alignment.Top)
      .layoutWeight(1)
      .scrollable(ScrollDirection.Vertical)
      .padding(0)
      .margin(5)
      .id('__content__')
      .scrollBar(BarState.Auto)

      Row({ space: 20 }) {
        Button('同意').onClick(() => {
          if (this.leftAction) {
            this.leftAction()
          }
          this.control?.close()
        })
        Button('不同意，退出').onClick(() => {
          if (this.rightAction) {
            this.rightAction()
          }
          this.control?.close()
        })
      }.id('__layout_action__')
      .justifyContent(FlexAlign.Center)
      .alignRules({
        bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
        left: { anchor: '__container__', align: HorizontalAlign.Start },
        right: { anchor: '__container__', align: HorizontalAlign.End }
      }).margin(20)
    }
  }
}