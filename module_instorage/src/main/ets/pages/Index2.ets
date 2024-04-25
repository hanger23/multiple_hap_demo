import router from '@ohos.router'

@Entry
@Component
struct Index2 {
  @State message: string = 'InstorageAbility_Index2'

  build() {
    Row() {
      Column({ space: 10 }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}