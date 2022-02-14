import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_fluter/features/product/detail/controller/product_detail_controller.dart';
import 'package:test_fluter/features/product/detail/widgets/numeric_step_button.dart';
import 'package:test_fluter/models/product/product_detail_extra_model.dart';
import 'package:test_fluter/models/product/product_detail_model.dart';
import 'package:test_fluter/models/product/product_extra_item_model.dart';

class ProductDetailScreen extends GetView<ProductDetailController> {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false,
        child: Obx(() {
          final model = controller.productDetailModel.value;
          return CustomScrollView(
            slivers: [
              _buildAppBar(context, model),
              _buildInfoSection(context, model),
              const SliverToBoxAdapter(child: Divider(height: 1)),
              _buildQuantitySection(context, model),
              if (model.extras != null)
                _buildExtra(context, model.extras![0], model.extraItems),
              _buildAddButton(context, model),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, ProductDetailModel model) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      leading: Center(
        child: ElevatedButton(
          child: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            visualDensity: VisualDensity.compact,
            primary: Colors.white,
            onPrimary: Colors.grey,
            elevation: 0,
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: model.images != null
            ? Image.network(model.images!.fullSize, fit: BoxFit.cover)
            : const Icon(Icons.image),
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context, ProductDetailModel model) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              model.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 12),
            Text(
              model.description,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySection(BuildContext context, ProductDetailModel model) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            const SizedBox(width: 8),
            Expanded(child: Text('฿${model.price}')),
            NumericStepButton(
              minValue: 1,
              maxValue: 1000,
              initialValue: 1,
              onChanged: (val) => controller.selectedQuantity.value = val,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildExtra(BuildContext context, ProductExtraModel modelExtra,
      List<ProductExtraItemModel>? extraItems) {
    return SliverList(
      delegate: SliverChildListDelegate([
        const Divider(height: 1),
        _buildExtraHeader(modelExtra),
        if (int.parse(modelExtra.min) > 0)
          _buildExtraSubHeader(context, modelExtra),
        ...extraItems!.map((e) {
          if (int.parse(modelExtra.min) == 1 &&
              int.parse(modelExtra.max) == 1) {
            return _buildSingleChoiceExtraItem(context, e);
          } else {
            return _buildMultipleChoiceExtraItem(
                context, int.parse(modelExtra.max), e);
          }
        }).toList()
      ]),
    );
  }

  Widget _buildExtraHeader(ProductExtraModel modelExtra) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      child: RichText(
        text: TextSpan(
          text: modelExtra.name.toUpperCase(),
          children: [
            if (int.parse(modelExtra.min) > 0)
              TextSpan(
                text: ' (required)'.toUpperCase(),
                style: const TextStyle(color: Colors.grey),
              )
          ],
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildExtraSubHeader(
      BuildContext context, ProductExtraModel modelExtra) {
    String text = '';
    if (modelExtra.min == modelExtra.max) {
      text = int.parse(modelExtra.min) == 1
          ? 'Please select 1 item'
          : 'Please select ${modelExtra.min} items';
    } else {
      text = 'Please select from ${modelExtra.min} to ${modelExtra.max} items';
    }

    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .caption!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSingleChoiceExtraItem(
      BuildContext context, ProductExtraItemModel item) {
    return Obx(() => RadioListTile<int?>(
          value: item.id,
          groupValue: controller.selectedExtras.isEmpty
              ? null
              : controller.selectedExtras.first.id,
          activeColor: const Color(0xff79716b),
          title: RichText(
            text: TextSpan(
              text: item.name,
              children: [
                if (int.parse(item.price) > 0)
                  TextSpan(
                    text: '(฿${item.price})',
                    style: const TextStyle(color: Colors.grey),
                  )
              ],
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: (_) {
            controller.selectedExtras.clear();
            controller.selectedExtras.add(item);
          },
        ));
  }

  Widget _buildMultipleChoiceExtraItem(
      BuildContext context, int maxValue, ProductExtraItemModel item) {
    return Obx(() => CheckboxListTile(
          value: controller.selectedExtras.contains(item),
          activeColor: const Color(0xff79716b),
          title: RichText(
            text: TextSpan(
              text: item.name,
              children: [
                if (int.parse(item.price) > 0)
                  TextSpan(
                    text: '(฿${item.price})',
                    style: const TextStyle(color: Colors.grey),
                  )
              ],
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: controller.selectedExtras.contains(item)
              ? (_) => controller.selectedExtras.remove(item)
              : controller.selectedExtras.length < maxValue
                  ? (_) => controller.selectedExtras.add(item)
                  : null,
        ));
  }

  Widget _buildAddButton(BuildContext context, ProductDetailModel model) {
    return Obx(
      () => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff372b22),
            ),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart),
                Expanded(
                  child: Text(
                    'ADD ${controller.selectedQuantity} TO CART',
                    textAlign: TextAlign.center,
                  ),
                ),
                Text('(฿${controller.totalPrice()})'),
              ],
            ),
            onPressed: isAddButtonEnable(model)
                ? () => Get.snackbar(
                      'Warning',
                      'ADD ${controller.selectedQuantity} TO CART',
                    )
                : null,
          ),
        ),
      ),
    );
  }

  bool isAddButtonEnable(ProductDetailModel model) {
    if (model.extras == null) {
      return true;
    }
    for (ProductExtraModel item in model.extras!) {
      final selectedItems =
          controller.selectedExtras.where((e) => e.extraId == item.id);
      if (selectedItems.length < int.parse(item.min)) return false;
    }
    return true;
  }
}
