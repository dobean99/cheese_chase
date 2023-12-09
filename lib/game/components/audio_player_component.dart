import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:cheese_chase/config/assets/audio_assets.dart';
import 'package:cheese_chase/game/cheese_chase.dart';

class AudioPlayerComponent extends Component
    with HasGameReference<CheeseChase> {
  @override
  void onLoad() async {
    await FlameAudio.audioCache.loadAll([AudioAssets.bgAudio]);
    return onLoad();
  }

  void playBgm() {
    FlameAudio.play(AudioAssets.bgAudio);
  }
}
