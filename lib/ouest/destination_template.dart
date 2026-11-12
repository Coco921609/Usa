import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'favorites_store.dart';

const Color kBg = Color(0xFF0A0C11);
const Color kSurface = Color(0xFF141821);
const Color kFav = Color(0xFFFF4D79);

// ───────────────────────── MODÈLES ─────────────────────────

class QuickFact {
  final String emoji, label, value;
  const QuickFact(this.emoji, this.label, this.value);
}

enum SectionKind { bullets, prices, text }

class InfoSection {
  final String emoji, title;
  final List<String> items;
  final SectionKind kind;
  const InfoSection(this.emoji, this.title, this.items,
      {this.kind = SectionKind.bullets});
}

class DestinationData {
  final String id, name, emoji, flag, cover, intro, didYouKnow;
  final List<String> gallery;
  final List<QuickFact> facts;
  final List<InfoSection> sections;
  final String? warning, note;
  final Color accent;

  const DestinationData({
    required this.id,
    required this.name,
    required this.emoji,
    required this.cover,
    required this.intro,
    required this.didYouKnow,
    required this.gallery,
    required this.facts,
    required this.sections,
    required this.accent,
    this.flag = '🇺🇸',
    this.warning,
    this.note,
  });
}

// ───────────────────────── PAGE ─────────────────────────

class DestinationPage extends StatelessWidget {
  final DestinationData data;
  final String title;
  const DestinationPage({super.key, required this.data, this.title = ''});

  @override
  Widget build(BuildContext context) {
    final shownTitle = title.trim().isEmpty ? data.name : title;
    final topPad = MediaQuery.of(context).padding.top;
    const expanded = 440.0;
    final accent = data.accent;

    return Scaffold(
      backgroundColor: kBg,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: false,
            expandedHeight: expanded,
            backgroundColor: kBg,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            leadingWidth: 68,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Center(
                child: GlassButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () => Navigator.of(context).maybePop(),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(child: FavoriteButton(id: data.id)),
              ),
            ],
            flexibleSpace: LayoutBuilder(builder: (context, c) {
              final minH = kToolbarHeight + topPad;
              final t = ((c.maxHeight - minH) / (expanded + topPad - minH))
                  .clamp(0.0, 1.0);
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    data.cover,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(color: kSurface),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0, .3, .72, 1],
                        colors: [
                          Colors.black.withOpacity(.55),
                          Colors.transparent,
                          kBg.withOpacity(.75),
                          kBg,
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(22, 0, 22, 26),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: OverflowBox(
                          alignment: Alignment.bottomLeft,
                          minHeight: 0,
                          maxHeight: double.infinity,
                          child: Opacity(
                            opacity: t,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _Pill(
                                    text: '${data.emoji}  ${data.flag}',
                                    color: accent),
                                const SizedBox(height: 14),
                                Text(
                                  shownTitle,
                                  softWrap: true,
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 34,
                                    height: 1.1,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    letterSpacing: -.5,
                                  ),
                                ),
                                const SizedBox(height: 14),
                                Container(
                                  width: 56,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: accent,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _DidYouKnow(text: data.didYouKnow, accent: accent),
                  const SizedBox(height: 28),
                  _Heading(emoji: '📖', title: 'À propos', accent: accent),
                  const SizedBox(height: 12),
                  Text(
                    data.intro,
                    softWrap: true,
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 16, height: 1.65),
                  ),
                  if (data.facts.isNotEmpty) ...[
                    const SizedBox(height: 22),
                    _FactsWrap(facts: data.facts, accent: accent),
                  ],
                  const SizedBox(height: 32),
                  _Heading(
                      emoji: '📸', title: 'Aperçu du lieu', accent: accent),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _GalleryCarousel(images: data.gallery, accent: accent),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final s in data.sections)
                    _InfoCard(section: s, accent: accent),
                  if (data.warning != null)
                    _Notice(
                      emoji: '⚠️',
                      text: data.warning!,
                      color: const Color(0xFFFF6B6B),
                    ),
                  if (data.note != null)
                    _Notice(
                      emoji: 'ℹ️',
                      text: data.note!,
                      color: Colors.white,
                    ),
                  const SizedBox(height: 12),
                  _FavCta(id: data.id, accent: accent),
                  SizedBox(
                      height: 40 + MediaQuery.of(context).padding.bottom),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────── BOUTONS ─────────────────────────

class GlassButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  const GlassButton(
      {super.key,
        required this.icon,
        required this.onTap,
        this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: _GlassCircle(child: Icon(icon, color: color, size: 20)),
    );
  }
}

class _GlassCircle extends StatelessWidget {
  final Widget child;
  const _GlassCircle({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          width: 46,
          height: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(.35),
            border: Border.all(color: Colors.white.withOpacity(.18)),
          ),
          child: child,
        ),
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  final String id;
  const FavoriteButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: FavoritesStore.instance,
      builder: (context, _) {
        final fav = FavoritesStore.instance.isFavorite(id);
        return GestureDetector(
          onTap: () {
            HapticFeedback.lightImpact();
            FavoritesStore.instance.toggle(id);
          },
          child: _GlassCircle(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 260),
              transitionBuilder: (c, a) => ScaleTransition(scale: a, child: c),
              child: Icon(
                fav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                key: ValueKey(fav),
                color: fav ? kFav : Colors.white,
                size: 22,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FavCta extends StatelessWidget {
  final String id;
  final Color accent;
  const _FavCta({required this.id, required this.accent});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: FavoritesStore.instance,
      builder: (context, _) {
        final fav = FavoritesStore.instance.isFavorite(id);
        return GestureDetector(
          onTap: () {
            HapticFeedback.mediumImpact();
            FavoritesStore.instance.toggle(id);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: fav
                  ? null
                  : LinearGradient(colors: [accent, kFav.withOpacity(.9)]),
              color: fav ? kFav.withOpacity(.12) : null,
              border: Border.all(
                  color: fav ? kFav.withOpacity(.5) : Colors.transparent),
              boxShadow: fav
                  ? []
                  : [
                BoxShadow(
                    color: accent.withOpacity(.35),
                    blurRadius: 24,
                    offset: const Offset(0, 10))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  fav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                  color: fav ? kFav : Colors.white,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    fav ? 'Dans mes favoris' : 'Ajouter aux favoris',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: fav ? kFav : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ───────────────────────── BLOCS ─────────────────────────

class _Pill extends StatelessWidget {
  final String text;
  final Color color;
  const _Pill({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: color.withOpacity(.22),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color.withOpacity(.6)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 15)),
    );
  }
}

class _Heading extends StatelessWidget {
  final String emoji, title;
  final Color accent;
  const _Heading(
      {required this.emoji, required this.title, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 24,
          decoration: BoxDecoration(
              color: accent, borderRadius: BorderRadius.circular(4)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            '$emoji  $title',
            softWrap: true,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _DidYouKnow extends StatelessWidget {
  final String text;
  final Color accent;
  const _DidYouKnow({required this.text, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [accent.withOpacity(.22), accent.withOpacity(.04)],
        ),
        border: Border.all(color: accent.withOpacity(.4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: accent.withOpacity(.25), shape: BoxShape.circle),
            child: const Text('💡', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LE SAVIEZ-VOUS ?',
                  style: TextStyle(
                    color: accent,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.6,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  text,
                  softWrap: true,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    height: 1.5,
                    fontStyle: FontStyle.italic,
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

class _FactsWrap extends StatelessWidget {
  final List<QuickFact> facts;
  final Color accent;
  const _FactsWrap({required this.facts, required this.accent});

  @override
  Widget build(BuildContext context) {
    final maxW = MediaQuery.of(context).size.width - 40;
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final f in facts)
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxW),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: kSurface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(.07)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(f.emoji, style: const TextStyle(fontSize: 22)),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(f.label.toUpperCase(),
                            softWrap: true,
                            style: TextStyle(
                                color: accent,
                                fontSize: 10.5,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.1)),
                        const SizedBox(height: 3),
                        Text(f.value,
                            softWrap: true,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                height: 1.3)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final InfoSection section;
  final Color accent;
  const _InfoCard({required this.section, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: kSurface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withOpacity(.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: accent.withOpacity(.16),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(section.emoji, style: const TextStyle(fontSize: 22)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  section.title,
                  softWrap: true,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 18,
                    height: 1.25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (section.kind == SectionKind.text)
            Text(
              section.items.join('\n\n'),
              softWrap: true,
              style: const TextStyle(
                  color: Colors.white70, fontSize: 15.5, height: 1.6),
            )
          else if (section.kind == SectionKind.prices)
            for (final it in section.items) _PriceRow(raw: it, accent: accent)
          else
            for (final it in section.items) _InfoRow(text: it, accent: accent),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String text;
  final Color accent;
  const _InfoRow({required this.text, required this.accent});

  @override
  Widget build(BuildContext context) {
    var t = text;
    String? lead;
    final sp = t.indexOf(' ');
    if (sp > 0 && t.runes.first > 0x2000) {
      lead = t.substring(0, sp);
      t = t.substring(sp + 1);
    }
    String? label;
    var body = t;
    final j = t.indexOf(' : ');
    if (j > 0 && j <= 44 && !t.substring(0, j).contains('.')) {
      label = t.substring(0, j);
      body = t.substring(j + 3);
    }

    Color tint = Colors.white.withOpacity(.035);
    if (lead == '✅') tint = const Color(0xFF2ECC71).withOpacity(.12);
    if (lead == '❌') tint = const Color(0xFFFF5252).withOpacity(.12);
    if (lead == '⚠️') tint = const Color(0xFFFFB300).withOpacity(.12);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration:
      BoxDecoration(color: tint, borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
            child: lead != null
                ? Text(lead, style: const TextStyle(fontSize: 18))
                : Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                width: 7,
                height: 7,
                decoration:
                BoxDecoration(color: accent, shape: BoxShape.circle),
              ),
            ),
          ),
          Expanded(
            child: label != null
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    softWrap: true,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 1.35)),
                const SizedBox(height: 3),
                Text(body,
                    softWrap: true,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14.5,
                        height: 1.5)),
              ],
            )
                : Text(body,
                softWrap: true,
                style: const TextStyle(
                    color: Colors.white70, fontSize: 14.5, height: 1.5)),
          ),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String raw;
  final Color accent;
  const _PriceRow({required this.raw, required this.accent});

  @override
  Widget build(BuildContext context) {
    final parts = raw.split('|');
    final label = parts.first;
    final value = parts.length > 1 ? parts[1] : '';
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.035),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Text(label,
                softWrap: true,
                style: const TextStyle(
                    color: Colors.white, fontSize: 15, height: 1.35)),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: Text(value,
                softWrap: true,
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: accent,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    height: 1.3)),
          ),
        ],
      ),
    );
  }
}

class _Notice extends StatelessWidget {
  final String emoji, text;
  final Color color;
  const _Notice(
      {required this.emoji, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: color.withOpacity(.28)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              softWrap: true,
              style: TextStyle(
                  color: color == Colors.white ? Colors.white70 : color,
                  fontSize: 13.5,
                  height: 1.5,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────── GALERIE ─────────────────────────

class _GalleryCarousel extends StatefulWidget {
  final List<String> images;
  final Color accent;
  const _GalleryCarousel({required this.images, required this.accent});

  @override
  State<_GalleryCarousel> createState() => _GalleryCarouselState();
}

class _GalleryCarouselState extends State<_GalleryCarousel> {
  final PageController _ctrl = PageController(viewportFraction: .84);
  int _index = 0;

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 260,
          child: PageView.builder(
            controller: _ctrl,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.images.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (ctx, i) {
              return AnimatedPadding(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.symmetric(
                    horizontal: 6, vertical: i == _index ? 0 : 14),
                child: GestureDetector(
                  onTap: () => Navigator.of(ctx).push(MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (_) =>
                        _GalleryViewer(images: widget.images, initial: i),
                  )),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                            color: widget.accent.withOpacity(.25),
                            blurRadius: 22,
                            offset: const Offset(0, 10)),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Image.asset(
                        widget.images[i],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        errorBuilder: (_, __, ___) =>
                            Container(color: kSurface),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < widget.images.length; i++)
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: i == _index ? 22 : 7,
                height: 7,
                decoration: BoxDecoration(
                  color: i == _index
                      ? widget.accent
                      : Colors.white.withOpacity(.25),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _GalleryViewer extends StatefulWidget {
  final List<String> images;
  final int initial;
  const _GalleryViewer({required this.images, required this.initial});

  @override
  State<_GalleryViewer> createState() => _GalleryViewerState();
}

class _GalleryViewerState extends State<_GalleryViewer> {
  late final PageController _ctrl = PageController(initialPage: widget.initial);
  late int _index = widget.initial;

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _ctrl,
            itemCount: widget.images.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (_, i) => InteractiveViewer(
              minScale: 1,
              maxScale: 4,
              child: Center(
                  child: Image.asset(widget.images[i], fit: BoxFit.contain)),
            ),
          ),
          Positioned(
            top: top + 12,
            left: 16,
            child: GlassButton(
                icon: Icons.close_rounded,
                onTap: () => Navigator.of(context).pop()),
          ),
          Positioned(
            top: top + 20,
            right: 20,
            child: _Pill(
                text: '${_index + 1} / ${widget.images.length}',
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}