import 'package:cheese_chase/models/settings.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:provider/provider.dart';
import 'package:cheese_chase/config/assets/audio_assets.dart';
import 'package:cheese_chase/game/cheese_chase.dart';

class AudioPlayerComponent extends Component
    with HasGameReference<CheeseChase> {
  @override
  Future<void> onLoad() async {
    await FlameAudio.audioCache.loadAll([AudioAssets.bgAudio]);
    return super.onLoad();
  }

  void playBgm() {
    if (game.buildContext != null) {
      if (Provider.of<Settings>(game.buildContext!, listen: false).bgm) {
        FlameAudio.play(AudioAssets.bgAudio);
      }
    }
  }
}
