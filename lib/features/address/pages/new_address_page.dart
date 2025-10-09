import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/features/address/widgets/custom_bottom_sheet.dart';
import 'package:store_mobile/features/common/widgets/my_app_bar.dart';

class NewAddressPage extends StatefulWidget {
  const NewAddressPage({super.key});

  @override
  State<NewAddressPage> createState() => _NewAddressPageState();
}

class _NewAddressPageState extends State<NewAddressPage> with TickerProviderStateMixin {
  final controller = MapController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<Marker> markers = [];

  final List<String> addressOptions = ['Home', 'Work', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'New Address'),
      body: SizedBox(
        height: 562.h,
        child: FlutterMap(
          mapController: controller,
          options: MapOptions(
            initialCenter: LatLng(41.285779, 69.203493),
            initialZoom: 15,
            onTap: (tapPosition, point) {
              final animationController = AnimationController(
                vsync: this,
                duration: Duration(milliseconds: 500),
              );
              final marker = Marker(
                point: point,
                child: SvgPicture.asset(AppIcons.locationFilled, width: 64.w, height: 64.h),
              );
              markers = [marker];

              final tween = LatLngTween(begin: controller.camera.center, end: point);
              final animation = tween.animate(animationController);
              animation.addListener(
                () {
                  controller.move(animation.value, controller.camera.zoom);
                },
              );
              animationController.forward();
              animation.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  animationController.dispose();
                }
              });
              setState(() {});
            },
          ),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: "dars419_flutter_map",
            ),
            MarkerLayer(
              markers: markers,
            ),
          ],
        ),
      ),
      bottomSheet: CustomBottomSheet(addressOptions: addressOptions),
    );
  }
}
