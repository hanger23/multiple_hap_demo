class Color {
  public readonly red = $r('app.color.red')
  public readonly green = $r('app.color.green')
  public readonly blue = $r('app.color.blue')
  public readonly yello = $r('app.color.yello')
}

class String {
}

class Mipmap {
  public readonly lake = $r('app.media.lake')
}


export default class R {
  static color = new Color()
  static string = new String()
  static mipmap = new Mipmap()
}