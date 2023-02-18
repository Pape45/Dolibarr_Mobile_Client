import 'package:dolibarr_mobile_client/screens/warehouse_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            'Bienvenue sur la page d\'accueil !',
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ZoomInOptionBlock(
                  title: 'Option 1',
                  icon: Icons.ac_unit,
                ),
                ZoomInOptionBlock(
                  title: 'Option 2',
                  icon: Icons.accessibility_new,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ZoomInOptionBlock(
                  title: 'Option 3',
                  icon: Icons.add_alarm,
                ),
                ZoomInOptionBlock(
                  title: 'WAREHOUSES',
                  icon: Icons.account_balance,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ZoomInOptionBlock extends StatefulWidget {
  final String title;
  final IconData icon;
  final Key? key;

  const ZoomInOptionBlock({this.key, required this.title, required this.icon})
      : super(key: key);

  @override
  ZoomInOptionBlockState createState() => ZoomInOptionBlockState();
}

class ZoomInOptionBlockState extends State<ZoomInOptionBlock>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 1, end: 1.1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        if (widget.title == "WAREHOUSES") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WarehouseScreen()),
          );
        }
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _animation,
        child: Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
            depth: 4,
            intensity: 0.8,
            lightSource: LightSource.topLeft,
            color: Colors.blue,
            shadowLightColor: Colors.lightBlue,
            shadowDarkColor: Colors.indigo,
          ),
          child: SizedBox(
            width: 150,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 50,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
