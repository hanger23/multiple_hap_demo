import router from '@ohos.router'
import Util from '../../../../../module_common/src/main/ets/widget/Util'
import { global_type2 } from '../../../../../module_common/src/main/ets/widget/global'

@Entry
@Component
struct Index {
  @State message: string = 'InstorageAbility_Index1'

  aboutToAppear() {
    let tiger: global_type2.ITiger = { name: "huhuhu", age: 99 };
    new Util().print(JSON.stringify(tiger))
  }

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.message)
          .fontSize(50)
            // .fontColor($r('app.color.red1'))
            // .fontColor($r('app.color.red')) // 无法访问公共hap的资源，暂未解决
          .fontWeight(FontWeight.Bold)

        Button("Index2")
          .onClick((event: ClickEvent) => {
            router.pushUrl({ url: "pages/Index2" })
            //等效于
            // router.pushUrl({ url: "@bundle:com.multiple.hap.demo/module_instorage/ets/pages/Index2" })
          })

        // 跳到公共的页面
        Button("go to common Index")
          .onClick((event: ClickEvent) => {
            router.pushUrl({ url: "@bundle:com.multiple.hap.demo/module_common/ets/pages/CommonIndex" })
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}