import 'package:flutter/material.dart';
import 'package:personal_moneymanagement/db/catagory/catagory_db.dart';
import 'package:personal_moneymanagement/screens/catagory/expence_catagory_list.dart';
import 'package:personal_moneymanagement/screens/catagory/income_catagory_list.dart';

class ScreenCatagory extends StatefulWidget {
  const ScreenCatagory({Key? key}) : super(key: key);

  @override
  State<ScreenCatagory> createState() => _ScreenCatagoryState();
}

class _ScreenCatagoryState extends State<ScreenCatagory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CatagoryDb().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: const [
              Tab(
                text: 'INCOME',
              ),
              Tab(
                text: 'EXPENSE',
              ),
            ]),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              IncomeCatagoryList(),
              ExpenseCatagoryList(),
            ],
          ),
        )
      ],
    );
  }
}
