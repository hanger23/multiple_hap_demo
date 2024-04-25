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


      }
      .width('100%')
    }
    .height('100%')
  }
}