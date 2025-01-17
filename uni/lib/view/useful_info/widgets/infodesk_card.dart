import 'package:flutter/material.dart';
import 'package:uni/view/common_widgets/generic_expansion_card.dart';
import 'package:uni/view/useful_info/widgets/text_components.dart';

class InfoDeskCard extends GenericExpansionCard {
  const InfoDeskCard({super.key});

  @override
  Widget buildCardContent(BuildContext context) {
    return Column(
      children: <Container>[
        h1('Horário', context, initial: true),
        h2('Atendimento presencial e telefónico', context),
        infoText('9:30h - 13:00h | 14:00h - 17:30h', context),
        h1('Telefone', context),
        infoText('+351 225 081 400', context, link: 'tel:225 081 400'),
        h1('Email', context),
        infoText(
          'infodesk@fe.up.pt',
          context,
          last: true,
          link: 'mailto:infodesk@fe.up.pt',
        )
      ],
    );
  }

  @override
  String getTitle() => 'Infodesk';
}
