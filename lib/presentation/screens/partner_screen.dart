import 'package:alfaresi/config/widgets/app_container.dart';
import 'package:alfaresi/config/extension.dart';
import 'package:alfaresi/l10n/l10n.dart';
import 'package:alfaresi/presentation/screens/widgets/partner_card.dart';
import 'package:alfaresi/core/networks/partner_service.dart';
import 'package:alfaresi/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class PartnerTileModel {
  final String title;
  final String subTitle;
  final String img;
  final bool isBgColor;
  final String? coverImg;

  PartnerTileModel({
    required this.title,
    required this.subTitle,
    required this.img,
    this.isBgColor = true,
    this.coverImg,
  });
}

class PartnerScreen extends StatefulWidget {
  const PartnerScreen({super.key});

  @override
  State<PartnerScreen> createState() => _PartnerScreenState();
}

class _PartnerScreenState extends State<PartnerScreen> {
  final _partnerService = PartnerService();
  List<PartnerTileModel> _partners = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadPartners();
  }

  Future<void> _loadPartners() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final partners = await _partnerService.fetchPartners();
      setState(() {
        _partners = partners
            .map((p) => PartnerTileModel(
                  title: p.name,
                  subTitle: p.subTitle,
                  img: p.imageUrl,
                  isBgColor: true,
                ))
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                // Partner title row with merchant login button
                AppContainer(
                  child: Row(
                    children: [
                      Text(
                        l10n.partners,
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          GRouteMerchantLogin().goNamed(context);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          l10n.merchantLogin,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFD4AF37), // Gold color
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                if (_isLoading)
                  const SizedBox(
                    height: 500,
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (_error != null)
                  SizedBox(
                    height: 500,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline, size: 48, color: Colors.red),
                          const SizedBox(height: 16),
                          Text('Error loading partners: $_error'),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _loadPartners,
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  )
                else if (_partners.isEmpty)
                  const SizedBox(
                    height: 500,
                    child: Center(child: Text('No partners found')),
                  )
                else
                  CarouselCardSwiper(partners: _partners),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarouselCardSwiper extends StatefulWidget {
  final List<PartnerTileModel> partners;

  const CarouselCardSwiper({super.key, required this.partners});

  @override
  State<CarouselCardSwiper> createState() => _CarouselCardSwiperState();
}

class _CarouselCardSwiperState extends State<CarouselCardSwiper> {
  late CardSwiperController _cardSwiperController;

  @override
  void initState() {
    super.initState();
    _cardSwiperController = CardSwiperController();
  }

  @override
  void dispose() {
    _cardSwiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: CardSwiper(
            controller: _cardSwiperController,
            cardsCount: widget.partners.length,
            onSwipe: (previousIndex, currentIndex, direction) {
              return true;
            },
            onUndo: (previousIndex, currentIndex, direction) {
              return true;
            },

            numberOfCardsDisplayed:
                widget.partners.length > 3 ? 3 : widget.partners.length,
            backCardOffset: const Offset(30, 30),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            cardBuilder: (
              context,
              index,
              percentThresholdX,
              percentThresholdY,
            ) {
              return PartnerCard(
                imageUrl: widget.partners[index].img,
                title: widget.partners[index].title,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
