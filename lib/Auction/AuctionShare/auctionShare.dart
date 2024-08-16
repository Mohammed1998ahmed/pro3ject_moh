import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/Auction/AuctionShare/cubit/actions_share_cubit.dart';
import 'package:thi/component/Widght.dart';
import 'package:thi/component/conset/Const.dart';

class AuctionParticipant {
  final String name;
  final String image;
  final double bidAmount;

  AuctionParticipant(this.name, this.image, this.bidAmount);
}

class AuctionWinner {
  final String name;
  final String image;
  final double winningBid;

  AuctionWinner(this.name, this.image, this.winningBid);
}

// ignore: must_be_immutable
class AuctionShare extends StatelessWidget {
  final List<AuctionParticipant> participants = [
    AuctionParticipant('Mohammed', 'assets/images/Person.jpg', 500),
    AuctionParticipant('Ahmed', 'assets/images/unnamed.jpg', 600),
    AuctionParticipant('Mariam', 'assets/images/main/image 89.png', 700),
    AuctionParticipant('Layla', 'assets/images/main/24.png', 800),
    AuctionParticipant('Mohammed', 'assets/images/Person.jpg', 500),
    AuctionParticipant('Ahmed', 'assets/images/unnamed.jpg', 600),
    AuctionParticipant('Mariam', 'assets/images/main/image 89.png', 700),
    AuctionParticipant('Layla', 'assets/images/main/24.png', 800),
    AuctionParticipant('Mohammed', 'assets/images/Person.jpg', 500),
    AuctionParticipant('Ahmed', 'assets/images/unnamed.jpg', 600),
    AuctionParticipant('Mariam', 'assets/images/main/image 89.png', 700),
    AuctionParticipant('Layla', 'assets/images/main/24.png', 800),
  ];
  TextEditingController _amountController = TextEditingController();
  int? comparedAmount;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuctionWinner winner =
      AuctionWinner('Layla', 'assets/images/main/24.png', 800);
  final int ID_Auctions;
  final int initAmount;
  AuctionShare(
      {super.key, required this.ID_Auctions, required this.initAmount});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActionsShareCubit()
        ..getCurentBid(ID_Acutions: ID_Auctions)
        ..getBuyerList(ID_Acutions: ID_Auctions)
        ..configurePusher1(ID_Acutions: ID_Auctions),
      child: BlocConsumer<ActionsShareCubit, ActionsShareState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ActionsShareCubit.getObject(context);
          return Scaffold(
            body: Container(
              padding: EdgeInsets.only(top: 30),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back)),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          alignment: Alignment.center,
                          child: text(
                              title: 'Auction interface',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color0,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            text(
                                title: 'People who participated in the auction',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color4,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                decoration: BoxDecoration(
                                    color: Color0.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.45,
                                      child: cubit.getBuyerListModel == null
                                          ? Center(child: SpinkitWave())
                                          : ListView.builder(
                                              // shrinkWrap: true,
                                              itemCount: cubit
                                                  .getBuyerListModel!
                                                  .buyers!
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  leading: CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage:
                                                        NetworkImage(ImagesPath +
                                                            cubit
                                                                .getBuyerListModel!
                                                                .buyers![index]
                                                                .profile
                                                                .toString()),
                                                  ),
                                                  title: Text(cubit
                                                          .getBuyerListModel!
                                                          .buyers![index]
                                                          .fName
                                                          .toString() +
                                                      " " +
                                                      cubit.getBuyerListModel!
                                                          .buyers![index].lName
                                                          .toString()),
                                                  subtitle: Text(
                                                      'Bidding: ${cubit.getBuyerListModel!.buyers![index].bids![cubit.getBuyerListModel!.buyers![index].bids!.length - 1].offeredPrice.toString()}'),
                                                );
                                              },
                                            ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        child: Icon(
                                          Icons.download_for_offline_outlined,
                                          color: Color0,
                                          size: 40,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            text(
                              title: 'Auction winner',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color4,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 20),
                            cubit.getCurrntBidModel == null
                                ? Container()
                                : ListTile(
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(ImagesPath +
                                          cubit.getCurrntBidModel!
                                              .ownerOFBigBid!.profile
                                              .toString()),
                                    ),
                                    title: Text(cubit
                                        .getCurrntBidModel!.ownerOFBigBid!.fName
                                        .toString()),
                                    subtitle: Text(
                                        'Winning bid: ${cubit.getCurrntBidModel!.cURRENTBID.toString()} AED'),
                                  ),
                            state is ActionsShareAddBidLoading
                                ? Center(child: SpinkitWave())
                                : ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Enter Bid Amount'),
                                            content: Form(
                                              key: _formKey,
                                              child: TextFormField(
                                                controller: _amountController,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  labelText: 'Amount',
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Please enter an amount';
                                                  }
                                                  int enteredAmount =
                                                      int.tryParse(value)!;
                                                  cubit.getCurrntBidModel ==
                                                          null
                                                      ? comparedAmount =
                                                          initAmount
                                                      : comparedAmount = cubit
                                                          .getCurrntBidModel!
                                                          .tHENEXTOFFER;
                                                  // ignore: unnecessary_null_comparison
                                                  if (enteredAmount == null ||
                                                      enteredAmount <=
                                                          comparedAmount!) {
                                                    return 'Amount greater than ${comparedAmount}';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: text(title: 'Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: Text('Submit'),
                                                onPressed: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    String bidAmount =
                                                        _amountController.text;
                                                    cubit.postAddBid(
                                                        Id_Auctions:
                                                            ID_Auctions,
                                                        amountAuctions:
                                                            int.parse(
                                                                _amountController
                                                                    .text));
                                                    // Perform any logic or actions with the bid amount here
                                                    print(
                                                        'Bid amount: $bidAmount');
                                                    Navigator.of(context).pop();
                                                  }
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: text(
                                        title: 'Click to Pay', color: Color0),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
