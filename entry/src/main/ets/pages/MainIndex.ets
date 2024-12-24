import { ActionPage } from './pageComponent/ActionPage';
import { HomePage } from './pageComponent/HomePage';
import { PersonPage } from './pageComponent/PersonPage';

interface Module {
  name: string,
  index: number,
  icon: Resource
}

@Entry
@Component
struct MainIndex {
  @State currentIndex: number = 0
  private moduleItems: Array<Module> = [
    { name: '首页', index: 0, icon: $r('app.media.ic_public_view_grid') },
    { name: '动态', index: 1, icon: $r('app.media.ic_public_cards') },
    { name: '我的', index: 2, icon: $r('app.media.ic_public_contacts') },
  ]

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        HomePage()
      }.tabBar(this.tabBuilder(this.moduleItems[0]))

      TabContent() {
        ActionPage()
      }.tabBar(this.tabBuilder(this.moduleItems[1]))

      TabContent() {
        PersonPage()
      }.tabBar(this.tabBuilder(this.moduleItems[2]))

    }.barHeight(48)
    .barMode(BarMode.Fixed)
    .scrollable(true)
    .onChange((index) => {
      this.currentIndex = index
    })
  }

  /**
   * 导航按钮生成
   * @param item  alt+F7 查看调用
   */
  @Builder
  tabBuilder(item: Module) {
    Column() {
      Image(item.icon)
        .size({ width: 25, height: 25 })
        .fillColor(this.currentIndex === item.index ? Color.Orange : Color.Gray)
      Text(item.name)
        .fontSize(13)
        .fontColor(this.currentIndex === item.index ? Color.Orange : Color.Gray)
        .margin({ top: 2 })
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }
}