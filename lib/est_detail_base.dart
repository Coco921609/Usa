import 'package:flutter/material.dart';

/// Palette « forêt de brume » partagée par les pages de détail de l'Est.
class DetailPalette {
  static const night = Color(0xFF08120F);
  static const deep = Color(0xFF10201B);
  static const mist = Color(0xFFE6EFEA);
  static const pine = Color(0xFF8BD3B0);
  static const amber = Color(0xFFF5C26B);
  static const rose = Color(0xFFFF8F8F);
}

/// Choisit le texte selon la langue de la page.
String tr(bool isFrench, String fr, String en) => isFrench ? fr : en;

Widget detailFallbackImage(Color accent) {
  return Container(
    color: DetailPalette.deep,
    alignment: Alignment.center,
    child: Icon(Icons.image_not_supported_outlined, color: accent, size: 36),
  );
}

// ---------------------------------------------------------------------------
// STRUCTURE DE PAGE
// ---------------------------------------------------------------------------

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.title,
    required this.flags,
    required this.heroImage,
    required this.accent,
    required this.isFrench,
    required this.children,
  });

  final String title;
  final String flags;
  final String heroImage;
  final Color accent;
  final bool isFrench;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // Respect de l'option « réduire les animations » du système.
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Scaffold(
      backgroundColor: DetailPalette.night,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 56),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 520,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // L'image se pose lentement à l'ouverture
                      TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 1.12, end: 1.0),
                        duration: Duration(milliseconds: reduceMotion ? 0 : 2000),
                        curve: Curves.easeOutCubic,
                        builder: (context, scale, child) =>
                            Transform.scale(scale: scale, child: child),
                        child: Image.asset(
                          heroImage,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              detailFallbackImage(accent),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              DetailPalette.night.withOpacity(0.55),
                              DetailPalette.night.withOpacity(0.0),
                              DetailPalette.night.withOpacity(0.7),
                              DetailPalette.night,
                            ],
                            stops: const [0.0, 0.3, 0.7, 1.0],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 24,
                        right: 24,
                        bottom: 36,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(flags, style: const TextStyle(fontSize: 22)),
                            const SizedBox(height: 14),
                            Text(
                              title,
                              style: const TextStyle(
                                fontFamily: 'DMSerifDisplay',
                                fontSize: 48,
                                height: 1.02,
                                letterSpacing: -0.6,
                                color: DetailPalette.mist,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: 48,
                              height: 2,
                              decoration: BoxDecoration(
                                color: accent,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _BackButton(isFrench: isFrench),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.isFrench});

  final bool isFrench;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: tr(isFrench, 'Retour', 'Back'),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 42,
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: DetailPalette.night.withOpacity(0.55),
              border: Border.all(color: Colors.white.withOpacity(0.14)),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// BLOCS DE CONTENU
// ---------------------------------------------------------------------------

/// Citation « le saviez-vous » dans une carte avec un trait de couleur.
class DetailLead extends StatelessWidget {
  const DetailLead({super.key, required this.text, required this.accent});

  final String text;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: DetailPalette.deep,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: accent.withOpacity(0.18)),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 3,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'DMSerifDisplay',
                  fontSize: 19,
                  height: 1.45,
                  color: DetailPalette.mist,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailIntro extends StatelessWidget {
  const DetailIntro({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 15,
          height: 1.75,
          color: DetailPalette.mist.withOpacity(0.78),
        ),
      ),
    );
  }
}

class DetailSectionTitle extends StatelessWidget {
  const DetailSectionTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 46, 0, 18),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'DMSerifDisplay',
          fontSize: 28,
          height: 1.1,
          color: DetailPalette.mist,
        ),
      ),
    );
  }
}

class DetailSubheading extends StatelessWidget {
  const DetailSubheading({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: DetailPalette.mist,
        ),
      ),
    );
  }
}

/// Galerie horizontale : cadres en arche, à la façon d'une fenêtre.
class DetailGallery extends StatelessWidget {
  const DetailGallery({super.key, required this.images, required this.accent});

  final List<String> images;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        itemCount: images.length,
        separatorBuilder: (context, index) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(120),
              topRight: Radius.circular(120),
              bottomLeft: Radius.circular(28),
              bottomRight: Radius.circular(28),
            ),
            child: SizedBox(
              width: 240,
              height: 340,
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    detailFallbackImage(accent),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailTip {
  const DetailTip(this.emoji, this.text);

  final String emoji;
  final String text;
}

/// Liste de conseils, chacun avec un petit médaillon emoji.
class DetailTipList extends StatelessWidget {
  const DetailTipList({super.key, required this.tips, required this.accent});

  final List<DetailTip> tips;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final tip in tips)
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accent.withOpacity(0.12),
                    border: Border.all(color: accent.withOpacity(0.3)),
                  ),
                  child: Text(tip.emoji, style: const TextStyle(fontSize: 18)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 9),
                    child: Text(
                      tip.text,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.5,
                        height: 1.6,
                        color: DetailPalette.mist.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// Liste à puces simples, avec des points de la couleur de la destination.
class DetailBullets extends StatelessWidget {
  const DetailBullets({super.key, required this.items, required this.accent});

  final List<String> items;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: accent,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      height: 1.6,
                      color: DetailPalette.mist.withOpacity(0.78),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// Deux cartes côte à côte en pile : ce qui est recommandé, ce qu'il faut éviter.
class DetailSeasons extends StatelessWidget {
  const DetailSeasons({
    super.key,
    required this.goodLabel,
    required this.goodText,
    required this.badLabel,
    required this.badText,
  });

  final String goodLabel;
  final String goodText;
  final String badLabel;
  final String badText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SeasonCard(
          icon: Icons.check_circle_outline_rounded,
          color: DetailPalette.pine,
          label: goodLabel,
          text: goodText,
        ),
        const SizedBox(height: 12),
        _SeasonCard(
          icon: Icons.highlight_off_rounded,
          color: DetailPalette.rose,
          label: badLabel,
          text: badText,
        ),
      ],
    );
  }
}

class _SeasonCard extends StatelessWidget {
  const _SeasonCard({
    required this.icon,
    required this.color,
    required this.label,
    required this.text,
  });

  final IconData icon;
  final Color color;
  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    height: 1.6,
                    color: DetailPalette.mist.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailRow {
  const DetailRow(this.label, this.value);

  final String label;
  final String value;
}

/// Tableau d'horaires : libellé à gauche, valeur à droite, filets fins entre les lignes.
class DetailTimetable extends StatelessWidget {
  const DetailTimetable({super.key, required this.rows});

  final List<DetailRow> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < rows.length; i++) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    rows[i].label,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: DetailPalette.mist,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 7,
                  child: Text(
                    rows[i].value,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      height: 1.4,
                      color: DetailPalette.mist.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (i < rows.length - 1)
            Container(height: 1, color: Colors.white.withOpacity(0.07)),
        ],
      ],
    );
  }
}

/// Note d'information, dans une teinte ambrée.
class DetailNotice extends StatelessWidget {
  const DetailNotice({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 36),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: DetailPalette.amber.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: DetailPalette.amber.withOpacity(0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_outline_rounded,
            color: DetailPalette.amber,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 13,
                fontStyle: FontStyle.italic,
                height: 1.6,
                color: DetailPalette.amber.withOpacity(0.95),
              ),
            ),
          ),
        ],
      ),
    );
  }
}