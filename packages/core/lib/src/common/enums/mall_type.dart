enum MallType { market, beauty }

extension MallTypeX on MallType {
  String get name {
    switch (this) {
      case MallType.market:
        return '마켓패캠';
      case MallType.beauty:
        return '뷰티패캠';
    }
  }

  bool get isMarket => this == MallType.market;

  bool get isBeauty => this == MallType.beauty;
}
