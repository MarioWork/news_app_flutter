import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({Key? key}) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.white30,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl:
                'https://cdn.cmjornal.pt/images/2021-12/img_1200x676\$2021_12_02_21_26_17_1105138.jpg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox(
                    height: 200,
                    child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.redAccent,
                        ))),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Declaração do IRS tem vários passos e alguns têm de ser dados até 15 de fevereiro. Saiba quais - Correio da Manhã',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  children: [
                    const Expanded(child: Text('13-01-2022')),
                    SizedBox(
                      height: 20,
                      child: IconButton(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        iconSize: 20,
                        onPressed: () {
                          Share.share(
                              'https://www.cmjornal.pt/economia/detalhe/declaracao-do-irs-tem-varios-passos-e-alguns-tem-de-ser-dados-ate-15-de-fevereiro-saiba-quais',
                              subject: 'Declaração do IRS tem vários passos e alguns têm de ser dados até 15 de fevereiro. Saiba quais - Correio da Manhã');

                        },
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
