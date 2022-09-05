import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutterbase/modules/core/common/widgets/progress_indicator_widget.dart';

import '../../utils/common_import.dart';

/// [CircleImageViewerNetwork] which is a  use to Circle Image Viewer Network
/// [String] which is a url
/// [Function] that a click event.
/// [double] that a mHeight of image
class CircleImageViewerNetwork extends StatelessWidget {
  final String? url;
  final Function? onPressed;
  final double? mHeight;

  const CircleImageViewerNetwork({
    Key? key,
    this.url,
    this.mHeight,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(mHeight! / 2),
      child: CachedNetworkImage(
          height: mHeight,
          width: mHeight,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Image.asset(
                APPImages.icPlaceholder,
                height: mHeight,
                width: mHeight,
                fit: BoxFit.cover,
              ),
          placeholder: (context, url) => SizedBox(
                height: mHeight,
                width: mHeight,
                child: Stack(
                  children: [
                    Image.asset(
                      APPImages.icPlaceholder,
                      height: mHeight,
                      width: mHeight,
                      fit: BoxFit.cover,
                    ),
                    const Center(child: ProgressIndicatorWidget())
                  ],
                ),
              ),
          imageUrl: url!),
    );
  }
}
