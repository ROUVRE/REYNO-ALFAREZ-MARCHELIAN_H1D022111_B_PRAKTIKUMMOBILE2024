import 'dart:io';
import 'dart:math';

int generateJawaban() {
  var random = Random();
  return random.nextInt(100) + 1;
}

void main() {
  int jawaban = generateJawaban();
  int attempt = 0;
  int kesempatan = 10;

  print('=== Higher or Lower ===');
  print('Terdapat sebuah angka yang berada di range antara 1-100');
  print('Kamu memiliki $kesempatan kesempatan untuk menebaknya\n');

  while (kesempatan > 0) {
    print('Masukkan tebakan kamu: ');
    var input = stdin.readLineSync();

    if (input != null) {
      var tebakan = int.tryParse(input);

      if (tebakan == null || tebakan < 1 || tebakan > 100) {
        print('Tebakan kamu harus berada di antara 1-100. Coba lagi\n');
        continue;
      }

      attempt++;
      kesempatan--;

      if (tebakan < jawaban) {
        print('Terlalu kecil');
      } else if (tebakan > jawaban) {
        print('Terlalu besar');
      } else {
        print(
            'Selamat, jawaban kamu benar! Kamu berhasil menemukan jawabannya setelah $attempt kali tebakan');
        break;
      }

      if (kesempatan > 0) {
        print('Kamu masih memiliki $kesempatan kesempatan lagi\n');
      } else {
        print('Kesempatan habis! Jawabannya adalah $jawaban');
      }
    }
  }
}
