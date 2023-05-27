import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'product_details_model.dart';
export 'product_details_model.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({
    Key? key,
    this.productSelection,
  }) : super(key: key);

  final MenuItemsRecord? productSelection;

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  late ProductDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CartsRecord>>(
      stream: queryCartsRecord(
        queryBuilder: (cartsRecord) =>
            cartsRecord.where('userRef', isEqualTo: currentUserReference),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        List<CartsRecord> productDetailsCartsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final productDetailsCartsRecord =
            productDetailsCartsRecordList.isNotEmpty
                ? productDetailsCartsRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              actions: [],
              centerTitle: false,
              elevation: 0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1506619216599-9d16d0903dfd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80',
                                width: double.infinity,
                                height: 230,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  '(Product Name)',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  '(price)',
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 20,
                            thickness: 2,
                            indent: 16,
                            endIndent: 16,
                            color: FlutterFlowTheme.of(context).lineColor,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Description',
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    '(Description)',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: AlignmentDirectional(-0.9, 0),
                                    child: Text(
                                      'Type of Milk',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                ),
                                FlutterFlowCheckboxGroup(
                                  options: [
                                    'Organic Whole milk',
                                    'Almond Milk',
                                    'Oat Milk'
                                  ],
                                  onChanged: (val) => setState(
                                      () => _model.modifiersValues = val),
                                  controller:
                                      _model.modifiersValueController ??=
                                          FormFieldController<List<String>>(
                                    [],
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  checkColor: Colors.white,
                                  checkboxBorderColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  itemPadding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  checkboxBorderRadius:
                                      BorderRadius.circular(4),
                                  initialized: _model.modifiersValues != null,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: AlignmentDirectional(-0.9, 0),
                                    child: Text(
                                      'Size',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                ),
                                FlutterFlowCheckboxGroup(
                                  options: ['Tall', 'Grande'],
                                  onChanged: (val) => setState(
                                      () => _model.modifiers2Values = val),
                                  controller:
                                      _model.modifiers2ValueController ??=
                                          FormFieldController<List<String>>(
                                    [],
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  checkColor: Colors.white,
                                  checkboxBorderColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  itemPadding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  checkboxBorderRadius:
                                      BorderRadius.circular(4),
                                  initialized: _model.modifiers2Values != null,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: AlignmentDirectional(-0.9, 0),
                                    child: Text(
                                      'Ice / Hot',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                ),
                                FlutterFlowCheckboxGroup(
                                  options: ['Iced', 'Hot'],
                                  onChanged: (val) => setState(
                                      () => _model.modifiers3Values = val),
                                  controller:
                                      _model.modifiers3ValueController ??=
                                          FormFieldController<List<String>>(
                                    [],
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  checkColor: Colors.white,
                                  checkboxBorderColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  itemPadding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  checkboxBorderRadius:
                                      BorderRadius.circular(4),
                                  initialized: _model.modifiers3Values != null,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: AlignmentDirectional(-0.9, 0),
                                    child: Text(
                                      'Quanity',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 24),
                                  child: Container(
                                    width: 160,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(25),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 1,
                                      ),
                                    ),
                                    child: FlutterFlowCountController(
                                      decrementIconBuilder: (enabled) => Icon(
                                        Icons.remove_rounded,
                                        color: enabled
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryText
                                            : FlutterFlowTheme.of(context)
                                                .lineColor,
                                        size: 20,
                                      ),
                                      incrementIconBuilder: (enabled) => Icon(
                                        Icons.add_rounded,
                                        color: enabled
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .lineColor,
                                        size: 20,
                                      ),
                                      countBuilder: (count) => Text(
                                        count.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                      ),
                                      count: _model.countControllerValue ??= 1,
                                      updateCount: (count) => setState(() =>
                                          _model.countControllerValue = count),
                                      stepSize: 1,
                                      minimum: 1,
                                      maximum: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final itemDetailCreateData = {
                          ...createItemDetailRecordData(
                            name: widget.productSelection!.name,
                            description: widget.productSelection!.description,
                            price: widget.productSelection!.price,
                            quantity: _model.countControllerValue,
                            cartRef: productDetailsCartsRecord!.reference,
                            menuitemRef: widget.productSelection!.reference,
                            menuitemPhoto:
                                widget.productSelection!.productPhoto,
                          ),
                          'modifiers': _model.modifiersValues,
                          'modifiers_1': _model.modifiers2Values,
                        };
                        var itemDetailRecordReference =
                            ItemDetailRecord.collection.doc();
                        await itemDetailRecordReference
                            .set(itemDetailCreateData);
                        _model.iteminCart =
                            ItemDetailRecord.getDocumentFromData(
                                itemDetailCreateData,
                                itemDetailRecordReference);

                        final cartsUpdateData = {
                          ...createCartsRecordData(
                            cartActive: true,
                          ),
                          'itemCount': FieldValue.increment(
                              _model.countControllerValue!),
                          'subtotal': FieldValue.increment(functions.subtotal(
                              _model.countControllerValue!,
                              widget.productSelection!.price)),
                          'cartItems': FieldValue.arrayUnion(
                              [_model.iteminCart!.reference]),
                        };
                        await productDetailsCartsRecord!.reference
                            .update(cartsUpdateData);

                        context.pushNamed('CheckoutPage');

                        setState(() {});
                      },
                      text: 'Add To Cart',
                      options: FFButtonOptions(
                        width: 270,
                        height: 50,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).primaryText,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
