part of '../../trucks_create_whisper.dart';

class _TruckCreateSCT extends StatelessWidget {
  final TWSArticleCreatorItemState<Object>? itemState;
  final bool enable;
  const _TruckCreateSCT({
    this.itemState,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    final Truck item = itemState!.model as Truck;
    return TWSSection(
      isOptional: true,
      padding: const EdgeInsets.symmetric(vertical: 10),
      title: "SCT*", 
      content: CSMSpacingColumn(
        spacing: 10,
        children: <Widget>[
          CSMSpacingRow(
            spacing: 10,
            children: <Widget>[
              Expanded(
                child: TWSInputText(
                  label: 'Type',
                  maxLength: 6,
                  isStrictLength: true,
                  controller: TextEditingController(text: item.sctNavigation?.type),
                  onChanged: (String text) {
                    Truck model = itemState!.model as Truck;
                    itemState!.updateModelRedrawing(
                      model.clone(
                        sctNavigation: model.sctNavigation?.clone(type: text) ?? SCT.a().clone(type: text)
                      ),
                    );
                  },
                  isEnabled: enable,
                ),
              ),
              Expanded(
                child: TWSInputText(
                  label: 'Number',
                  maxLength: 25,
                  isStrictLength: true,
                  controller: TextEditingController(text: item.sctNavigation?.number),
                  onChanged: (String text) {
                    Truck model = itemState!.model as Truck;
                    itemState!.updateModelRedrawing(
                      model.clone(
                        sctNavigation: model.sctNavigation?.clone(number: text) ?? SCT.a().clone(number: text)
                      ),
                    );
                  },
                  isEnabled: enable,
                ),
              ),
              Expanded(
                child: TWSInputText(
                  label: 'Configuration',
                  maxLength: 10,
                  controller: TextEditingController(text: item.sctNavigation?.configuration),
                  onChanged: (String text) {
                    Truck model = itemState!.model as Truck;
                    itemState!.updateModelRedrawing(
                      model.clone(
                        sctNavigation: model.sctNavigation?.clone(configuration: text) ?? SCT.a().clone(configuration: text)
                      ),
                    );
                  },
                  isEnabled: enable,
                ),
              )
            ]
          )
        ]
      )
    );
  }
}