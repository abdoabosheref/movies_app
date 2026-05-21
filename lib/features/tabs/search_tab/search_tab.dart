import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/features/tabs/search_tab/cubit/search_tab_states.dart';
import 'package:movies_app/features/tabs/search_tab/cubit/search_tab_view_model.dart';
import 'package:movies_app/features/widgets/custom_grid_view.dart';
import 'package:movies_app/features/widgets/custom_toast.dart';
import 'package:movies_app/features/widgets/main_loading.dart';
import '../../widgets/custom_text_form_filed.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.04,
          ),
          child: BlocConsumer<SearchTabViewModel,SearchTabStates>(
            listener: (context, state) {
              if(state is SearchTabLoadingState){
                 MainLoading();
              }else if(state is SearchTabErrorState){
                return CustomToast.showErrorToast(context, state.appException.message);
              }else if(state is SearchTabSuccessState){
                return CustomToast.showSuccessToast(context, 'Movies Loaded Successfully');
              }
            },
            builder: (context, state) {
              if(state is SearchTabSuccessState){
              }
            return Column(
              children: [
                const SizedBox(height: 10),
                CustomTextFormFiled(
                  controller: _searchController,
                  prefixIcon: AppAssets.searchIconSvg,
                  onChanged: (value) {
                    setState(() {
                      //todo:get list
                      context.read<SearchTabViewModel>().getMoviesList(queryTerm: value);


                    });
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                    child: _searchController.text.isEmpty
                        ? Center(
                      child: Image.asset(
                        AppAssets.popCorn,
                        height: screenHeight * 0.15,
                      ),
                    )
                        : CustomGridView(movies:context.read<SearchTabViewModel>().movieList,  )

                ),
              ],
            );
            }


          ),
        ),
      ),
    );
  }
}
