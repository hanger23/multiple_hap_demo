import router from '@ohos.router'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';

@Entry
@Component
struct Index {
  @State message: string = 'EntryAbility'
  private context = getContext(this) as common.UIAbilityContext;

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Text($r('app.string.class_name'))
          .fontSize(25)

        Text($r('app.string.class_name_2'))
          .fontSize(25)

        Button("InstorageAbility")
          .onClick((event: ClickEvent) => {
            const want: Want = {
              deviceId: '', // deviceId为空表示本设备
              bundleName: 'com.multiple.hap.demo',
              abilityName: 'InstorageAbility',
              moduleName: 'module_instorage',
            };

            this.context.startAbility(want)
          })

        Button("OutstorageAbility")
          .onClick((event: ClickEvent) => {
            const want: Want = {
              deviceId: '', // deviceId为空表示本设备
              bundleName: 'com.multiple.hap.demo',
              abilityName: 'OutstorageAbility',
              moduleName: 'module_outstorage',
            };

            this.context.startAbility(want)
          })

        Text("当 target 是 default 时,点击以下按钮不会跳转\n" +
        "当 target 是 free 时,点击以下按钮会跳转\n" +
        "这是因为在 entry/build-profile.json5 中的 targets 中 定义了 source 源码集")
          .margin({ top: 20 })

        Button("go to EntryPage1")
          .onClick(() => {
            router.pushUrl({ url: "pages/EntryPage1" })
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}