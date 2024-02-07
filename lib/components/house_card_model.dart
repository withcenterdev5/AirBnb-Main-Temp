import '/components/house_like_icon_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'house_card_widget.dart' show HouseCardWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HouseCardModel extends FlutterFlowModel<HouseCardWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // Model for HouseLikeIconButton component.
  late HouseLikeIconButtonModel houseLikeIconButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    houseLikeIconButtonModel =
        createModel(context, () => HouseLikeIconButtonModel());
  }

  @override
  void dispose() {
    houseLikeIconButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
