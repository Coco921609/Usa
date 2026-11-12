import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'favorites_store.dart';

const Color kBg = Color(0xFF0A0C11);
const Color kBand = Color(0xFF0F131B);
const Color kSurface = Color(0xFF141821);
const Color kFav = Color(0xFFFF4D79);

// ───────────────────────── TEXTES DE L'INTERFACE (FR / EN) ─────────────────────────

class DestinationLabels {
  final String about, gallery, didYouKnow, addFav, inFav;
  final String favTitle, allTitle, noneSaved, oneSaved, manySaved;
  final String chipFav, chipAll, emptyTitle, emptyText, emptyBtn;

  const DestinationLabels({
    required this.about,
    required this.gallery,
    required this.didYouKnow,
    required this.addFav,
    required this.inFav,
    required this.favTitle,
    required this.allTitle,
    required this.noneSaved,
    required this.oneSaved,
    required this.manySaved,
    required this.chipFav,
    required this.chipAll,
    required this.emptyTitle,
    required this.emptyText,
    required this.emptyBtn,
  });

  static const DestinationLabels fr = DestinationLabels(
    about: 'À propos',
    gallery: 'Aperçu du lieu',
    didYouKnow: 'LE SAVIEZ-VOUS ?',
    addFav: 'Ajouter aux favoris',
    inFav: 'Dans mes favoris',
    favTitle: 'Mes favoris',
    allTitle: 'Toutes les destinations',
    noneSaved: 'Aucune destination enregistrée',
    oneSaved: '1 destination enregistrée',
    manySaved: '{n} destinations enregistrées',
    chipFav: 'Favoris ({n})',
    chipAll: 'Toutes ({n})',
    emptyTitle: 'Aucun favori pour l’instant',
    emptyText: 'Touchez le cœur sur une destination pour la retrouver ici.',
    emptyBtn: 'Découvrir les destinations',
  );

  static const DestinationLabels en = DestinationLabels(
    about: 'About',
    gallery: 'Location Overview',
    didYouKnow: 'DID YOU KNOW?',
    addFav: 'Add to favorites',
    inFav: 'In my favorites',
    favTitle: 'My favorites',
    allTitle: 'All destinations',
    noneSaved: 'No destinations saved',
    oneSaved: '1 destination saved',
    manySaved: '{n} destinations saved',
    chipFav: 'Favorites ({n})',
    chipAll: 'All ({n})',
    emptyTitle: 'No favorites yet',
    emptyText: 'Tap the heart on a destination to find it here.',
    emptyBtn: 'Discover destinations',
  );
}

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

class DestinationEntry {
  final DestinationData data;
  final WidgetBuilder builder;
  const DestinationEntry(this.data, this.builder);
}

// ───────────────────────── PAGE (défilement type site web) ─────────────────────────

class DestinationPage extends StatefulWidget {
  final DestinationData data;
  final String title;
  final DestinationLabels labels;
  const DestinationPage(
      {super.key,
        required this.data,
        this.title = '',
        this.labels = DestinationLabels.fr});

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  static const double _heroH = 480;
  final ScrollController _scroll = ScrollController();
  final ValueNotifier<double> _offset = ValueNotifier(0);
  late final GlobalKey _aboutKey = GlobalKey();
  late final GlobalKey _galleryKey = GlobalKey();
  late final List<GlobalKey> _sectionKeys =
  List.generate(widget.data.sections.length, (_) => GlobalKey());

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      _offset.value = _scroll.hasClients ? _scroll.offset : 0;
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    _offset.dispose();
    super.dispose();
  }

  void _jump(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    final mq = MediaQuery.of(context);
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeInOutCubic,
      alignment: (mq.padding.top + 16) / mq.size.height,
    );
  }

  // Grande photo d'ouverture : fait partie de la page et défile avec elle.
  Widget _buildHero(DestinationData d, String title, double topPad) {
    return SizedBox(
      height: _heroH,
      width: double.infinity,
      child: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: -180,
              left: 0,
              right: 0,
              bottom: 0,
              child: ValueListenableBuilder<double>(
                valueListenable: _offset,
                builder: (context, o, _) => Transform.translate(
                  offset: Offset(0, o.clamp(0.0, _heroH) * .35),
                  child: Image.asset(
                    d.cover,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(color: kSurface),
                  ),
                ),
              ),
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
            Positioned(
              top: topPad + 8,
              left: 16,
              child: GlassButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: () => Navigator.of(context).maybePop(),
              ),
            ),
            Positioned(
              top: topPad + 8,
              right: 16,
              child: FavoriteButton(id: d.id),
            ),
            Positioned(
              left: 24,
              right: 24,
              bottom: 30,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Pill(text: '${d.emoji}  ${d.flag}', color: d.accent),
                  const SizedBox(height: 14),
                  Text(
                    title,
                    softWrap: true,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 36,
                      height: 1.08,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -.6,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: 64,
                    height: 4,
                    decoration: BoxDecoration(
                      color: d.accent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.data;
    final s = widget.labels;
    final shownTitle = widget.title.trim().isEmpty ? d.name : widget.title;
    final topPad = MediaQuery.of(context).padding.top;
    final accent = d.accent;

    final navItems = <_NavItem>[
      _NavItem('📖', s.about, () => _jump(_aboutKey)),
      _NavItem('📸', s.gallery, () => _jump(_galleryKey)),
      for (var i = 0; i < d.sections.length; i++)
        _NavItem(d.sections[i].emoji, d.sections[i].title,
                () => _jump(_sectionKeys[i])),
    ];

    return Scaffold(
      backgroundColor: kBg,
      body: CustomScrollView(
        controller: _scroll,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: _buildHero(d, shownTitle, topPad)),
          SliverToBoxAdapter(child: _NavRow(items: navItems)),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // ── À propos
                _Reveal(
                  key: _aboutKey,
                  child: _Band(
                    color: kBg,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _DidYouKnow(
                            label: s.didYouKnow,
                            text: d.didYouKnow,
                            accent: accent),
                        const SizedBox(height: 36),
                        _Heading(
                            emoji: '📖', title: s.about, accent: accent),
                        const SizedBox(height: 14),
                        Text(
                          d.intro,
                          softWrap: true,
                          style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16.5,
                              height: 1.7),
                        ),
                        if (d.facts.isNotEmpty) ...[
                          const SizedBox(height: 26),
                          _FactsWrap(facts: d.facts, accent: accent),
                        ],
                      ],
                    ),
                  ),
                ),

                // ── Galerie
                _Reveal(
                  key: _galleryKey,
                  child: Container(
                    width: double.infinity,
                    color: kBand,
                    padding: const EdgeInsets.symmetric(vertical: 44),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 24),
                          child: Center(
                            child: ConstrainedBox(
                              constraints:
                              const BoxConstraints(maxWidth: 760),
                              child: _Heading(
                                  emoji: '📸',
                                  title: s.gallery,
                                  accent: accent),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        _GalleryCarousel(
                            images: d.gallery, accent: accent),
                      ],
                    ),
                  ),
                ),

                // ── Sections
                for (var i = 0; i < d.sections.length; i++)
                  _Reveal(
                    key: _sectionKeys[i],
                    child: _SectionBand(
                      index: i,
                      section: d.sections[i],
                      accent: accent,
                      color: i.isEven ? kBg : kBand,
                    ),
                  ),

                // ── Avertissements + favoris
                _Reveal(
                  child: _Band(
                    color: d.sections.length.isEven ? kBg : kBand,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (d.warning != null)
                          _Notice(
                              emoji: '⚠️',
                              text: d.warning!,
                              color: const Color(0xFFFF6B6B)),
                        if (d.note != null)
                          _Notice(
                              emoji: 'ℹ️',
                              text: d.note!,
                              color: Colors.white),
                        const SizedBox(height: 10),
                        _FavCta(
                            id: d.id,
                            accent: accent,
                            addLabel: s.addFav,
                            inLabel: s.inFav),
                        SizedBox(
                            height: 40 +
                                MediaQuery.of(context).padding.bottom),
                      ],
                    ),
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

// ───────────────────────── BARRE DE NAVIGATION (type site web) ─────────────────────────

class _NavItem {
  final String emoji, label;
  final VoidCallback onTap;
  const _NavItem(this.emoji, this.label, this.onTap);
}

class _NavRow extends StatelessWidget {
  final List<_NavItem> items;
  const _NavRow({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: kBg,
        border: Border(
            bottom: BorderSide(color: Colors.white.withOpacity(.07))),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            for (final it in items)
              GestureDetector(
                onTap: it.onTap,
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.06),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: Colors.white.withOpacity(.09)),
                  ),
                  child: Row(
                    children: [
                      Text(it.emoji, style: const TextStyle(fontSize: 14)),
                      const SizedBox(width: 7),
                      Text(
                        it.label,
                        softWrap: false,
                        style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ───────────────────────── APPARITION AU DÉFILEMENT ─────────────────────────

class _Reveal extends StatefulWidget {
  final Widget child;
  const _Reveal({super.key, required this.child});

  @override
  State<_Reveal> createState() => _RevealState();
}

class _RevealState extends State<_Reveal> {
  bool _shown = false;
  ScrollPosition? _pos;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pos?.removeListener(_check);
    _pos = Scrollable.maybeOf(context)?.position;
    _pos?.addListener(_check);
    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
  }

  @override
  void dispose() {
    _pos?.removeListener(_check);
    super.dispose();
  }

  void _check() {
    if (_shown || !mounted) return;
    final ro = context.findRenderObject();
    if (ro is! RenderBox || !ro.attached || !ro.hasSize) return;
    final top = ro.localToGlobal(Offset.zero).dy;
    if (top < MediaQuery.of(context).size.height * .9) {
      setState(() => _shown = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: _shown ? Offset.zero : const Offset(0, .06),
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeOutCubic,
      child: AnimatedOpacity(
        opacity: _shown ? 1 : 0,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}

// ───────────────────────── BANDES PLEINE LARGEUR ─────────────────────────

class _Band extends StatelessWidget {
  final Color color;
  final Widget child;
  const _Band({required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: color,
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 44),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: child,
        ),
      ),
    );
  }
}

class _SectionBand extends StatelessWidget {
  final int index;
  final InfoSection section;
  final Color accent, color;
  const _SectionBand(
      {required this.index,
        required this.section,
        required this.accent,
        required this.color});

  @override
  Widget build(BuildContext context) {
    final n = index + 1 < 10 ? '0${index + 1}' : '${index + 1}';
    return _Band(
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            n,
            style: TextStyle(
              color: accent,
              fontSize: 14,
              fontWeight: FontWeight.w800,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(section.emoji, style: const TextStyle(fontSize: 30)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  section.title,
                  softWrap: true,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 26,
                    height: 1.2,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            width: 64,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                  colors: [accent, accent.withOpacity(.1)]),
            ),
          ),
          const SizedBox(height: 24),
          if (section.kind == SectionKind.text)
            Text(
              section.items.join('\n\n'),
              softWrap: true,
              style: const TextStyle(
                  color: Colors.white70, fontSize: 16.5, height: 1.7),
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
  final String id, addLabel, inLabel;
  final Color accent;
  const _FavCta(
      {required this.id,
        required this.accent,
        required this.addLabel,
        required this.inLabel});

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
                    fav ? inLabel : addLabel,
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
          height: 28,
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
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -.3,
            ),
          ),
        ),
      ],
    );
  }
}

class _DidYouKnow extends StatelessWidget {
  final String label, text;
  final Color accent;
  const _DidYouKnow(
      {required this.label, required this.text, required this.accent});

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
                  label,
                  softWrap: true,
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
                    fontSize: 15.5,
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
    final maxW = MediaQuery.of(context).size.width - 48;
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

final RegExp _labelRe = RegExp(r'^(.{1,44}?)\s?:\s');

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
    final m = _labelRe.firstMatch(t);
    if (m != null && !m.group(1)!.contains('.')) {
      label = m.group(1);
      body = t.substring(m.end);
    }

    Color tint = Colors.white.withOpacity(.04);
    if (lead == '✅') tint = const Color(0xFF2ECC71).withOpacity(.12);
    if (lead == '❌') tint = const Color(0xFFFF5252).withOpacity(.12);
    if (lead == '⚠️') tint = const Color(0xFFFFB300).withOpacity(.12);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      decoration:
      BoxDecoration(color: tint, borderRadius: BorderRadius.circular(18)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 32,
            child: lead != null
                ? Text(lead, style: const TextStyle(fontSize: 19))
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
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        height: 1.35)),
                const SizedBox(height: 3),
                Text(body,
                    softWrap: true,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        height: 1.55)),
              ],
            )
                : Text(body,
                softWrap: true,
                style: const TextStyle(
                    color: Colors.white70, fontSize: 15, height: 1.55)),
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
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.04),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Text(label,
                softWrap: true,
                style: const TextStyle(
                    color: Colors.white, fontSize: 16, height: 1.35)),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: Text(value,
                softWrap: true,
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: accent,
                    fontSize: 17,
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
                  fontSize: 14,
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
          height: 270,
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
        const SizedBox(height: 16),
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