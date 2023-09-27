import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_finmarkets/features/asset_detail/presentation/provider/asset_detail_provider.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';

class AssetDetail extends StatefulWidget {
  const AssetDetail({Key? key, required this.assetId, required this.assetEntity}) : super(key: key);
  final String assetId;
  final AssetEntity assetEntity;

  @override
  State<AssetDetail> createState() => _AssetDetailState();
}

class _AssetDetailState extends State<AssetDetail> {

  @override
  void initState() {
    final assetDetailProvider = Provider.of<AssetDetailProvider>(context, listen: false);
    assetDetailProvider.call(assetId: widget.assetId,);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final assetDetailProvider = Provider.of<AssetDetailProvider>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(widget.assetEntity.name!),
              Text(widget.assetEntity.assetId!),

              ...assetDetailProvider.periodsList.map((e) => ListTile(title: Text(e.periodId ?? ""),))
            ],
          ),
        ) ,
      )
    );
  }
}
