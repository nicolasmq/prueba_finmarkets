import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_finmarkets/features/asset_detail/presentation/provider/asset_detail_provider.dart';
import 'package:prueba_finmarkets/features/asset_detail/presentation/widgets/card_chip.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';

class AssetDetail extends StatefulWidget {
  const AssetDetail(
      {Key? key, required this.assetId, required this.assetEntity})
      : super(key: key);
  final String assetId;
  final AssetEntity assetEntity;

  @override
  State<AssetDetail> createState() => _AssetDetailState();
}

class _AssetDetailState extends State<AssetDetail> {
  @override
  void initState() {
    final assetDetailProvider =
        Provider.of<AssetDetailProvider>(context, listen: false);
    assetDetailProvider.call(
      assetId: widget.assetId,
    );
    assetDetailProvider.getPeriods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final assetDetailProvider = Provider.of<AssetDetailProvider>(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.blue,
            ),
            Text(widget.assetEntity.name!),
            Text(widget.assetEntity.assetId!),
            Visibility(
              visible: assetDetailProvider.errorMessage.isEmpty,
              replacement: Center(
                child: Row(
                  children: [
                    Text(assetDetailProvider.errorMessage),
                    IconButton(
                        onPressed: () {
                          assetDetailProvider.getPeriods();
                          assetDetailProvider.getSymbols(widget.assetId);
                        },
                        icon: Icon(Icons.refresh))
                  ],
                ),
              ),
              child: SizedBox(
                height: 30.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: assetDetailProvider.periodsList.length,
                  itemBuilder: (context, index) {
                    final period = assetDetailProvider.periodsList[index];
                    return CardChip(
                      label: period.periodId,
                      onTap: () {
                        assetDetailProvider.getAssetOhlcv(
                            assetDetailProvider.symbolList[0].symbolId!,
                            period.periodId!,
                            assetDetailProvider.getTimeStart(period).toUtc());
                      },
                    );
                  },
                ),
              ),
            ),
            Visibility(
              visible: assetDetailProvider.assetOhlcvList.isNotEmpty,
              child: SizedBox(
                height: 300,
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        spots: assetDetailProvider.assetOhlcvList
                            .map((e) => FlSpot(
                                e.timePeriodStart!.millisecondsSinceEpoch
                                    .toDouble(),
                                e.priceClose!))
                            .toList(),
                        isCurved: true,
                        dotData: FlDotData(
                          show: false,
                        ),
                      ),
                    ],
                    titlesData: FlTitlesData(),
                    gridData: FlGridData(
                      show: true,
                      horizontalInterval: 1000,
                      verticalInterval: assetDetailProvider.assetOhlcvList.firstOrNull?.timePeriodStart?.millisecondsSinceEpoch.toDouble() ?? 10000.0,
                    ),
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
